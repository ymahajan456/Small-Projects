--DATA PATH for GCD2
library ieee;
use ieee.std_logic_1164.all;
use std.textio.all;
use ieee.numeric_std.ALL;
---------------------------------------------------------------
entity dpgcd2 is 
	port ( clk,rst : in std_logic;
				t : in std_logic_vector(4 downto 0);
				s : out std_logic_vector(2 downto 0);
				a,b : in std_logic_vector(15 downto 0);
				gcd : out std_logic_vector(15 downto 0));
end entity;

architecture deadpool of dpgcd2 is 

	component cmp16 is	
		port (A,B : in std_logic_vector(15 downto 0);
				g,e,l: out std_logic);
	end component;

	component DataRegister is
		generic (data_width:integer);
		port (Din: in std_logic_vector(data_width-1 downto 0);
				Dout: out std_logic_vector(data_width-1 downto 0);
				enable,clk : in std_logic);
	end component;
	
	component divider16bit is
		port ( clk,rst : in std_logic;
					dividend,divisor : in std_logic_vector(15 downto 0);
					input_ready : in std_logic;
					divider_ready : out std_logic;
					quotient : out std_logic_vector(15 downto 0);
					remainder : out std_logic_vector(15 downto 0);
					output_ready : out std_logic;
					output_accepted : in std_logic);
	end component;	
	
	signal quotient : std_logic_vector(15 downto 0);
	signal areg,aregIn,acmp,daout : std_logic_vector(15 downto 0);
	signal breg,bregIn,bcmp,dbout,outIn : std_logic_vector(15 downto 0);
	signal aregEnable,bregEnable,outEnable : std_logic;
	signal g,e,l,divReady,output_ready : std_logic;
--------process------------------------------------------------	
	begin
	
		--ready--
		s(0) <= divReady;
		s(1) <= output_ready;
		s(2) <= '1' when (breg = "0000000000000000") else '0';
		-- compare inputs --
		cmp : cmp16 port map (a,b,g,e,l);
		
		--areg---------------
		aregEnable <= (t(0) or t(2));
		
		acmp <= a when(l = '0') else b;
		
		process(t)
		begin
			if(t(0) = '1') then
				aregIn <= acmp;
			elsif(t(2) = '1') then
				aregIn <= breg;
			else 
				aregIn <= areg;
			end if;
		end process;
		
		ar : DataRegister
				generic map(data_width => 16)
				port map(aregIn,areg,aregEnable,clk);
				
		--breg---------------
		
		bregEnable <= (t(0) or t(2));
		
		bcmp <= b when(l = '0') else a;
	
		process(t)
		begin
			if(t(0) = '1') then
				bregIn <= bcmp;
			elsif(t(2) = '1') then
				bregIn <= dbout;
			else 
				bregIn <= breg;
			end if;
		end process;
		
		br : DataRegister
				generic map(data_width => 16)
				port map(bregIn,breg,bregEnable,clk);
				
		--divider16bit
		
		dv : divider16bit port map(clk,rst,areg,breg,t(1),divReady,quotient,dbout,output_ready,t(4));
		
		--out------------
		outIn <= areg;
		outEnable <= t(3);
		gr : DataRegister
				generic map(data_width => 16)
				port map(outIn,gcd,outEnable,clk);
	
end architecture;
	
