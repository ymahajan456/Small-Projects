--8 Bit ALU
library ieee;
use ieee.std_logic_1164.all;
USE ieee.numeric_std.ALL;

entity alu is
	port(   clk,rst : in std_logic;   --clock signal
		a,b : in std_logic_vector(7 downto 0);  --input signals 8Bit
		op : in std_logic_vector(1 downto 0);  --operation code
		c : out std_logic_vector(7 downto 0) -- ou  signal 8Bit
		);
end alu;

architecture implementation of alu is
	
	component bus8mux21 is
	port ( A,B : in std_logic_vector(7 downto 0);
			op : in std_logic;
			O : out std_logic_vector(7 downto 0)
		);
	end component;

	component shifter8bit is
	port (A,B : in std_logic_vector(7 downto 0);
			op : in std_logic;
			O : out std_logic_vector(7 downto 0)
		);
	end component;

	component addSub8bit is
	port( A,B : in std_logic_vector(7 downto 0);
			cin : in std_logic;
			output : out std_logic_vector(7 downto 0)
		);
	end component;

	signal output,os,oa : std_logic_vector(7 downto 0);
	
	begin
	
	process(clk,rst,a,b,op)
	begin
			
		if(clk'event and clk = '1') then --calculate at possitive clock edge
			if(rst='1') then
				output <= std_logic_vector(to_unsigned(0, output'length));
			else
				--c <= output;
			end if;		
		end if;
	end process;

	adderSubractor : addSub8bit port map (A,B,op(0),oa);
	shifterLorR : shifter8bit port map (A,B,op(0),os);
	outselect : bus8mux21 port map (os,oa,op(1),C);

end implementation;
