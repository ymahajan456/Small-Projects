--GCD 8 Control path--

library ieee;
use ieee.std_logic_1164.all;
use std.textio.all;
use ieee.numeric_std.ALL;

entity cpgcd8 is
	port(clk,rst : in std_logic;
			start : in std_logic;
			done : out std_logic;
			erdy : in std_logic;
			srdy : out std_logic;
			T : out std_logic_vector(7 downto 0);
			S : in std_logic_vector(3 downto 0));
end entity;

architecture finally of cpgcd8 is 

	type FSMstate is (rest,update,getInput,applyInput,getGCD,doneState);
	signal fsm_state : FSMstate;
	signal stateDetect : FSMstate;
	
	begin	
	
	process(fsm_state,s,clk,rst,start,erdy)
	
		variable next_state : FSMstate;
		variable Tvar : std_logic_vector(7 downto 0);
		variable done_var : std_logic;
		
	begin

		if(clk'event and (clk = '1')) then
			if(rst = '1') then
				fsm_state <= rest;
			else
				fsm_state <= next_state;
			end if;
		end if;
	
		Tvar := (others => '0');
		done_var := '0';
		next_state := fsm_state;
		
		case fsm_state is
		
			when rest =>
				Tvar(0) := '1';      --init
				if(start = '1') then    --start with start bit
					next_state := update;
				end if;
			when update =>
				if(s(3) = '1') then     --count == 0
					Tvar(7) := '1';       --out reg enable
					next_state := doneState;
				else	
					Tvar(1) := '1';					-- count-- bit
					next_state := getInput;
				end if;
			when getInput =>
				Tvar(4) := '1';         --srdy set 1;
				if(erdy = '1') then     --input ready
					next_state := applyInput;
					if(s(0) = '1') then   --count is 7
						Tvar(3) := '1';     --apply same input to regA & regB
					else 
						Tvar(2) := '1';     --apply input only to regA
					end if;
				else 
					next_state := getInput;
				end if;
			when applyInput =>
				if(s(1) = '1') then     --gcd2 rdy
					Tvar(5) := '1';        --gcd2 in rdy
					next_state := getGCD;
				end if;
			when getGCD =>
				if(s(2) = '1') then    --gcd2 out rdy
					Tvar(6) := '1';      -- enable b reg to get GCD2 out
					next_state := update;
				end if;
			when doneState =>
				done_var := '1';      --output done;
				next_state := rest;
			end case;
			
			T <= Tvar;
			done <= done_var;
			srdy <= Tvar(4);
			stateDetect <= next_state ;
			
   end process;
	
end architecture;
