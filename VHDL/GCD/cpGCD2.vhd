--GCD Control path
library ieee;
use ieee.std_logic_1164.all;
use std.textio.all;
use ieee.numeric_std.ALL;

entity cpgcd2 is
	port (clk,rst : in std_logic;
			ready : out std_logic;
			inReady : in std_logic;
			outReady : out std_logic;
			outAccepted : in std_logic;
			T : out std_logic_vector(4 downto 0);
			S : in std_logic_vector(2 downto 0));
end entity;

architecture nahiPata of cpgcd2 is
	
	type FSMstate is (rest,divide,accOut,update,done);
	signal fsm_state : FSMstate;
	
	begin
	
	process(fsm_state,inReady,outAccepted,clk,rst,S)
	
		variable next_state : FSMstate;
		variable Tvar : std_logic_vector(4 downto 0);
		variable done_var : std_logic;
		
	begin
		Tvar := (others => '0');
		done_var := '0';
		next_state := fsm_state;
		ready <= '0';
		
		case fsm_state is
		
			when rest =>
				ready <= '1';
				if(inReady = '1') then
					next_state := divide;
					Tvar(0) := '1';       ---get inputs
				end if;
			when divide =>
				if(S(0) = '1') then    -- divider ready bit
					next_state := accOut;
					Tvar(1) := '1';      -- input ready bit
				end if;
			when accOut =>
				if (S(1) = '1') then    -- output ready bit
					Tvar(2) := '1';
					next_state := update;
				end if;
			when update =>
				Tvar(4) := '1';
				if(S(2) = '1') then   -- b == 0
					Tvar(3) := '1';
					next_state := done;
				else 
					next_state := divide;
				end if;
			when done =>
				done_var := '1';
				if(outAccepted = '1') then	
					next_state := rest;
				end if;
			end case;
			
			T <= Tvar;
			outReady <= done_var;
			
			if(clk'event and (clk = '1')) then
			if(rst = '1') then
				fsm_state <= rest;
			else
				fsm_state <= next_state;
			end if;
		end if;
   end process;
	
end architecture;
---------------------------------------------------------------
