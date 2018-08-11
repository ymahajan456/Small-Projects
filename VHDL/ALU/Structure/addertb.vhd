--test for adder
library ieee;
use ieee.std_logic_1164.all;
use std.textio.all;
use ieee.numeric_std.ALL;

entity tbadder is
end tbadder;

architecture test of tbadder is
	signal a,b,c : std_logic_vector(7 downto 0);
	signal cin : std_logic := '0';
	constant clk_p : time := 10 ns;

	component addSub8bit
		port( A,B : in std_logic_vector(7 downto 0);
				cin : in std_logic;
				output : out std_logic_vector(7 downto 0)
			);
	end component;

begin

	sim_process : process
	begin
		wait for clk_p;
		a <= "01001100"; 
	  	b <= "10001000";
		cin <= '1';
	end process;

	add : addSub8bit port map (a,b,cin,c);

end test;


