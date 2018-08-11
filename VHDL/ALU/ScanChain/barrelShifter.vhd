 --Mux Array for 8 bit barrel shifter
 
library ieee;
use ieee.std_logic_1164.all;
USE ieee.numeric_std.ALL;

entity s1muxarray is
	port ( A : in std_logic_vector(7 downto 0);
			op : in std_logic;
			O : out std_logic_vector(7 downto 0)
		);
end s1muxarray;

architecture structure of s1muxarray is
	
	component mux21 is
		port ( A,B,S : in std_logic;
			   O : out std_logic);
	end component;

	signal zero : std_logic := '0';

begin

	m0 : mux21 port map ( zero,A(0),op,O(0));
	m1 : mux21 port map ( A(0),A(1),op,O(1));	
	m2 : mux21 port map ( A(1),A(2),op,O(2));
	m3 : mux21 port map ( A(2),A(3),op,O(3));
	m4 : mux21 port map ( A(3),A(4),op,O(4));
	m5 : mux21 port map ( A(4),A(5),op,O(5));
	m6 : mux21 port map ( A(5),A(6),op,O(6));
	m7 : mux21 port map ( A(6),A(7),op,O(7));

end structure;
---------------------------------------------------------------

-- s2muxarray

library ieee;
use ieee.std_logic_1164.all;
USE ieee.numeric_std.ALL;

entity s2muxarray is
	port ( A : in std_logic_vector(7 downto 0);
			op : in std_logic;
			O : out std_logic_vector(7 downto 0)
		);
end s2muxarray;

architecture structure of s2muxarray is
	
	component mux21 is
		port ( A,B,S : in std_logic;
			   O : out std_logic);
	end component;

	signal zero : std_logic := '0';

begin

	m0 : mux21 port map ( zero,A(0),op,O(0));
	m1 : mux21 port map ( zero,A(1),op,O(1));	
	m2 : mux21 port map ( A(0),A(2),op,O(2));
	m3 : mux21 port map ( A(1),A(3),op,O(3));
	m4 : mux21 port map ( A(2),A(4),op,O(4));
	m5 : mux21 port map ( A(3),A(5),op,O(5));
	m6 : mux21 port map ( A(4),A(6),op,O(6));
	m7 : mux21 port map ( A(5),A(7),op,O(7));

end structure;
---------------------------------------------------------------

-- s2muxarray

library ieee;
use ieee.std_logic_1164.all;
USE ieee.numeric_std.ALL;

entity s3muxarray is
	port ( A : in std_logic_vector(7 downto 0);
			op : in std_logic;
			O : out std_logic_vector(7 downto 0)
		);
end s3muxarray;

architecture structure of s3muxarray is
	
	component mux21 is
		port ( A,B,S : in std_logic;
			   O : out std_logic);
	end component;

	signal zero : std_logic := '0';

begin

	m0 : mux21 port map ( zero,A(0),op,O(0));
	m1 : mux21 port map ( zero,A(1),op,O(1));	
	m2 : mux21 port map ( zero,A(2),op,O(2));
	m3 : mux21 port map ( zero,A(3),op,O(3));
	m4 : mux21 port map ( A(0),A(4),op,O(4));
	m5 : mux21 port map ( A(1),A(5),op,O(5));
	m6 : mux21 port map ( A(2),A(6),op,O(6));
	m7 : mux21 port map ( A(3),A(7),op,O(7));

end structure;
---------------------------------------------------------------

-- rotater
library ieee;
use ieee.std_logic_1164.all;
USE ieee.numeric_std.ALL;

entity rotator is
	port (A : in std_logic_vector(7 downto 0);
	 		op: in std_logic;
			O : out std_logic_vector(7 downto 0)
		);
end rotator;

architecture structure of rotator is

	component mux21 is
		port ( A,B,S : in std_logic;
			   O : out std_logic);
	end component;

begin

	m0 : mux21 port map (A(7),A(0),op,O(0));
	m1 : mux21 port map (A(6),A(1),op,O(1));
	m2 : mux21 port map (A(5),A(2),op,O(2));
	m3 : mux21 port map (A(4),A(3),op,O(3));
	m4 : mux21 port map (A(3),A(4),op,O(4));
	m5 : mux21 port map (A(2),A(5),op,O(5));
	m6 : mux21 port map (A(1),A(6),op,O(6));
	m7 : mux21 port map (A(0),A(7),op,O(7));

