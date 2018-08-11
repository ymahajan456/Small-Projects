--CCU----------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity cpccu is 
	port(
		clk, reset, capture, display : in std_logic;
		adc_run : out std_logic := '0';
		adc_output_ready : in std_logic;
		mc_start, mc_write : out std_logic := '0';
		mc_done : in std_logic;
		T : out std_logic_vector(7 downto 0);
		S : in std_logic);
end entity;

architecture control of cpccu is  
	
	type FSMstate is (rest, wr, getADC, wrOnRAM, updateWr, rd, readRAM, wait1, wait2, updateRd);
	signal fsm_state, next_state : FSMstate;
	
	begin
	
	process(clk)
	begin
		if(clk'event and clk = '1') then
			fsm_state <= next_state;
		end if;
	end process;
	
	process(fsm_state, reset, capture, display, adc_output_ready, mc_done, s)

		variable mc_start_tmp : std_logic := '0';
		variable Tvar : std_logic_vector(7 downto 0); 
		
		begin
		
		Tvar := (others => '0');		
		next_state <= fsm_state;
		mc_start_tmp := '0';
		mc_write <= '0';
		adc_run <= '0';
		
		if(reset = '1') then
			next_state <= rest;
			Tvar(7) := '1';
		else
		case fsm_state is
		
			when rest => 
				mc_write <= '0';
				adc_run <= '0';
				Tvar(0) := '0';  --clear signals except curr address
				if(capture = '1')then
					next_state <= wr;
				elsif ((capture = '0') and (display = '1')) then
					next_state <= rd;
				else
					next_state <= rest;
				end if;
			when wr =>            
				adc_run <= '1';    --start ADC
				mc_write <= '1';   --set write as RAM op
				next_state <= getADC;
			when getADC =>
				adc_run <= '1';    --start ADC
				mc_write <= '1';   --set write as RAM op
				if(adc_output_ready = '1') then
					Tvar(1) := '1';   --adc reg enable
					next_state <= wrOnRAM;
				end if;
			when wrOnRAM =>
				adc_run <= '1';    --start ADC
				mc_write <= '1';   --set write as RAM op
				mc_start_tmp := '1';
				if(mc_done = '1')then
					mc_start_tmp := '0';
					next_state <= updateWr;
				end if;
			when updateWr => 
				adc_run <= '1';    --start ADC
				mc_write <= '1';   --set write as RAM op
				Tvar(2) := '1';     --increase current address;
				if(capture = '0') then
					next_state <= rest;
				else 
					next_state <= getADC;
				end if;
			when rd =>
				mc_write <= '0';
				Tvar(3) := '1';   --load 1ms counter
				next_state <= readRAM;
			when readRAM =>
				mc_start_tmp := '1';
				Tvar(4) := '1';    --count start
				next_state <= wait1;
			when wait1 =>
				Tvar(4) := '1';   --continue counting
				mc_start_tmp := '1'; --maintain start signal
				if(mc_done =  '1') then
					Tvar(5) := '1';  --output ready, Enable RAMoutReg
					mc_start_tmp := '0';
					next_state <= wait2;
				end if;
			when wait2 => 
				Tvar(4) := '1';     --continue counting
				if(s = '1') then 
					next_state <= updateRd;
				end if;
			when updateRd =>
				Tvar(6) := '1';   --reload 1ms counter, outregEnable, increase curr address
				if((capture = '1') or (display = '0')) then
					next_state <= rest;
				else
					next_state <= readRAM;
				end if;
		end case;
		end if;
		T <= Tvar;
		mc_start <= mc_start_tmp;
		
	end process;
	
end architecture;
---------------------------------------------------------------

--CCU Data Path------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.basic.all;

entity dpccu is
	port(
		clk, reset : in std_logic;
		T : in std_logic_vector(7 downto 0);
		s : out std_logic;
		adc_data : in std_logic_vector(7 downto 0);
		mc_address : out std_logic_vector(12 downto 0);
		mc_write_data : out std_logic_vector(7 downto 0);
		mc_read_data : in std_logic_vector(7 downto 0);
		dac_data : out std_logic_vector(7 downto 0));
end entity;

architecture flow of dpccu is 
	
	signal countms, countms_in : std_logic_vector(15 downto 0);
	signal adcData_in, adcData : std_logic_vector(7 downto 0);
	signal RAMoutReg, RAMoutReg_in : std_logic_vector(7 downto 0);
	signal DACreg, DACreg_in : std_logic_vector(7 downto 0);
	signal curr_address, curr_address_in : std_logic_vector(12 downto 0) := (others => '0');
	signal addRegEnable, adcDataRegEna : std_logic := '0';
	signal countmsEna, RAMoutRegEna, DACregEna : std_logic := '0';
	
begin

	s <= '1' when (countms = "0000000000000000") else '0';
	mc_address <= curr_address;
	mc_write_data <= adcData;
	dac_data <= DACreg;
	
	--curent address reg---
	curr_address_in <= std_logic_vector(unsigned(curr_address) + 1) when ((t(2) or t(6)) = '1') else
		(others => '0');
	addRegEnable <= (t(2) or t(7) or t(6));
	cr : my_reg generic map(13)
	port map(clk, addRegEnable, curr_address_in, curr_address);
	
	--ADC data Reg---
	adcDataRegEna <= t(1);
	adcData_in <= adc_data;
	adcdr : my_reg generic map(8)
	port map(clk, adcDataRegEna, adcData_in, adcData);
	
	--1 ms counter---
	countms_in <= (std_logic_vector(to_unsigned(49998, 16))) when ((t(6) = '1') or (T(3) = '1')) 
		else std_logic_vector(unsigned(countms)-1);
	countmsEna <= (t(3) or t(4) or t(6));
	countr : my_reg generic map(16)
	port map(clk, countmsEna, countms_in, countms);
	
	--RAMoutReg----
	RAMoutReg_in <= mc_read_data;
	RAMoutRegEna <= t(5);
	RAMR : my_reg generic map(8)
	port map(clk, RAMoutRegEna, RAMoutReg_in, RAMoutReg);
	
	--DAC REG ------
	
	DACreg_in <= RAMoutReg;
	DACregEna <= t(6);
	DACr : my_reg generic map(8)
	port map(clk, DACregEna, DACreg_in, DACreg);
	
end architecture;
	
	

--CCU----------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ccu is 
	port(
		clk, reset : in std_logic;
		capture, display : in std_logic;
		adc_run : out std_logic;
		adc_output_ready : in std_logic;
		adc_data : in std_logic_vector(7 downto 0);
		mc_start, mc_write : out std_logic;
		mc_address : out std_logic_vector(12 downto 0);
		mc_write_data : out std_logic_vector(7 downto 0);
		mc_read_data : in std_logic_vector(7 downto 0);
		mc_done : in std_logic;
		dac_data : out std_logic_vector(7 downto 0));
end entity;

architecture rtl of ccu is

	component cpccu is 
		port(
			clk, reset, capture, display : in std_logic;
			adc_run : out std_logic := '0';
			adc_output_ready : in std_logic;
			mc_start, mc_write : out std_logic := '0';
			mc_done : in std_logic;
			T : out std_logic_vector(7 downto 0);
			S : in std_logic);
	end component;
	
	component dpccu is  
		port(
			clk, reset : in std_logic;
			T : in std_logic_vector(7 downto 0);
			s : out std_logic;
			adc_data : in std_logic_vector(7 downto 0);
			mc_address : out std_logic_vector(12 downto 0);
			mc_write_data : out std_logic_vector(7 downto 0);
			mc_read_data : in std_logic_vector(7 downto 0);
			dac_data : out std_logic_vector(7 downto 0));
	end component;
	
	signal T : std_logic_vector(7 downto 0);
	signal s : std_logic;
	
	begin
	
	cp : cpccu 
	port map(clk, reset, capture, display, adc_run, adc_output_ready, mc_start, mc_write, mc_done, T, s);
	
	dp : dpccu
	port map(clk, reset, T, s, adc_data, mc_address, mc_write_data, mc_read_data, dac_data);
end architecture;

