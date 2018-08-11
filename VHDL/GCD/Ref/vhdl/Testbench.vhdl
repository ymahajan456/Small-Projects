library ieee;
use ieee.std_logic_1164.all;
library std;
use std.textio.all;
library work;
use work.ShiftAddMulComponents.all;

entity Testbench is
end entity;
architecture Behave of Testbench is
  signal A,B, RESULT: std_logic_vector(31 downto 0);
  signal start, done: std_logic;
  signal clk: std_logic := '0';
  signal reset: std_logic := '1';

  function to_string(x: string) return string is
      variable ret_val: string(1 to x'length);
      alias lx : string (1 to x'length) is x;
  begin  
      ret_val := lx;
      return(ret_val);
  end to_string;

  function to_std_logic_vector(x: bit_vector) return std_logic_vector is
    alias lx: bit_vector(1 to x'length) is x;
    variable ret_var : std_logic_vector(1 to x'length);
  begin
     for I in 1 to x'length loop
        if(lx(I) = '1') then
           ret_var(I) :=  '1';
        else 
           ret_var(I) :=  '0';
	end if;
     end loop;
     return(ret_var);
  end to_std_logic_vector;

begin
  clk <= not clk after 5 ns; -- assume 10ns clock.

  -- reset process
  process
  begin
     wait until clk = '1';
     reset <= '0';
     wait;
  end process;

  process 
    variable err_flag : boolean := false;
    File INFILE: text open read_mode is "TRACEFILE.txt";
    FILE OUTFILE: text  open write_mode is "OUTPUTS.txt";

    ---------------------------------------------------
    -- edit the next few lines to customize
    variable A_var: bit_vector ( 31 downto 0);
    variable B_var: bit_vector ( 31 downto 0);
    variable Result_var: bit_vector (31 downto 0);
    ----------------------------------------------------
    variable INPUT_LINE: Line;
    variable OUTPUT_LINE: Line;
    variable LINE_COUNT: integer := 0;
    
  begin

    wait until clk = '1';

   
    while not endfile(INFILE) loop 
    	  wait until clk = '0';

          LINE_COUNT := LINE_COUNT + 1;
	
	  readLine (INFILE, INPUT_LINE);
          read (INPUT_LINE, A_var);
	  read (INPUT_LINE, B_var);
          read (INPUT_LINE, Result_var);

          --------------------------------------
          -- from input-vector to DUT inputs
	  A <= to_std_logic_vector(A_var);
	  B <= to_std_logic_vector(B_var);
          --------------------------------------

          -- set start
          start <= '1';

          -- spin waiting for done
          while (true) loop
             wait until clk = '1';
             start <= '0';
             if(done = '1') then
                exit;
             end if;
          end loop;

          --------------------------------------
	  -- check outputs.
	  if (RESULT /= to_std_logic_vector(RESULT_var)) then
             write(OUTPUT_LINE,to_string("ERROR: in RESULT, line "));
             write(OUTPUT_LINE, LINE_COUNT);
             writeline(OUTFILE, OUTPUT_LINE);
             err_flag := true;
          end if;
          --------------------------------------
    end loop;

    assert (err_flag) report "SUCCESS, all tests passed." severity note;
    assert (not err_flag) report "FAILURE, some tests failed." severity error;

    wait;
  end process;

  dut: ShiftAddMultiplier 
     port map(A => A,
              B => B,
              RESULT => RESULT,
              clk => clk,
              reset => reset,
              start => start, done => done);

end Behave;

