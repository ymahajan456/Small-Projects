library std;
library ieee;
use ieee.std_logic_1164.all;


package ShiftAddMulComponents is
  component ShiftAddMultiplier is
    port(A,B: in std_logic_vector(31 downto 0);
       RESULT: out std_logic_vector(31 downto 0);
       start: in std_logic;
       done: out std_logic;
       clk, reset: in std_logic);
  end component  ShiftAddMultiplier;

  component ControlPath is
	port (
		T0,T1,T2,T3,T4,T5,T6,T7,T8: out std_logic;
		S: in std_logic;
		start: in std_logic;
		done : out std_logic;
		clk, reset: in std_logic
	     );
  end component;

  component DataPath is
	port (
		T0,T1,T2,T3,T4,T5,T6,T7,T8: in std_logic;
		S: out std_logic;
		A,B: in std_logic_vector(31 downto 0);
		RESULT: out std_logic_vector(31 downto 0);
		clk, reset: in std_logic
	     );
  end component;

  component DataRegister is
	generic (data_width:integer);
	port (Din: in std_logic_vector(data_width-1 downto 0);
	      Dout: out std_logic_vector(data_width-1 downto 0);
	      clk, enable: in std_logic);
  end component DataRegister;

  -- produces sum with carry (included in result).
  component Adder32 is
        port (A, B: in std_logic_vector(31 downto 0); RESULT: out std_logic_vector(32 downto 0));
  end component Adder32;
	
  -- 6-bit decrementer.
  component Decrement6 is
        port (A: in std_logic_vector(5 downto 0); B: out std_logic_vector(5 downto 0));
  end component Decrement6;

end package;

library ieee;
use ieee.std_logic_1164.all;
entity DataRegister is
	generic (data_width:integer);
	port (Din: in std_logic_vector(data_width-1 downto 0);
	      Dout: out std_logic_vector(data_width-1 downto 0);
	      clk, enable: in std_logic);
