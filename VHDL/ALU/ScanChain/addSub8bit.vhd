--8 bit adder subtractor
library ieee;
use ieee.std_logic_1164.all;
USE ieee.numeric_std.ALL;

entity addSub8bit is
	port( A,B : in std_logic_vector(7 downto 0);
			cin : in std_logic;
			output : out std_logic_vector(7 downto 0)
		);
end addSub8bit;

architecture func of addSub8bit is

	component adder8bit is
		port( A,B : in std_logic_vector(7 downto 0);
			cin : in std_logic;
			sum : out std_logic_vector(7 downto 0)
		);
	end component;

	component xorGate is
		 port(	A, B : in std_logic;
            F : out std_logic);
	end component;

	signal b_mid : std_logic_vector(7 downto 0);

begin
	oxr0 : xorGate port map (B(0),cin,b_mid(0));
	oxr1 : xorGate port map (B(1),cin,b_mid(1));
	oxr2 : xorGate port map (B(2),cin,b_mid(2));
	oxr3 : xorGate port map (B(3),cin,b_mid(3));
	oxr4 : xorGate port map (B(4),cin,b_mid(4));
	oxr5 : xorGate port map (B(5),cin,b_mid(5));
	oxr6 : xorGate port map (B(6),cin,b_mid(6));
	oxr7 : xorGate port map (B(7),cin,b_mid(7));
	adder : adder8bit port map (A,b_mid,cin,output);

end func;
