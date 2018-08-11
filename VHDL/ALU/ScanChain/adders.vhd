--Half Adder
library ieee;
use ieee.std_logic_1164.all;
USE ieee.numeric_std.ALL;

entity halfAdder is
   port( A, B : in std_logic;
    sum, Cout : out std_logic);
end halfAdder;

architecture halfAdder of halfAdder is

   component andGate is -- import AND Gate
      port( A, B : in std_logic;
               F : out std_logic);
   end component;

   component xorGate is -- import XOR Gate
      port( A, B : in std_logic;
               F : out std_logic);
   end component;

	begin
		
   G1 : xorGate port map(A => A, B => B, F => sum);
   G2 : andGate port map(A => A, B => B, F => Cout);
end halfAdder;
---------------------------------------------------------------
--full Adder
library ieee;
use ieee.std_logic_1164.all;
USE ieee.numeric_std.ALL;

entity fullAdder is
   port( A, B, Cin : in std_logic;
         sum, Cout : out std_logic);
end fullAdder;

architecture fullAdder of fullAdder is

   component halfAdder is --import Half Adder entity
      port( A, B  : in std_logic;
        sum, Cout : out std_logic);
   end component;

   component orGate is --import OR Gate entity
      port( A, B : in std_logic;
             F : out std_logic);
   end component;
	
   signal halfTohalf, halfToOr1, halfToOr2: std_logic;

begin
   G1: halfAdder port map(A,B,halfTohalf , halfToOr1 );
   G2: halfAdder port map(halfTohalf, Cin, sum, halfToOr2);
   G3: orGate port map(halfToOr1, halfToOr2, Cout);
end fullAdder;

---------------------------------------------------------------
--8bit Adder 
library ieee;
use ieee.std_logic_1164.all;
USE ieee.numeric_std.ALL;

entity adder8bit is
	port( A,B : in std_logic_vector(7 downto 0);
			cin : in std_logic;
			sum : out std_logic_vector(7 downto 0)
		);
end adder8bit;

architecture func of adder8bit is

	component fullAdder is
		port (  A, B, Cin : in std_logic;
         sum, Cout : out std_logic);
	end component;

	signal c : std_logic_vector(7 downto 0);

begin
	a0 : fullAdder port map(A(0),B(0),cin,sum(0),c(0));
	a1 : fullAdder port map(A(1),B(1),c(0),sum(1),c(1));
	a2 : fullAdder port map(A(2),B(2),c(1),sum(2),c(2));
	a3 : fullAdder port map(A(3),B(3),c(2),sum(3),c(3));
	a4 : fullAdder port map(A(4),B(4),c(3),sum(4),c(4));
	a5 : fullAdder port map(A(5),B(5),c(4),sum(5),c(5));
	a6 : fullAdder port map(A(6),B(6),c(5),sum(6),c(6));
	a7 : fullAdder port map(A(7),B(7),c(6),sum(7),c(7));
end func;

	