end structure;

---------------------------------------------------------------
-- barrel shifter

library ieee;
use ieee.std_logic_1164.all;
USE ieee.numeric_std.ALL;

entity barrelShifter is
	port ( A : in std_logic_vector(7 downto 0);
			op : in std_logic_vector(2 downto 0);
			O : out std_logic_vector(7 downto 0)
		);
end barrelShifter;

architecture structure of barrelShifter is
	
	component s3muxarray is
	port ( A : in std_logic_vector(7 downto 0);
			op : in std_logic;
			O : out std_logic_vector(7 downto 0)
		);
	end component;

	component s2muxarray is
	port ( A : in std_logic_vector(7 downto 0);
			op : in std_logic;
			O : out std_logic_vector(7 downto 0)
		);
	end component;

	component s1muxarray is
	port ( A : in std_logic_vector(7 downto 0);
			op : in std_logic;
			O : out std_logic_vector(7 downto 0)
		);
	end component;
 
	signal o1,o2 : std_logic_vector(7 downto 0);

begin
	
	s1 : s1muxarray port map (A,op(0),o1);
	s2 : s2muxarray port map (o1,op(1),o2);
	s3 : s3muxarray port map (o2,op(2),O);

end structure;
---------------------------------------------------------------

--0 output checker
library ieee;
use ieee.std_logic_1164.all;
USE ieee.numeric_std.ALL;

entity zeroShiftChk is
	port (A,B : in std_logic_vector(7 downto 0);
			O : out std_logic_vector(7 downto 0)
		);
end zeroShiftChk;

architecture structure of zeroShiftChk is
	
	component mux21 is
		port ( A,B,S : in std_logic;
			   O : out std_logic);
	end component;

	component orGate is 
   port(	A, B : in std_logic;
            F : out std_logic);
	end component;

	signal zero : std_logic := '0';
	signal o1,o2,o3,op : std_logic;

begin

	or1 : orGate port map (B(3),B(4),o1);
	or2 : orGate port map (B(5),B(6),o2);
	or3 : orGate port map (o1,o2,o3);
	or4 : orGate port map (B(7),o3,op);

	m0 : mux21 port map (zero,A(0),op,O(0));
	m1 : mux21 port map (zero,A(1),op,O(1));
	m2 : mux21 port map (zero,A(2),op,O(2));
	m3 : mux21 port map (zero,A(3),op,O(3));
	m4 : mux21 port map (zero,A(4),op,O(4));
	m5 : mux21 port map (zero,A(5),op,O(5));
	m6 : mux21 port map (zero,A(6),op,O(6));
	m7 : mux21 port map (zero,A(7),op,O(7));

end structure;	
	
---------------------------------------------------------------
--left/right shifter

-- op = 0 for right
-- op = 1 for left
library ieee;
use ieee.std_logic_1164.all;
USE ieee.numeric_std.ALL;

entity shifter8bit is
	port (A,B : in std_logic_vector(7 downto 0);
			op : in std_logic;
			O : out std_logic_vector(7 downto 0)
		);
end shifter8bit;

architecture structure of shifter8bit is

	component barrelShifter is
	port ( A : in std_logic_vector(7 downto 0);
			op : in std_logic_vector(2 downto 0);
			O : out std_logic_vector(7 downto 0)
		);
	end component;

	component rotator is
	port (A : in std_logic_vector(7 downto 0);
	 		op: in std_logic;
			O : out std_logic_vector(7 downto 0)
		);
	end component;

	component zeroShiftChk is
	port (A,B : in std_logic_vector(7 downto 0);
			O : out std_logic_vector(7 downto 0)
		);
	end component;
	
	component notGate is	
  	 port(A: in std_logic;
            F : out std_logic);
	end component;

	signal o1,o2,o3 : std_logic_vector(7 downto 0); 
	signal shiftin : std_logic_vector(2 downto 0);
	signal op1 : std_logic;

begin
	
	shiftin(2 downto 0) <= B(2 downto 0);
	ng : notGate port map (op,op1);
	ro : rotator port map (A,op1,o1);
	bs : barrelShifter port map (o1,shiftin,o2);
	zoc : zeroShiftChk port map (o2,B,o3);
	ro1 : rotator port map (o3,op1,O);
	
end structure;

	
