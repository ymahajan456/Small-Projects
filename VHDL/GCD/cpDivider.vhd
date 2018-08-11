--16 Bit Divider RTL Model


---Control Path------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use std.textio.all;
use ieee.numeric_std.ALL;

entity controlPath is
	port ( clk,rst : in std_logic;
				input_ready : in std_logic;
				divider_ready : out std_logic;
				output_ready : out std_logic;
				output_accepted : in std_logic;
				T : out std_logic_vector(4 downto 0);
				S : in std_logic_vector(1 downto 0));
end entity;

architecture behave of controlPath is
	
	type FSMstate is (rest,update,comp,sub,done);
	signal fsm_state : FSMstate;
	
	begin

	process(fsm_state,input_ready,output_accepted,clk,rst,S)
		variable next_state : FSMstate;
		variable Tvar : std_logic_vector(4 downto 0);
		variable done_var : std_logic;
		
	begin
		Tvar := (others => '0');
		done_var := '0';
		next_state := fsm_state;
		divider_ready <= '0';
		case fsm_state is	
			when rest =>            ---  setup all registers
				divider_ready <= '1';
				if(input_ready = '1') then
					next_state := update;
					Tvar(0) := '1';
				end if;
			when update =>          --- shift registers & checking shifts
				if(S(1) = '1') then	-- 8 shifts done
					Tvar(4) := '1';    -- update output in next state
					next_state := done;
				else	
					Tvar(1) := '1';
					next_state := comp;
				end if;
			when comp =>              -- compare if B < regD
				Tvar(2) := '1';
				next_state := sub;
			when sub =>
				next_state := update;
				if(S(0) = '1') then	   -- subtractions when B <= regD
					Tvar(3) := '1';
				end if;
			when done =>
				done_var := '1';
				if(output_accepted = '1') then
					next_state := rest;
					divider_ready <= '1';
				else
					next_state := done;    --wait untill output is accepted
				end if;
		end case;		
		
		T <= Tvar;
		output_ready <= done_var;
		
		if(clk'event and (clk = '1')) then
			if(rst = '1') then
				fsm_state <= rest;
			else
				fsm_state <= next_state;
			end if;
		end if;
   end process;
end behave;
---------------------------------------------------------------
