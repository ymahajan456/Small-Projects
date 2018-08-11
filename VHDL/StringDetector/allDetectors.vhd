--vhdl code for Sequence Detectors


-- Bomb Detector :)
library ieee;
use ieee.std_logic_1164.all;
use std.textio.all;
use ieee.numeric_std.ALL;
use ieee.std_logic_textio.all;

entity bombDetector is 
	port ( clk : in std_logic;
			rst : in std_logic;
			x : in std_logic_vector(4 downto 0);
			y : out std_logic);
end entity bombDetector;

architecture behaviour of bombDetector is

	signal s,sn : std_logic_vector(1 downto 0);
	
	begin	
	
	process (clk)
	begin
		if (clk = '1') and (clk'event) then
			s <= sn;
		end if;
	end process;
	
	process (x,s,rst)
		begin
		if (rst = '1') then
			y <= '0';
			sn <= "00";	
		else
			if s = "01" then 
				y <= '0';
			end if;
			if (s = "00") and (x = "00010") then            -- state b
				sn <= "01";		
			elsif (s = "01") and (x = "01111") then        -- state bo     
				sn <= "10";	
			elsif (s = "10") and (x = "01101") then         -- state bom
				sn <= "11";
			elsif (s = "11") and (x = "00010") then         ---- bomb detected --> boom :)
					sn <= "01";                          -- previous b is used in next bomb
					y <='1';	
				end if;	 	
		end if;		
	
	end process;
end architecture behaviour;

---------------------------------------------------------------

-- Gun Detector :)
library ieee;
use ieee.std_logic_1164.all;
use std.textio.all;
use ieee.numeric_std.ALL;
use ieee.std_logic_textio.all;

entity gunDetector is
	port ( clk: in std_logic;
			rst : in std_logic;
			x : in std_logic_vector(4 downto 0);
			y : out std_logic);
end entity gunDetector;

architecture behaviour of gunDetector is
	
	signal s,sn : std_logic_vector(1 downto 0) ;
	
	begin	

	process (clk)
	begin
		if (clk = '1') and (clk'event) then
			s <= sn;
		end if;
	end process;
	
	process (x,s,rst)
	begin
		if (rst = '1') then
			y <= '0';
			sn <= "00";	
		else
			if (s = "00") then
				y <= '0';
			end if;	
			if (s = "00") and (x = "00111") then            -- state g
				sn <= "01";
			elsif (s = "01") and (x = "10101") then        -- state gu     
				sn <= "10";	
			elsif (s = "10") and (x = "01110") then         -- gun detected --> shot :) 
				sn <= "00";
				y <='1';	
			end if;
		end if;	 		
	end process;
end architecture behaviour;

---------------------------------------------------------------
-- knife detector
library ieee;
use ieee.std_logic_1164.all;
use std.textio.all;
use ieee.numeric_std.ALL;
use ieee.std_logic_textio.all;

entity knifeDetector is 
	port ( clk : in std_logic;
			rst : in std_logic;
			x : in std_logic_vector(4 downto 0);
			y : out std_logic );
end entity knifeDetector;

architecture behaviour of knifeDetector is
	
	signal s,sn : std_logic_vector(2 downto 0) ;
	
	begin	
	
	process (clk)
	begin
		if (clk = '1') and (clk'event) then
			s <= sn;
		end if;
	end process;
	
	process (x,s,rst)
		begin
		if (rst = '1') then
			y <= '0';
			sn <= "000";	
		else
			if (s = "000") then
				y <= '0';
			end if;
			if (s = "000") and (x = "01011") then            -- state k
				sn <= "001";
			elsif (s = "001") and (x = "01110") then        -- state kn    
				sn <= "010";	
			elsif (s = "010") and (x = "01001") then         -- state kni
				sn <= "011";
			elsif (s = "011") and (x = "00110") then         -- state knif
				sn <= "100";
			elsif (s = "100") and (x = "00101") then         ---- knife detected --> stab :)
				sn <= "000";                          
				y <='1';	
			end if;	 		
		end if;
	end process;
end architecture behaviour;

---------------------------------------------------------------

-- terror detector
library ieee;
use ieee.std_logic_1164.all;
use std.textio.all;
use ieee.numeric_std.ALL;
use ieee.std_logic_textio.all;

entity terrorDetector is 
	port ( clk : in std_logic;
			rst : in std_logic;
			x : in std_logic_vector(4 downto 0);
			y : out std_logic);
end entity terrorDetector;

architecture behaviour of terrorDetector is
	
	signal s,sn : std_logic_vector(2 downto 0) ;
	
	begin	
	
	process (clk)
	begin
		if (clk = '1') and (clk'event) then
			s <= sn;
		end if;
	end process;

	process (x,s,rst)
		begin
		if (rst = '1') then
			y <= '0';
			sn <= "000";	
		else
			if (s = "000") then
				y <= '0';
			end if;
			if (s = "000") and (x = "10100") then            -- state t
				sn <= "001";
			elsif (s = "001") and (x = "00101") then       -- state te     
				sn <= "010";		
			elsif (s = "010") and (x = "10010") then         -- state ter
				sn <= "011";
			elsif (s = "011") and (x = "10010") then         -- state terr
				sn <= "100";				
			elsif (s = "100") and (x = "01111") then         -- state terro
					sn <= "101";				
			elsif (s = "101") and (x = "10010") then         ---- terror detected --> run :)
				sn <= "000";                          
				y <='1';	
			end if;
		end if;	 		
	end process;
end architecture behaviour;

---------------------------------------------------------------
