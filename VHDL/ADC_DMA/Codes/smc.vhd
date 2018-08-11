library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

package smc_parts is

	component smc_control is
		port(
			clk, reset : in std_logic;
			mc_start, mc_write: in std_logic;
			mc_done: out std_logic;
			T: out std_logic_vector(3 downto 0);
			OE_bar, CS_bar, WE_bar: out std_logic);
	end component;

	component smc_data is	
		port (
			clk: in std_logic;
			IO: inout std_logic_vector(7 downto 0);			--I/O Bits of the SRAM
			A: out std_logic_vector(12 downto 0);			--Address of SRAM
			mc_write_data: in std_logic_vector(7 downto 0);	
			mc_read_data: out std_logic_vector(7 downto 0);
			mc_address: in std_logic_vector(12 downto 0);
			T : in std_logic_vector(3 downto 0));			--Transfer Logic
	end component;

end package;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity smc_control is
	port(
		clk, reset : in std_logic;
		mc_start, mc_write: in std_logic;
		mc_done: out std_logic;
		T: out std_logic_vector(3 downto 0);
		OE_bar, CS_bar, WE_bar: out std_logic);
end entity;

architecture control of smc_control is
	type state is (ready, addr_set, wr, wr_wait, rd, rd_wait1, rd_wait2, done_rd, done_wr);	--FSM States
	signal we_temp, oe_temp, cs_temp: std_logic;	--Glitch removal temporary signals
	signal Q, nQ: state;	--state variables
begin

	process(clk)	--delay process
	begin
		if(clk'event and clk='1') then
			Q <= nQ;
			WE_bar <= we_temp;
			OE_bar <= oe_temp;
			CS_bar <= cs_temp;	
		end if;
	end process;
	
	process(Q, mc_start,mc_write, reset)
		variable T_temp: std_logic_vector(3 downto 0);
	begin
		--Default Values
		T_temp := "0000";
		we_temp <= '1';
		oe_temp <= '1';
		cs_temp <= '0';
		mc_done <= '0';
		nQ <= Q;
		
		if (reset='1') then	--check for reset
			nQ <= ready;	--reset the FSM to ready state
			cs_temp <= '1';
		else
			case Q is
				when ready =>
					cs_temp <= '1';
					if(mc_start = '1') then
						cs_temp <= '0';
						T_temp(0) := '1';	--Initialise the address register
						nQ <= addr_set;
					end if;
					
				when addr_set =>
					if(mc_write = '1') then
							nQ <= wr;
							T_temp(1) := '1';	--Initialise the write data register
							we_temp <= '0';
					else 
							nQ <= rd;
					end if;
					
				when wr =>
					we_temp <= '0';		--Enable the write enable
					T_temp(2) := '1';	--Give the input to the SRAM
					nQ <= wr_wait;
					
				when wr_wait =>
					we_temp <= '0';
					T_temp(2) := '1';
					nQ <= done_wr;
				
				when rd =>
					oe_temp <= '0';		--Reading: Output enabled
					nQ <= rd_wait1;		--Wait one clock cycle
				
				when rd_wait1 =>
					oe_temp <= '0';		--Output Enabled
					nQ <= rd_wait2;		--Wait another clock cycle
					
				when rd_wait2 =>
					oe_temp <= '0';
					T_temp(3) := '1'; 	--Take output from the SRAM
					nQ <= done_rd;
					
				when done_rd =>
					mc_done <= '1';		--Done reading
					nQ <= ready;
					
				when done_wr =>
					T_temp(2) := '1';
					mc_done <= '1';		--Done writing
					nQ <= ready;
					
				when others =>
					nQ <= ready;
					cs_temp <= '1';
			end case;
		end if;
		T <= T_temp;
	end process;
	
end architecture;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.basic.all;

entity smc_data is	
	port (
		clk: in std_logic;
		IO: inout std_logic_vector(7 downto 0);
		A: out std_logic_vector(12 downto 0);
		mc_write_data: in std_logic_vector(7 downto 0);
		mc_read_data: out std_logic_vector(7 downto 0);
		mc_address: in std_logic_vector(12 downto 0);
		T : in std_logic_vector(3 downto 0));
end entity;

architecture data of smc_data is
	signal address, address_in: std_logic_vector(12 downto 0);
	signal wr_data, wr_data_in, rd_data, rd_data_in: std_logic_vector(7 downto 0);
	signal address_ena, wr_data_ena, rd_data_ena: std_logic;
begin
	
	IO <= wr_data when (T(2) = '1') 	--tristate buffer implementation
		else (others => 'Z');
		
	mc_read_data <= rd_data;
	A <= address;
	----------------------
	--Address Register
	----------------------
	
	address_ena <= T(0);
	address_in <= mc_address;
	
	address_reg: my_reg
		generic map(13)
		port map(
			din => address_in, dout => address, clk => clk, ena => address_ena);
			
	----------------------
	--Write Data Register
	----------------------
	
	wr_data_ena <= T(1);
	wr_data_in <= mc_write_data;
	
	wr_data_reg: my_reg
		generic map(8)
		port map(
			din => wr_data_in, dout => wr_data, clk => clk, ena => wr_data_ena);
			
	----------------------
	--Read Data Register
	----------------------
	
	rd_data_ena <= T(3);
	rd_data_in <= IO when (T(3) = '1')
		else (others => 'Z');
	
	rd_data_reg: my_reg
		generic map(8)
		port map(
			din => rd_data_in, dout => rd_data, clk => clk, ena => rd_data_ena);
			
end architecture;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.smc_parts.all;

entity smc is
	port (
		clk, reset : in std_logic;
		mc_start, mc_write: in std_logic;
		mc_done: out std_logic;
		OE_bar, CS_bar, WE_bar: out std_logic;
		IO: inout std_logic_vector(7 downto 0);
		A: out std_logic_vector(12 downto 0);
		mc_write_data: in std_logic_vector(7 downto 0);
		mc_read_data: out std_logic_vector(7 downto 0);
		mc_address: in std_logic_vector(12 downto 0));
end entity;

architecture rtl of smc is
	signal T: std_logic_vector(3 downto 0);
	
begin 
	control_path: smc_control
		port map(
		clk => clk, reset => reset, 
		mc_start => mc_start, mc_write => mc_write,
		mc_done => mc_done,
		OE_bar => OE_bar, CS_bar => CS_bar, WE_bar => WE_bar,
		T => T
		);
		
	data_path: smc_data
		port map(
		clk => clk,
		IO => IO, mc_write_data => mc_write_data,
		mc_read_data => mc_read_data,
		mc_address => mc_address,
		A => A, T => T
		);
		
end architecture;
			
