--Data Path ---------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use std.textio.all;
use ieee.numeric_std.ALL;

entity dataPath is
	port( clk,rst : in std_logic;
					t : in std_logic_vector(4 downto 0);
					s : out std_logic_vector(1 downto 0);
				 a,b : in std_logic_vector(15 downto 0);
				 quotient,remainder : out std_logic_vector(15 downto 0));
end entity;

architecture blahblah of dataPath is

	component mux21 is
		port ( A,B,S : in std_logic;
			   O : out std_logic);
	end component;
	
	component shiftCount16 is
		port (A: in std_logic_vector(4 downto 0);
					B: out std_logic_vector(4 downto 0));
	end component;

	component lshift16 is	
		port ( A : in std_logic_vector(15 downto 0);
					B : out std_logic_vector(15 downto 0));
	end component;

	component sub16bit is
			port( A,B : in std_logic_vector(15 downto 0);
					 sub : out std_logic_vector(15 downto 0));
	end component;

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
	
	signal count0 : std_logic;
	signal count,count_in,dcrCount : std_logic_vector(4 downto 0);
	signal areg,lsa,areg_in : std_logic_vector(15 downto 0);
	signal breg,breg_in : std_logic_vector(15 downto 0);
	signal rreg,lsr,subb,rreg_in : std_logic_vector(15 downto 0);
	signal qreg,qreg_in,lsq : std_logic_vector(15 downto 0);
	signal quotient_in,remainder_in : std_logic_vector(15 downto 0);
	signal countEnable,aregEnable,bregEnable,rregEnable,qregEnable,resultEnable : std_logic;
	signal g,e,l : std_logic;
------------process begins-------------------------------------	
	begin	
		--set operations complete-------
		count0 <= (count(0) or count(1) or count(2) or count(3) or count(4)); 
		muxs1 : mux21 port map ('0','1',count0,s(1));
		
		--cmp-----------------------
		cmp : cmp16 port map(rreg,breg,g,e,l);
		s(0) <= not(l);
		
		--count register
		decr : shiftCount16 port map(count,dcrCount);
		countEnable <= (t(0) or t(1));
		count_in <= dcrCount when (t(1) = '1') else "10000"; --set count
		count_reg : DataRegister 
							generic map (data_width => 5)
							port map(count_in,count,countEnable,clk);
		
		--areg logic-----------------
		shiftA : lshift16 port map(areg,lsa);
		aregEnable <= (t(0) or t(1));
		areg_in <= lsa when (t(1) = '1') else a;
		ar : DataRegister 
				generic map(data_width => 16)
				port map(areg_in,areg,aregEnable,clk);
				
		--breg logic-----------------
		bregEnable <= t(0);  -- allow input to change after accept signal
		breg_in <= b;
		br : DataRegister 
				generic map(data_width => 16)
				port map(breg_in,breg,bregEnable,clk);
		
		--rreg logic-----------------
		rregEnable <= (t(0) or t(1) or t(3));
		sub : sub16bit port map (rreg,breg,subb);
		lsr <= rreg(14 downto 0)&areg(15);
		
		process(t)
		begin
			if(t(0) = '1') then 
				rreg_in <= "0000000000000000";
			elsif(t(1) = '1') then
				rreg_in <= lsr;
			elsif(t(3) = '1') then
				rreg_in <= subb;
			else
				rreg_in <= rreg;
			end if;
		end process;
		
		rr : DataRegister 
				generic map(data_width => 16)
				port map(rreg_in,rreg,rregEnable,clk);

		--qreg logic-------------------------
		qregEnable <= (t(0) or t(1) or t(3));
		shiftQ : lshift16 port map(qreg,lsq);
		
		process(t)
		begin	
			if(t(0) = '1') then 
				qreg_in <= "0000000000000000";
			elsif(t(1) = '1') then
				qreg_in <= lsq;
			elsif(t(3) = '1') then
				qreg_in <= qreg;
				qreg_in(0) <= '1';
			else
				qreg_in <= qreg;
			end if;
		end process;
		
		qr : DataRegister
				generic map(data_width => 16)
				port map(qreg_in,qreg,qregEnable,clk);
		
		--result Logic---------
		resultEnable <= t(4);
		quotient_in <= qreg;
		remainder_in <= rreg;
		quoR : DataRegister 
					generic map(data_width => 16)
					port map(quotient_in,quotient,resultEnable,clk);
		remR : DataRegister
					generic map(data_width => 16)
					port map(remainder_in,remainder,resultEnable,clk);

end architecture;
---------------------------------------------------------------
		
