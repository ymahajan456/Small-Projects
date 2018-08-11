-- Comparators
---------------------------------------------------------------
--Basic Comparator Block

library ieee;
use ieee.std_logic_1164.all;
USE ieee.numeric_std.ALL;

entity compBlock is
	port(gp,ep,lp : in std_logic;
			ak,bk : in std_logic;
	     g,e,l : out std_logic);
end entity;

architecture structure of compBlock is 

	component andGate is	
		port( A, B : in std_logic;
		         F : out std_logic);
	end component;

	component orGate is	
		port( A, B : in std_logic;
		         F : out std_logic);
	end component;

	component xorGate is	
		port( A, B : in std_logic;
		         F : out std_logic);
	end component;

	component notGate is	
		port( A : in std_logic;
		      F : out std_logic);
	end component;

	signal gn : std_logic_vector(2 downto 0);
	signal en : std_logic_vector(1 downto 0);
	signal ln : std_logic_vector(2 downto 0);
 
	begin

	gnNot0 : notGate port map (bk,gn(0));  --~bk
	gnAnd0 : andGate port map (ak,gn(0),gn(1));  --ak.~bk
	gnAnd1 : andGate port map (gn(1),ep,gn(2));
	gnOr0  : orGate  port map (gn(2),gp,g);

	enXor0 : xorGate port map (ak,bk,en(0));
	enNot0 : notGate port map (en(0),en(1));
	enAnd0 : andGate port map (en(1),ep,e);

	lnNot0 : notGate port map (ak,ln(0));  --~bk
	lnAnd0 : andGate port map (bk,ln(0),ln(1));  --ak.~bk
	lnAnd1 : andGate port map (ln(1),ep,ln(2));
	lnOr0  : orGate  port map (ln(2),lp,l);	

end architecture;

---------------------------------------------------------------

-- 4 bit comparator

library ieee;
use ieee.std_logic_1164.all;
USE ieee.numeric_std.ALL;

entity comp4bit is
	port (clk,rst : in std_logic;
				 a,b : in std_logic_vector(3 downto 0);
			  g,e,l : out std_logic);
end entity;

architecture structure of comp4bit is

	component compBlock is
		port(gp,ep,lp : in std_logic;
				ak,bk : in std_logic;
			  g,e,l : out std_logic);
	end component;

	signal gTmp,eTmp,lTmp : std_logic_vector(2 downto 0);

	begin

	cmp3 : compBlock port map ('0','1','0',a(3),b(3),gTmp(0),eTmp(0),lTmp(0));
	cmp2 : compBlock port map (gTmp(0),eTmp(0),lTmp(0),a(2),b(2),gTmp(1),eTmp(1),lTmp(1));
	cmp1 : compBlock port map (gTmp(1),eTmp(1),lTmp(1),a(1),b(1),gTmp(2),eTmp(2),lTmp(2));
	cmp0 : compBlock port map (gTmp(2),eTmp(2),lTmp(2),a(0),b(0),g,e,l);

end architecture;
---------------------------------------------------------------
			


			
