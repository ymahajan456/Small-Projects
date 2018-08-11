--testbench for ADCC
library ieee ;
use ieee.std_logic_1164.all ;
use ieee.numeric_std.all;
use std.textio.all;
use ieee.std_logic_textio.all;
entity tbADCC is
end entity;

architecture test of tbADCC is
	
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
  
	component adcc is
		port(
		clk,reset: in std_logic;
		adc_run: in std_logic;
		adc_output_ready: out std_logic;
		adc_data: out std_logic_vector(7 downto 0);
		data_in: in std_logic_vector(7 downto 0);
		WR_bar, RD_bar, CS_bar: out std_logic;
		INTR_bar: in std_logic);
	end component;
	
	signal adc_run,adc_output_ready : std_logic := '0';
	signal WR_bar,RD_bar,CS_bar,INTR_bar : std_logic := '1';
	signal data_in,adc_data : std_logic_vector(7 downto 0) := "00000000";
	signal clk,reset : std_logic := '0';
	
	constant clk_p : time := 20 ns;
	
	--begin process------------------------------------
	
	begin

	clk_process : process
	begin
     clk <= '0';
	  wait for clk_p/2;
	  clk <= '1';
	  wait for clk_p/2;
	end process;

	sim_process : process

		file f : text open read_mode is "tbADCC.txt";	--inputs for the ADC (simple 8 bit numbers)
		file o : text open write_mode is "otADCC.txt";
		variable L,el1,el2 : line;
		variable fail : integer :=0;
		variable lc : integer := 0;
		variable adc_exp : std_logic_vector(7 downto 0);
		
		begin
			wait until (clk'event and (clk = '1'));
			reset <= '1';                          --reset for 1clk_p
			wait until (clk'event and (clk = '1'));
			reset <= '0';                          --remove reset
			wait until (clk'event and (clk = '1'));
			adc_run <= '1';                        --Start Conv signal
			wait until (CS_bar'event and (CS_bar = '0'));
			
			while not endfile(f) loop
				readline (f,L);
				read(L,adc_exp);
			
				wait until (WR_bar'event and (WR_bar = '1'));   --rising edge of WR assuming initial is 1
				wait for 300 us;
				
				INTR_bar <= '0';
				wait until (RD_bar'event and (RD_bar = '0'));
				
				data_in <= adc_exp;
				wait until (RD_bar'event and (RD_bar = '1'));
				INTR_bar <= '1';
				
				--wait until(adc_output_ready'event and (adc_output_ready = '1'));
				
				lc :=lc +1;
				if (not(adc_data = adc_exp)) then
					fail := fail + 1;
					assert false report "Error" severity note;
					write(el1,to_string("Error in Input no "));
					writeline(o,el1);
					write(el2,to_string(" output "));
					write(el2,vec_to_str(adc_data));
					writeline(o,el2);
				end if;
			end loop;
		adc_run <= '0';    --clear adc run bit
		
		assert false report "Total Checked " & integer'image(lc) & " failures " & integer'image(fail) severity error;

	wait;
	end process;
	
	dut : adcc 
			port map(clk,reset,adc_run,adc_output_ready,adc_data,data_in,WR_bar,RD_bar,CS_bar,INTR_bar);
			
end architecture;
	
	