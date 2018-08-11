--tb GCD 8 ----------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use std.textio.all;
use ieee.numeric_std.ALL;
use ieee.std_logic_textio.all;

entity tbGCD8 is
end entity;

architecture behav of tbGCD8 is

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
  
  component gcd8 is
		port(din : in std_logic_vector(15 downto 0);
			dout : out std_logic_vector(15 downto 0);
			start : in std_logic;
			done : out std_logic;
			erdy : in std_logic;
			srdy : out std_logic;
			clk,rst : in std_logic);
	end component;
	
	signal clk,rst : std_logic := '0';
	signal din,dout : std_logic_vector(15 downto 0) := (others => '0');
	signal start,done,erdy,srdy : std_logic := '0';
	
	constant clk_p : time := 10 ps;
	
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

		file f : text open read_mode is "tbGCD8.txt";
		file o : text open write_mode is "otbGCD8.txt";
		variable L,el1,el2 : line;
		variable fail : integer :=0;
		variable lc : integer := 0;
		variable in1,in2,in3,in4,in5,in6,in7,in8,gcd_exp : std_logic_vector(15 downto 0);
		
	begin
	
		wait for clk_p; --just wait
		rst <= '1';		 --reset	
		wait for clk_p;
		rst <= '0';     --remove reset

		---sim start---
		while not endfile(f) loop
			readline (f,L);
			read (L,in1);
			read (L,in2);
			read (L,in3);
			read (L,in4);
			read (L,in5);
			read (L,in6);
			read (L,in7);
			read (L,in8);
			read (L,gcd_exp);
			
			wait for clk_p;
			
			start <= '1';
			
			while (true) loop
				wait until clk = '1';
				if(srdy = '1') then
					din <= in1;      --apply input1
					exit;
				end if;
			end loop;
			erdy <= '1';
			
			wait for clk_p;
			erdy <= '0'; 			--clear erdy bit
			start <= '0';      --clear start bit
			wait for clk_p;
			
			while (true) loop
				wait until clk = '1';
				if(srdy = '1') then
					din <= in2;      --apply input2
					exit;
				end if;
			end loop;
			erdy <= '1';
			
			wait for clk_p;
			erdy <= '0';        --clear erdy bit
			wait for clk_p;
			while (true) loop
				wait until clk = '1';
				if(srdy = '1') then
					din <= in3;      --apply input3
					exit;
				end if;
			end loop;
			erdy <= '1';
			
			wait for clk_p;
			erdy <= '0';        --clear erdy bit
			wait for clk_p;
			while (true) loop
				wait until clk = '1';
				if(srdy = '1') then
					din <= in1;      --apply input1
					exit;
				end if;
			end loop;
			erdy <= '1';
			
			wait for clk_p;
			erdy <= '0';        --clear erdy bit
			wait for clk_p;
			while (true) loop
				wait until clk = '1';
				if(srdy = '1') then
					din <= in4;      --apply input4
					exit;
				end if;
			end loop;
			erdy <= '1';
			
			wait for clk_p;
			erdy <= '0';        --clear erdy bit
			wait for clk_p;
			while (true) loop
				wait until clk = '1';
				if(srdy = '1') then
					din <= in5;      --apply input5
					exit;
				end if;
			end loop;
			erdy <= '1';
			
			wait for clk_p;
			erdy <= '0';        --clear erdy bit
			wait for clk_p;
			while (true) loop
				wait until clk = '1';
				if(srdy = '1') then
					din <= in6;      --apply input6
					exit;
				end if;
			end loop;
			erdy <= '1';
			
			wait for clk_p;
			erdy <= '0';        --clear erdy bit

			wait for clk_p;
			while (true) loop
				wait until clk = '1';
				if(srdy = '1') then
					din <= in7;      --apply input7
report "dd";
					exit;
				end if;
			end loop;
			erdy <= '1';
			
			wait for clk_p;
			erdy <= '0';        --clear erdy bit
			wait for clk_p;

			while (true) loop
				wait until clk = '1';
--report "gfgf";
				if(srdy = '1') then
					din <= in8;      --apply input8
report "d8";
					exit;
				end if;
			end loop;

report "send erdy";
			erdy <= '1';
			wait for clk_p;
			erdy <= '0';        --clear erdy bit
			wait for clk_p;

			while(true) loop
				wait until clk = '1';
				if(done = '1') then
					exit;
				end if;
			end loop;
			report "yp";
			wait for clk_p;
			lc :=lc +1;
			if (not(dout = gcd_exp)) then
				fail := fail + 1;
				assert false report "Error" severity note;
				write(el1,to_string("Error in Input no "));
				writeline(o,el1);
				write(el2,to_string(" output "));
				write(el2,vec_to_str(dout));
				writeline(o,el2);
			end if;
			start <= '1';
		end loop;
		
		assert false report "Total Checked " & integer'image(lc) & " failures " & integer'image(fail) severity error;

	wait;
	end process;
	
	dut : gcd8
			port map(din,dout,start,done,erdy,srdy,clk,rst);

end architecture;
			
