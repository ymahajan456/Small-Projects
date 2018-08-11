--tb GCD 2 ----------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use std.textio.all;
use ieee.numeric_std.ALL;
use ieee.std_logic_textio.all;

entity tbGCD2 is
end entity;

architecture behav of tbGCD2 is

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

	component GCD2 is
		port (clk,rst : in std_logic;
				inReady : in std_logic;
				ready : out std_logic;
				a,b : in std_logic_vector(15 downto 0);
				gcd : out std_logic_vector(15 downto 0);
				outReady : out std_logic;
				outAccepted : in std_logic);
	end component; 

	signal clk,rst : std_logic := '0';
	signal inReady,ready,outAccepted,outReady : std_logic := '0';
	signal a,b,gcd : std_logic_vector(15 downto 0) := (others => '0');

	constant clk_p : time := 10 ns;

	--begin process------------------------------------
	
	begin

	clk_process : process
	begin
       	  clk <= '1';
	  wait for clk_p/2;
	  clk <= '0';
	  wait for clk_p/2;
	end process;

	sim_process : process

		file f : text open read_mode is "tbGCD2.txt";
		file o : text open write_mode is "otbGCD2.txt";
		variable L,el1,el2 : line;
		variable fail : integer :=0;
		variable lc : integer := 0;
		variable a_tmp,b_tmp,gcd_exp : std_logic_vector(15 downto 0);
		
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
			read (L,gcd_exp);

			while (true) loop
				wait until clk = '1';
				if(ready = '1') then
					outAccepted <= '0';      --clear output ready signal
					exit;
				end if;
			end loop;

			a <= a_tmp;
			b <= b_tmp;
			inReady <= '1';
			while (true) loop
				wait until clk = '1';
				if(outReady = '1') then
					inReady <= '0';       --clear input ready signal
					exit;
				end if;
			end loop;
			wait for clk_p;
			lc :=lc +1;
			if (not(gcd = gcd_exp)) then
				fail := fail + 1;
				assert false report "Error" severity note;
				write(el1,to_string("Error in Input no "));
				writeline(o,el1);
				write(el2,to_string(" output "));
				write(el2,vec_to_str(gcd));
				writeline(o,el2);
			end if;
			wait until clk = '1';
			outAccepted <= '1';
		end loop;

	assert false report "Total Checked " & integer'image(lc) & " failures " & integer'image(fail) severity error;

	wait;
	end process;

	dut : gcd2 
			port map(clk,rst,inReady,ready,a,b,gcd,outReady,outAccepted);
end architecture;
