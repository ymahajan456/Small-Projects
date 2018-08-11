--GCD of 8 16 bit numbers---
library ieee;
use ieee.std_logic_1164.all;
use std.textio.all;
use ieee.numeric_std.ALL;

entity gcd8 is
	port(din : in std_logic_vector(15 downto 0);
			dout : out std_logic_vector(15 downto 0);
			start : in std_logic;
			done : out std_logic;
			erdy : in std_logic;
			srdy : out std_logic;
			clk,rst : in std_logic);
end entity;

architecture giveup of gcd8 is 

	component cpgcd8 is
		port(clk,rst : in std_logic;
			start : in std_logic;
			done : out std_logic;
			erdy : in std_logic;
			srdy : out std_logic;
			T : out std_logic_vector(7 downto 0);
			S : in std_logic_vector(3 downto 0));
	end component;
	
	component dpgcd8 is
		port ( clk,rst : in std_logic;
				t : in std_logic_vector(7 downto 0);
				s : out std_logic_vector(3 downto 0);
				a: in std_logic_vector(15 downto 0);
				gcd : out std_logic_vector(15 downto 0));
	end component;
	
	signal t : std_logic_vector(7 downto 0);
	signal s : std_logic_vector(3 downto 0);
	
	begin
	
	cp : cpgcd8 port map(clk,rst,start,done,erdy,srdy,t,s);
	dp : dpgcd8 port map(clk,rst,t,s,din,dout);

end architecture;
	
	
	
