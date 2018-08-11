--16 Bit Divider RTL Model
		
-----Divider---------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use std.textio.all;
use ieee.numeric_std.ALL;

entity divider16bit is
	port ( clk,rst : in std_logic;
				dividend,divisor : in std_logic_vector(15 downto 0);
				input_ready : in std_logic;
				divider_ready : out std_logic;
				quotient : out std_logic_vector(15 downto 0);
				remainder : out std_logic_vector(15 downto 0);
				output_ready : out std_logic;
				output_accepted : in std_logic);
end entity;

architecture structure of divider16bit is	

	component controlPath is
		port ( clk,rst : in std_logic;
				input_ready : in std_logic;
				divider_ready : out std_logic := '1';
				output_ready : out std_logic;
				output_accepted : in std_logic;
				T : out std_logic_vector(4 downto 0);
				S : in std_logic_vector(1 downto 0));
	end Component;
	
	component dataPath is
		port( clk,rst : in std_logic;
					t : in std_logic_vector(4 downto 0);
					s : out std_logic_vector(1 downto 0);
				 a,b : in std_logic_vector(15 downto 0);
				 quotient,remainder : out std_logic_vector(15 downto 0));
	end component;
	
	signal t : std_logic_vector(4 downto 0);
	signal s : std_logic_vector(1 downto 0);
	
	begin
	
		cp : controlPath
				port map(clk,rst,input_ready,divider_ready,output_ready,output_accepted,t,s);
		
		dp : dataPath
				port map(clk,rst,t,s,dividend,divisor,quotient,remainder);
	
end structure;
---------------------------------------------------------------


