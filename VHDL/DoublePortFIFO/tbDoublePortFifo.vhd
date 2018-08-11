library ieee;
use ieee.std_logic_1164.all;
use std.textio.all;
use ieee.numeric_std.ALL;
use ieee.std_logic_textio.all;

entity tbDoublePortFIFO is
end entity;

architecture behav of tbDoublePortFIFO is
	component doubleport_fifo is
		generic(
			depth 		: integer := 32;
			word_length : integer := 5); 
		port(
			fifo_in0 : in std_logic_vector(word_length-1 downto 0);
			fifo_in1 : in std_logic_vector(word_length-1 downto 0);
			fifo_out0 : out std_logic_vector(word_length-1 downto 0);
			fifo_out1 : out std_logic_vector(word_length-1 downto 0);
			valid_out0, valid_out1, full, only_one_empty : out std_logic;
			wr0, wr1, rd0, rd1, clk, rst : in std_logic);
	end component;
	
	function vec_to_str(x:std_logic_vector) return String is
		variable L : Line;
		variable W : String(1 to x'length) :=(others => ' ');
		begin
		write(L,x);
		W(L.all'range) := L.all;
		Deallocate(L);
		return W;
	end vec_to_str;

	function to_string(x: string) return string is
		variable ret_val: string(1 to x'length);
		alias lx : string (1 to x'length) is x;
	begin  
		ret_val := lx;
		return(ret_val);
	end to_string;
	
	constant word_length : integer := 5;
	constant depth : integer := 32;
	constant clk_p : time := 20 ns;
	signal clk, rst : std_logic := '0';
	signal wr0, wr1, rd0, rd1 : std_logic := '0';
	signal valid_out0, valid_out1, only_one_empty, full : std_logic;
	signal fifo_in0, fifo_in1 : std_logic_vector(word_length-1 downto 0) := (others => '0');
	signal fifo_out0, fifo_out1 : std_logic_vector(word_length-1 downto 0);
	
begin

	clk_process : process
	begin
		wait for clk_p/2;
		clk <= '1';
		wait for clk_p/2;
		clk <= '0';
	end process;
	
	sim_process : process
	begin
		rst <= '1';
		wait until clk = '1';
		wait until clk = '0';
		wait until clk = '1';
		wait until clk = '0';
		rst <= '0';
		wait until clk = '1';
		wait until clk = '0';
		fifo_in0 <= "11011";
		fifo_in1 <= "11111";
		wr0 <= '1';
		wait until clk = '1';
		wait until clk = '0';
		wr1 <= '1';
		fifo_in0 <= "01010";
		rd0 <= '1';
		rd1 <= '1';
		wait until clk = '1';
		wait until clk = '0';
		wr0 <= '0';
		wr1 <= '0';
		rd0 <= '0';
		rd1 <= '0';
		wait until clk = '1';
		wait until clk = '0';
		wait until clk = '1';
		wait until clk = '0';
	end process;

	DP : doubleport_fifo generic map(32, 5)
	port map(fifo_in0, fifo_in1, fifo_out0, fifo_out1, valid_out0, valid_out1,
			full, only_one_empty, wr0, wr1, rd0, rd1, clk, rst);
end architecture;
