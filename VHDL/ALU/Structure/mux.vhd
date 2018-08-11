-- general input 
--1. starting from higher bit to lower bit Vector
--2. selection vector from higher to lower
--3. output
---------------------------------------------------------------
--2:1 MUX
library ieee;
use ieee.std_logic_1164.all;
USE ieee.numeric_std.ALL;

entity mux21 is
	port ( A,B,S : in std_logic;
			   O : out std_logic);
end mux21;

architecture structure of mux21 is 
	
	component andGate is -- import AND Gate
      port( A, B : in std_logic;
               F : out std_logic);
   end component;

   component orGate is -- import XOR Gate
      port( A, B : in std_logic;
               F : out std_logic);
   end component;

	component notGate is -- import XOR Gate
      port( A: in std_logic;
               F : out std_logic);
   end component;

	signal and1, and2,nots : std_logic;

begin
	G0 : notGate port map (S,nots);
	G1 : andGate port map (A,S,and1);
	G2 : andGate port map (B,nots,and2);
	G3 : orGate port map (and1,and2,O);

end structure;
---------------------------------------------------------------

--4:1 Mux
library ieee;
use ieee.std_logic_1164.all;
USE ieee.numeric_std.ALL;

entity mux41 is
	port ( A : in std_logic_vector(3 downto 0);
			S : in std_logic_vector(1 downto 0);
			O : out std_logic );
end mux41;

architecture structure of mux41 is

	component mux21 is
		port ( A,B,S : in std_logic;
			   O : out std_logic);
	end component;

	signal selection1,selection2 : std_logic;

begin

	M1 : mux21 port map (A(1),A(0),S(0),selection1);
	M2 : mux21 port map (A(3),A(2),S(0),selection2);	
	M3 : mux21 port map (selection2,selection1,S(1),O);

end structure;
---------------------------------------------------------------

--2:1 8Bit Bus MUX
library ieee;
use ieee.std_logic_1164.all;
USE ieee.numeric_std.ALL;

entity bus8mux21 is
	port ( A,B : in std_logic_vector(7 downto 0);
			op : in std_logic;
			O : out std_logic_vector(7 downto 0)
		);
end bus8mux21;

architecture structure of bus8mux21 is
	
	component mux21 is
		port ( A,B,S : in std_logic;
			   O : out std_logic);
	end component;

	begin 

	m0 : mux21 port map (A(0),B(0),op,O(0));
	m1 : mux21 port map (A(1),B(1),op,O(1));
	m2 : mux21 port map (A(2),B(2),op,O(2));
	m3 : mux21 port map (A(3),B(3),op,O(3));
	m4 : mux21 port map (A(4),B(4),op,O(4));
	m5 : mux21 port map (A(5),B(5),op,O(5));
	m6 : mux21 port map (A(6),B(6),op,O(6));
	m7 : mux21 port map (A(7),B(7),op,O(7));

end structure;
	
	
			
