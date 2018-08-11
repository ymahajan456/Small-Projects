--DATA PATH for GCD8
library ieee;
use ieee.std_logic_1164.all;
use std.textio.all;
use ieee.numeric_std.ALL;
---------------------------------------------------------------
entity dpgcd8 is 
	port ( clk,rst : in std_logic;
				t : in std_logic_vector(7 downto 0);
				s : out std_logic_vector(3 downto 0);
				a: in std_logic_vector(15 downto 0);
				gcd : out std_logic_vector(15 downto 0));
end entity;

architecture deadpool of dpgcd8 is 

	component DataRegister is
		generic (data_width:integer);
		port (Din: in std_logic_vector(data_width-1 downto 0);
				Dout: out std_logic_vector(data_width-1 downto 0);
				enable,clk : in std_logic);
	end component;
	
	component GCD2 is
		port (clk,rst : in std_logic;
				inReady : in std_logic;
				ready : out std_logic;
				a,b : in std_logic_vector(15 downto 0);
				gcd : out std_logic_vector(15 downto 0);
				outReady : out std_logic;
				outAccepted : in std_logic);
	end component; 
	
	component shiftCount8 is 
		port (A: in std_logic_vector(3 downto 0);
					B: out std_logic_vector(3 downto 0));
	end component;
	
	signal gcdIn : std_logic_vector(15 downto 0);
	signal areg,aregIn : std_logic_vector(15 downto 0);
	signal breg,bregIn : std_logic_vector(15 downto 0);
	signal count,countIn,dcrCount : std_logic_vector(3 downto 0);
	signal gcd2Out : std_logic_vector(15 downto 0);
	signal aregEnable,bregEnable,gcdregEnable,countEnable : std_logic;
	signal gcd2outAccepted,ready,outReady : std_logic;
---process-----------------------------------------------------

	begin
	
		--s---------
		s(0) <= '1' when (count = "0111") else '0';   --count == 7
		s(1) <= ready;                   --gcd2 rdy
		s(2) <= outReady;                --gcd2 out ready
		s(3) <= '1' when (count = "0000") else '0';   --count == 0000
	
		---------
		gcd2outAccepted <= (t(7) or t(1));
		--areg------
		aregEnable <= (t(2) or t(3));
		
		aregIn <= a when(aregEnable = '1') else areg;
		
		ar : DataRegister
				generic map(data_width => 16)
				port map(aregIn,areg,aregEnable,clk);
				
		--breg ----
		bregEnable <= (t(3) or t(6));
		
		process(t)
		begin
			if(t(3) = '1') then
				bregIn <= a;
			elsif(t(6) = '1') then
				bregIn <= gcd2Out;
			else 
				bregIn <= breg;
			end if;
		end process;
		
		br : DataRegister
				generic map(data_width => 16)
				port map(bregIn,breg,bregEnable,clk);
		
		--count reg-----
		decr : shiftCount8 port map(count,dcrCount);
		countEnable <= (t(1) or t(0));  
		process(t)
		begin
			if(t(0) = '1') then 
				countIn <= "1000";
			elsif(t(1) = '1') then
				countIn <= dcrCount;
			else 
				countIn <= count;
			end if;
		end process;
		
		count_reg : DataRegister 
							generic map (data_width => 4)
							port map(countIn,count,countEnable,clk);
		
		--gcd component---
		
		g2 : GCD2 
				port map(clk,rst,t(5),ready,areg,breg,gcd2Out,outReady,gcd2outAccepted);
		
		-- gcd8 out reg-----
		gcdregEnable <= t(7);
		gcdIn <= breg;
		gr : DataRegister
				generic map(data_width => 16)
				port map(gcdIn,gcd,gcdregEnable,clk); 
		
end architecture;
