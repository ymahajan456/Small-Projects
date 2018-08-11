library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

package adcc_parts is

	component adcc_control is
		port (
			clk, reset: in std_logic;
			adc_run: in std_logic;
			adc_output_ready: out std_logic;
			WR_bar, RD_bar, CS_bar: out std_logic;
			INTR_bar: in std_logic;
			T: out std_logic_vector(4 downto 0);
			S: in std_logic_vector(1 downto 0));
			
	end component;

	component adcc_data is	
		port (
			clk: in std_logic;
			adc_data: out std_logic_vector(7 downto 0);
			data_in: in std_logic_vector(7 downto 0);
			T: in std_logic_vector(4 downto 0);
			S: out std_logic_vector(1 downto 0));
			
	end component;

end package;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity adcc_control is
	port (
		clk, reset: in std_logic;
		adc_run: in std_logic;
		adc_output_ready: out std_logic;
		WR_bar, RD_bar, CS_bar: out std_logic;
		INTR_bar: in std_logic;
		T: out std_logic_vector(4 downto 0);
		S: in std_logic_vector(1 downto 0));
		
end entity;

architecture control of adcc_control is
	type state is (ready, wr, rd, rd_start, o_ready, done);
	signal Q, nQ: state;
	signal wr_temp, rd_temp, cs_temp, intr_temp: std_logic;
begin

	process(clk)	--delay process
	begin
		if(clk'event and clk='1') then
			Q <= nQ;
			WR_bar <= wr_temp;
			RD_bar <= rd_temp;
			CS_bar <= cs_temp;
			intr_temp <= INTR_bar;
		end if;
	end process;
	
	process(Q, S, adc_run, intr_temp, reset)
		variable T_temp: std_logic_vector(4 downto 0);
		
	begin
		T_temp := "00000";
		wr_temp <= '1';
		rd_temp <= '1';
		cs_temp <= '0';
		adc_output_ready <= '0';
		nQ <= Q;
		
		if (reset='1') then	--check for reset
			nQ <= ready;	--reset the FSM to ready state
			cs_temp <= '1';
		else
			case Q is
				when ready =>
					cs_temp <= '1';
					if (adc_run = '1') then
						nQ <= wr;			--goto the write state
						T_temp(0) := '1'; 	--instantiate the 1ms down counter
						T_temp(1) := '1';	--instantiate the 100ns down counter
			
					end if;
					
				when wr =>
					T_temp(2) := '1';		--subtract one from the 1ms counter
					T_temp(3) := '1';		--subtract one from the 100ns counter
					wr_temp <= '0';
					if(S(0) = '1') then 	--more than 100ns passed
						nQ <= rd_start;
					end if;
				
				when rd_start =>
					T_temp(2) := '1';		--subtract one from the 1ms counter
					if(intr_temp = '0') then	--if ADC has completed conversion
						T_temp(1) := '1';	--instantiate the 100ns down counter
						nQ <= rd;			--goto read state
					end if;
					
				when rd =>
					T_temp(2) := '1';		--subtract one from the 1ms counter
					T_Temp(3) := '1';		--subtract one from the 100ns counter
					rd_temp <= '0';
					if(S(0) = '1') then 	--more than 100ns passed
						nQ <= o_ready;
						T_temp(4) := '1';	--store the output of the ADC
					end if;
					
				when o_ready =>
					adc_output_ready <= '1';
					cs_temp <= '1';
					T_temp(2) := '1';		--subtract one from the 1ms counter
					nQ <= done;
					
				when done =>
					cs_temp <= '1';
					T_temp(2) := '1';		--subtract one from the 1ms counter
					if ((S(1) = '1')) then		--more than 1ms passed
						nQ <= ready;
					end if;
					
				when others =>
					nQ <= ready;
			end case;
			
		end if;
		T <= T_temp;
	end process;
	
end architecture;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.basic.all;

entity adcc_data is	
	port (
		clk: in std_logic;
		adc_data: out std_logic_vector(7 downto 0);
		data_in: in std_logic_vector(7 downto 0);
		T: in std_logic_vector(4 downto 0);
		S: out std_logic_vector(1 downto 0));
		
end entity;

architecture data of adcc_data is
	signal countns, countns_in: std_logic_vector(4 downto 0);
	signal countms, countms_in: std_logic_vector(15 downto 0);
	signal countns_ena, countms_ena: std_logic;
	signal data, data_reg_in: std_logic_vector(7 downto 0);
	signal data_ena: std_logic;
begin

	----------------
	--Data Register
	----------------
	
	data_reg_in <= data_in;
	data_ena <= T(4);
	data_reg: my_reg
		generic map(8)
		port map(
			din => data_reg_in, dout => data, clk => clk, ena => data_ena
		);
	
	adc_data <= data;
	
	S(0) <= '1' when (countns = "00000") else '0';	--more that 100ns passed
	S(1) <= '1' when (countms = "0000000000000000") else '0';	--1ms passed

	-----------------
	-->100ns Register
	-----------------
	countns_in <= "10110" when (T(1) = '1') 
		else std_logic_vector(unsigned(countns)-1);
		
	countns_ena <= T(1) or T(3);
	countns_Reg: my_reg
		generic map(5)
		port map(
			din => countns_in, dout => countns, clk => clk, ena => countns_ena);
	
	---------------
	--1ms Register
	---------------
	
	countms_in <= (std_logic_vector(to_unsigned(49998,16))) when (T(0) = '1') 
		else std_logic_vector(unsigned(countms)-1);
		
	countms_ena <= T(0) or T(2);
	countms_Reg: my_reg
		generic map(16)
		port map(
			din => countms_in, dout => countms, clk => clk, ena => countms_ena);
end architecture;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.adcc_parts.all;

entity adcc is
	port (
		clk, reset: in std_logic;
		adc_run: in std_logic;
		adc_output_ready: out std_logic;
		adc_data: out std_logic_vector(7 downto 0);
		data_in: in std_logic_vector(7 downto 0);
		WR_bar, RD_bar, CS_bar: out std_logic;
		INTR_bar: in std_logic);
end entity;

architecture rtl of adcc is
	signal T: std_logic_vector(4 downto 0);
	signal S: std_logic_vector(1 downto 0);
	
begin 
	control: adcc_control
		port map(
		clk => clk, reset => reset, adc_run => adc_run,
		adc_output_ready => adc_output_ready, 
		WR_bar => WR_bar, RD_bar => RD_bar, CS_bar => CS_bar,
		INTR_bar => INTR_bar, T => T, S => S
		);
		
	data: adcc_data
		port map(
		clk => clk,
		data_in => data_in,
		adc_data => adc_data,
		T => T, S => S
		);
		
end architecture;
