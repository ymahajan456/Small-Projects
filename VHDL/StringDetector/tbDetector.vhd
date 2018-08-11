--test Bench for String Detector

library ieee;
use ieee.std_logic_1164.all;
use std.textio.all;
use ieee.numeric_std.ALL;
use ieee.std_logic_textio.all;

entity tbDetector is 
end entity;

architecture test of tbDetector is 
	
	function vec_to_str(x:std_logic_vector) return String is
		variable L : Line;
		variable W : String(1 to x'length) :=(others => ' ');
		begin
		write(L,x);
		W(L.all'range) := L.all;
		Deallocate(L);
		return W;
	end vec_to_str;

	signal x : std_logic_vector(4 downto 0);
	signal clk,y : std_logic;
	signal rst : std_logic ; 
	constant clk_p : time := 10 ns;
	signal debug : std_logic_vector(1 downto 0);	

	component detector is
	port ( clk : in std_logic;
			rst : in std_logic;
			x : in std_logic_vector(4 downto 0);
			y : out std_logic);
	end component;

	begin

	clk_process : process
	begin
       	  clk <= '1';
	  wait for clk_p/2;
	  clk <= '0';
	  wait for clk_p/2;
	end process;
	
	sim_process : process
	file f : text open read_mode is "tbStrDetector.txt";
	variable L : line;
	variable fail : integer :=0;
	variable x_tmp : std_logic_vector(4 downto 0);
	variable y_expected : std_logic;

	begin
	rst <= '1';
	wait for clk_p;
	rst <= '0';
	while not endfile(f) loop	
		readline (f,L);
		read (L,x_tmp);
		read (L,y_expected);
		x <= x_tmp;
		debug(1) <= y_expected;
		debug(0) <= y;
		wait for 2 ns;
	if not(y_expected = y) then
		fail := fail +1;
		assert false report "Error. Input is" & vec_to_str(x) & " Expected & observed " & vec_to_str(debug)  severity note;
		end if;
		wait for 8 ns;
	end loop; 
	
	assert false report "Test Completed " & integer'image(fail) & " failures" severity note; 
	wait; 
	end process;

	DUT : detector port map(clk,rst,x,y);
end architecture; 
	
