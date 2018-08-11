library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use std.textio.all ;
use ieee.std_logic_textio.all; -- to compile add option --ieee=synopsys

entity testbench is
end entity;

architecture test of testbench is
	component ccu is 
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
	end component;
	
	signal clk, reset: std_logic := '0';
	signal capture, display, adc_run, adc_output_ready, mc_start, mc_done, mc_write: std_logic;
	signal mc_write_data, mc_read_data, adc_data, dac_data: std_logic_vector(7 downto 0);
	signal mc_address: std_logic_vector(12 downto 0);
	
begin

	testccu: ccu
		port map(
			clk, reset,
			capture, display,
			adc_run, adc_output_ready,
			adc_data, mc_start, mc_write,
			mc_address, mc_write_data, mc_read_data,
			mc_done, dac_data);
	process	--clock generation
	begin
		clk <= not clk;
		wait for 10 ns;	--20ns time period
	end process;
	
	process	--adcc process
		variable count: unsigned(7 downto 0) := (others => '0');	--send a counter as the data
	begin
		wait until (clk = '1');
		if(adc_run = '1') then	--if adc run is high
			count := unsigned((count) + 1);
			adc_data <= std_logic_vector(count);	--convert to std_logic_vector
			adc_output_ready <= '1';
			wait until (clk = '1');
			adc_output_ready <= '0';
			wait for 1 us;	--to hasten the process of running the simulation (1ms takes too long :P)
			adc_data <= (others => '0');	--set output to zero
		end if;
	end process;
	
	process	--sram process
		type memory is array(8191 downto 0) of std_logic_vector(7 downto 0);	--define a type for the memory
		variable ram : memory;	--act as the memory element	
	begin
		wait until (clk = '1');
		mc_done <= '0';
		if(mc_start = '1') then
			if(mc_write = '1') then	--wrtie process
				ram(to_integer(unsigned(mc_address))) := mc_write_data;	--convert address to integer
				wait for 100 ns;	--representational delay
				mc_done <= '1';
				wait until (clk = '1');
			elsif(mc_write = '0') then	--read process
				mc_read_data <= ram(to_integer(unsigned(mc_address)));
				wait for 100 ns;
				mc_done <= '1';
				wait until (clk = '1');
			end if;
		end if;
	end process;
	
	process	--main process
	begin
		reset <= '1';	--reset the ccu
		wait for 100 ns;
		reset <= '0';
		capture <= '1';
		display <= '0';
		wait for 9000 us;	--capture till all the memory is full
		
		display <= '1';	--then display	
		capture <= '0';
		
		wait;	--give stop time to stop the simulation 
		
	end process;
	

end architecture;