end entity;
architecture Behave of DataRegister is
begin
    process(clk)
    begin
       if(clk'event and (clk  = '1')) then
           if(enable = '1') then
               Dout <= Din;
           end if;
       end if;
    end process;
end Behave;

library ieee;
use ieee.std_logic_1164.all;
entity Adder32 is
   port (A, B: in std_logic_vector(31 downto 0); RESULT: out std_logic_vector(32 downto 0));
end entity;
architecture Serial of Adder32 is
begin
   process(A,B)
     variable carry: std_logic;
   begin
     carry := '0';
     for I in 0 to 31 loop
        RESULT(I) <= (A(I) xor B(I)) xor carry;
        carry := (carry and (A(I) or B(I))) or (A(I) and B(I));
     end loop;
     RESULT(32) <= carry;
   end process;
end Serial;

library ieee;
use ieee.std_logic_1164.all;
entity Decrement6 is
   port (A: in std_logic_vector(5 downto 0); B: out std_logic_vector(5 downto 0));
end entity Decrement6;

architecture Serial of Decrement6 is
begin
  process(A)
    variable borrow: std_logic;
  begin 
    borrow := '1';
    for I in 0 to 5 loop
       B(I) <= A(I) xor borrow;
       borrow := borrow and (not A(I));
    end loop;
  end process; 
end Serial;
library ieee;
use ieee.std_logic_1164.all;

library work;
use work.ShiftAddMulComponents.all;
entity ShiftAddMultiplier is
  port(A,B: in std_logic_vector(31 downto 0);
       RESULT: out std_logic_vector(31 downto 0);
       start: in std_logic;
       done: out std_logic;
       clk, reset: in std_logic);
end entity ShiftAddMultiplier;


architecture Struct of ShiftAddMultiplier is
   signal T0,T1,T2,T3,T4,T5,T6,T7,T8,T9, S: std_logic;
begin

    CP: ControlPath 
	     port map(T0 => T0,
			T1 => T1, 
			T2 => T2,
			T3 => T3,
			T4 => T4,
 			T5 => T5,
			T6 => T6,
			T7 => T7,
			T8 => T8,
			S => S,
			start => start,
			done => done,
			reset => reset,
			clk => clk);

    DP: DataPath
	     port map (A => A, B => B,
			RESULT => RESULT,
	     		T0 => T0,
			T1 => T1, 
			T2 => T2,
			T3 => T3,
			T4 => T4,
 			T5 => T5,
			T6 => T6,
			T7 => T7,
			T8 => T8,
			S => S,
			reset => reset,
			clk => clk);
end Struct;

library ieee;
use ieee.std_logic_1164.all;
entity ControlPath is
	port (
		T0,T1,T2,T3,T4,T5,T6,T7,T8: out std_logic;
		S: in std_logic;
		start: in std_logic;
		done : out std_logic;
		clk, reset: in std_logic
	     );
end entity;

architecture Behave of ControlPath is
   type FsmState is (rst, sumstate, update, donestate);
   signal fsm_state : FsmState;
begin

   process(fsm_state, start, S, clk, reset)
      variable next_state: FsmState;
      variable Tvar: std_logic_vector(0 to 8);
      variable done_var: std_logic;
   begin
       -- defaults
       Tvar := (others => '0');
       done_var := '0';
       next_state := fsm_state;

       case fsm_state is 
          when rst =>
               if(start = '1') then
                  next_state := sumstate;
                  Tvar(0) := '1'; Tvar(2) := '1'; Tvar(4) := '1'; Tvar(5) := '1';
               end if;
          when sumstate =>
               next_state := update;
               Tvar(1) := '1'; Tvar(7) := '1';
          when update =>
               Tvar(3) := '1'; Tvar(6) := '1';
               if(S = '1') then
                  Tvar(8) := '1';
                  next_state := donestate;
               else
                  next_state := sumstate;
               end if;
          when donestate =>
               done_var := '1';
               next_state := rst;
     end case;

     T0 <= Tvar(0); T1 <= Tvar(1); T2 <= Tvar(2); T3 <= Tvar(3); T4 <= Tvar(4);
     T5 <= Tvar(5); T6 <= Tvar(6); T7 <= Tvar(7); T8 <= Tvar(8); 
     done <= done_var;
  
     if(clk'event and (clk = '1')) then
	if(reset = '1') then
             fsm_state <= rst;
        else
             fsm_state <= next_state;
        end if;
     end if;
   end process;
end Behave;


library ieee;
use ieee.std_logic_1164.all;
library work;
use work.ShiftAddMulComponents.all;

entity DataPath is
	port (
		T0,T1,T2,T3,T4,T5,T6,T7,T8: in std_logic;
		S: out std_logic;
		A,B: in std_logic_vector(31 downto 0);
		RESULT: out std_logic_vector(31 downto 0);
		clk, reset: in std_logic
	     );
end entity;

architecture Mixed of DataPath is
    signal AREG, BREG: std_logic_vector(31 downto 0);
    signal COUNT: std_logic_vector(5 downto 0);
    signal TSUM: std_logic_vector(32 downto 0);
    signal PROD: std_logic_vector(63 downto 0);

    signal AREG_in, BREG_in, RESULT_in: std_logic_vector(31 downto 0);
    signal COUNT_in: std_logic_vector(5 downto 0);
    signal TSUM_in: std_logic_vector(32 downto 0);
    signal PROD_in: std_logic_vector(63 downto 0);
   
    signal addA,addB: std_logic_vector(31 downto 0);
    signal addRESULT: std_logic_vector(32 downto 0);

    signal decrIn, decrOut, count_reg_in: std_logic_vector(5 downto 0);
    constant C33 : std_logic_vector(5 downto 0) := "100001";
    constant C0 : std_logic_vector(0 downto 0) := "0";
    constant C6 : std_logic_vector(5 downto 0) := "000000";
    constant C32 : std_logic_vector(31 downto 0) := (others => '0');
    constant C64 : std_logic_vector(63 downto 0) := (others => '0');

    signal count_enable, 
             areg_enable, breg_enable, tsum_enable, prod_enable, result_enable: std_logic;

begin
    -- predicate
    S <= '1' when (COUNT = C6) else '0';

    --------------------------------------------------------
    --  count-related logic
    --------------------------------------------------------
    -- decrementer
    decr: Decrement6  port map (A => COUNT, B => decrOut);

    -- count register.
    count_enable <=  (T0 or T1);
    COUNT_in <= decrOut when T1 = '1' else C33;
    count_reg: DataRegister 
                   generic map (data_width => 6)
                   port map (Din => COUNT_in,
                             Dout => COUNT,
                             Enable => count_enable,
                             clk => clk);

    -------------------------------------------------
    -- AREG related logic.
    -------------------------------------------------
    areg_enable <= (T2 or T3);
    AREG_in <= A when T2 = '1' else (C0 & AREG(31 downto 1));
    ar: DataRegister 
             generic map (data_width => 32)
             port map (
			 Din => AREG_in, Dout => AREG,
				Enable => areg_enable, clk => clk);
    

    
    -------------------------------------------------
    -- BREG related logic..
    -------------------------------------------------
    BREG_in <= B;  -- not really needed, just being consistent.
    breg_enable <= T4;
    br: DataRegister generic map(data_width => 32)
			port map (Din => BREG_in, Dout => BREG, Enable => breg_enable, clk => clk);
   
    -------------------------------------------------
    -- TSUM related logic
    -------------------------------------------------
    addA <= BREG when (AREG(0) = '1') else C32;
    addB <= PROD(63 downto 32);
    ainst: Adder32 port map (addA, addB, addRESULT);
 
    TSUM_in <= addRESULT;
    tsum_enable <= T7;
    tr: DataRegister generic map(data_width => 33)
			port map(Din => TSUM_in, Dout => TSUM, Enable => tsum_enable, clk => clk);

    -------------------------------------------------
    -- PROD related logic
    -------------------------------------------------
    PROD_in <= C64 when (T5 = '1') else (TSUM & PROD(31 downto 1));
    PROD_enable <= (T5 or T6);
    pr: DataRegister generic map(data_width => 64)
			port map(Din => PROD_in, Dout => PROD, Enable => prod_enable, clk => clk);

    -------------------------------------------------
    -- RESULT related logic
    -------------------------------------------------
    RESULT_in <= PROD(31 downto 0);
    RESULT_enable <= T8;
    rr: DataRegister generic map(data_width => 32)
			port map(Din => RESULT_in, Dout => RESULT, Enable => result_enable, clk => clk);


end Mixed;

