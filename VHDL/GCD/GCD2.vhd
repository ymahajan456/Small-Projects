--GCD of two 16 bit numbers---
library ieee;
use ieee.std_logic_1164.all;
use std.textio.all;
use ieee.numeric_std.ALL;

entity GCD2 is	
	port (	clk,rst : in std_logic;
				inReady : in std_logic;
				ready : out std_logic;
				a,b : in std_logic_vector(15 downto 0);
				gcd : out std_logic_vector(15 downto 0);
				outReady : out std_logic;
				outAccepted : in std_logic);
end entity;

architecture mix of GCD2 is
	
	component cpgcd2 is
		port (clk,rst : in std_logic;
		ready : out std_logic;
		inReady : in std_logic;
		outReady : out std_logic;
		outAccepted : in std_logic;
		T : out std_logic_vector(4 downto 0);
		S : in std_logic_vector(2 downto 0));
	end component;
	
	component dpgcd2 is
		port ( clk,rst : in std_logic;
				t : in std_logic_vector(4 downto 0);
				s : out std_logic_vector(2 downto 0);
				a,b : in std_logic_vector(15 downto 0);
				gcd : out std_logic_vector(15 downto 0));
	end component;

	signal t : std_logic_vector(4 downto 0);
	signal s : std_logic_vector(2 downto 0);
	
	begin
	
	cp : cpgcd2 port map(clk,rst,ready,inReady,outReady,outAccepted,t,s);
	dp : dpgcd2 port map(clk,rst,t,s,a,b,gcd);
end architecture;
