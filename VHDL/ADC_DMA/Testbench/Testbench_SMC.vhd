library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use std.textio.all ;
use ieee.std_logic_textio.all; -- to compile add option --ieee=synopsys

entity testbench is
end entity;

architecture test of testbench is

	component smc is
		port (
			clk, reset : in std_logic;
			mc_start, mc_write: in std_logic;
			mc_done: out std_logic;
			OE_bar, CS_bar, WE_bar: out std_logic;
			IO: inout std_logic_vector(7 downto 0);
			A: out std_logic_vector(12 downto 0);
			mc_write_data: in std_logic_vector(7 downto 0);
			mc_read_data: out std_logic_vector(7 downto 0);
			mc_address: in std_logic_vector(12 downto 0));
	end component;
	
	signal mc_address: std_logic_vector(12 downto 0);
	signal mc_read_data, mc_write_data: std_logic_vector(7 downto 0);
	signal mc_start, mc_done, mc_write: std_logic;
	signal clk, reset : std_logic := '0';
	signal IO: std_logic_vector(7 downto 0);
begin
	DUT: smc
		port map(
		clk => clk, reset => reset,
		mc_address => mc_address, mc_start => mc_start,
		mc_write_data => mc_write_data, mc_read_data => mc_read_data,
		mc_done => mc_done, mc_write => mc_write, IO => IO);
		
	clock :process
	begin
		wait for 50 ns;
		clk <= not clk;
	end process;
	
	--main process
	main : process
		file fin : text open read_mode is "tracefile.txt";	--tracefile to be read
		variable test: std_logic_vector(7 downto 0);	--Input test case
		
		variable Lin : line ;	--Line for input file
		
	begin
	
		--RESET the FSM
		reset <= '1';
		wait for 40 ns;
		reset <= '0';
		mc_address <= "0000000000000";	--check at a constant address
		wait until clk = '1';
		while not endfile(fin) loop	--read inputs from the file
			readline(fin,Lin);
			read(Lin, test);
			mc_address <= std_logic_vector(unsigned(mc_address) + 1);
			mc_start <= '1';
			mc_write <= '1';
			mc_write_data <= test;
			IO <= (others => 'Z');	--in write mode behaviour of SRAM
			wait until (mc_done = '1');
			mc_start <= '0';
			mc_write <= '0';
			wait until (mc_done = '0');
			wait until (clk'event and clk = '1');
			mc_start <= '1';
			IO <= not test;	--give the input from the SRAM
			wait until (mc_done = '0');
		end loop;
		wait;
	end process;
end architecture;
