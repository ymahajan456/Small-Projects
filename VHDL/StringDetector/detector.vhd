-- String Detector
library ieee;
use ieee.std_logic_1164.all;
use std.textio.all;
use ieee.numeric_std.ALL;
use ieee.std_logic_textio.all;

entity detector is 
	port ( clk : in std_logic;
			rst : in std_logic;
			x : in std_logic_vector(4 downto 0);
			y : out std_logic);
end entity;

architecture behaviour of detector is 

	signal y_tmp : std_logic_vector(3 downto 0);
	
	component bombDetector is 
	port ( clk: in std_logic;
			rst : in std_logic;
			x : in std_logic_vector(4 downto 0);
			y : out std_logic);
	end component;

	component gunDetector is 
	port ( clk: in std_logic;
			rst : in std_logic;
			x : in std_logic_vector(4 downto 0);
			y : out std_logic);
	end component;

	component knifeDetector is 
	port ( clk: in std_logic;
			rst : in std_logic;
			x : in std_logic_vector(4 downto 0);
			y : out std_logic);
	end component;

	component terrorDetector is 
	port ( clk: in std_logic;
			rst : in std_logic;
			x : in std_logic_vector(4 downto 0);
			y : out std_logic);
	end component;


	begin
	
	detector0 : bombDetector port map (clk,rst,x,y_tmp(0));
	detector1 : gunDetector port map (clk,rst,x,y_tmp(1));
	detector2 : knifeDetector port map (clk,rst,x,y_tmp(2));
	detector3 : terrorDetector port map (clk,rst,x,y_tmp(3));

	y <= (y_tmp(0) or y_tmp(1) or y_tmp(2) or y_tmp(3)) ;

end architecture;
	
