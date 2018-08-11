library ieee;
use ieee.std_logic_1164.all;
USE ieee.numeric_std.ALL;

--AND Gate
entity andGate is	
   port( A, B : in std_logic;
            F : out std_logic);
end andGate;

architecture func of andGate is 
begin
   F <= A and B;
end func;

--NAND Gate
library ieee;
use ieee.std_logic_1164.all;
USE ieee.numeric_std.ALL;

entity nandGate is	
   port( A, B : in std_logic;
            F : out std_logic);
end nandGate;

architecture func of nandGate is 
begin
   F <= A nand B;
end func;

--OR Gate
library ieee;
use ieee.std_logic_1164.all;
USE ieee.numeric_std.ALL;

entity orGate is 
   port(	A, B : in std_logic;
            F : out std_logic);
end orGate;

architecture func of orGate is 
begin
   F <= A or B;
end func;

--NOR Gate
library ieee;
use ieee.std_logic_1164.all;
USE ieee.numeric_std.ALL;

entity norGate is	
   port(	A, B : in std_logic;
            F : out std_logic);
end norGate;

architecture func of norGate is 
begin
   F <= A nor B;
end func;

--XOR Gate
library ieee;
use ieee.std_logic_1164.all;
USE ieee.numeric_std.ALL;

entity xorGate is	
   port(	A, B : in std_logic;
            F : out std_logic);
end xorGate;

architecture func of xorGate is 
begin
   F <= A xor B;
end func;

--NOT Gate
library ieee;
use ieee.std_logic_1164.all;
USE ieee.numeric_std.ALL;

entity notGate is	
   port(	A: in std_logic;
            F : out std_logic);
end notGate;

architecture func of notGate is 
begin
   F <= not A;
end func;






