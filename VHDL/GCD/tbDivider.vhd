--test bench for 16bit divider

library ieee;
use ieee.std_logic_1164.all;
use std.textio.all;
use ieee.numeric_std.ALL;
use ieee.std_logic_textio.all;

entity tbDivider is
end entity;

architecture behav of tbDivider is

	function vec_to_str(x:std_logic_vector) return String is
		variable L : Line;
		variable W : String(1 to x'length) :=(others => ' ');
		begin
		write(L,x);
		W(L.all'range) := L.all;
		Deallocate(L);
		return W;
	end vec_to_str;

  function to_string(x: string) return string is
      variable ret_val: string(1 to x'length);
      alias lx : string (1 to x'length) is x;
  begin  
      ret_val := lx;
      return(ret_val);
  end to_string;

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

	signal clk,rst : std_logic := '0';
	signal dividend,divisor : std_logic_vector(15 downto 0) := (others => '0');
	signal input_ready : std_logic := '0' ;
	signal divider_ready : std_logic;
	signal quotient : std_logic_vector(15 downto 0);
	signal remainder : std_logic_vector(15 downto 0);
	signal output_ready : std_logic;
	signal output_accepted : std_logic := '0';

	constant clk_p : time := 200 ns;

	--begin process--------
	begin

	clk_process : process
	begin
       	  clk <= '1';
	  wait for clk_p/2;
	  clk <= '0';
	  wait for clk_p/2;
	end process;

	sim_process : process

		file f : text open read_mode is "tbDivider.txt";
		file o : text open write_mode is "otbDivider.txt";
		variable L,el1,el2 : line;
		variable fail : integer :=0;
		variable lc : integer := 0;
		variable a_tmp,b_tmp,q_exp,r_exp : std_logic_vector(15 downto 0);
		
	begin
		
		wait for clk_p; --just wait
		rst <= '1';		 --reset	
		wait for clk_p;
		rst <= '0';     --remove reset

		---sim start---
		while not endfile(f) loop
			readline (f,L);	
			read (L,a_tmp);
			read (L,b_tmp);
			read (L,q_exp);
			read (L,r_exp);
			
			while (true) loop
				wait until clk = '1';
				if(divider_ready = '1') then
					output_accepted <= '0';      --clear output ready signal
					exit;
				end if;
			end loop;
			dividend <= a_tmp;
			divisor <= b_tmp;
			input_ready <= '1';
			while (true) loop
				wait until clk = '1';
				if(output_ready = '1') then
					input_ready <= '0';       --clear input ready signal
					exit;
				end if;
			end loop;
			wait for clk_p;
			lc :=lc +1;
			if ((not(quotient = q_exp)) or (not(remainder = r_exp))) then
				fail := fail + 1;
				assert false report "Error" severity note;
				write(el1,to_string("Error in Input no "));
				write(el1,lc);
				writeline(o,el1);
				write(el2,to_string(" output "));
				write(el2,vec_to_str(quotient));
				write(el2,to_string(" "));
				write(el2,vec_to_str(remainder));
				writeline(o,el2);
			end if;
			wait until clk = '1';
			output_accepted <= '1';
		end loop;

	assert false report "Total Checked " & integer'image(lc) & " failures " & integer'image(fail) severity error;

	wait;
	end process;

	dut : divider16bit 
			port map(clk,rst,dividend,divisor,input_ready,divider_ready,quotient,remainder,output_ready,output_accepted);
end architecture;
	
		
