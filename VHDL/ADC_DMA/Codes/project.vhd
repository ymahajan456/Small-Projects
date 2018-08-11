library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.basic.all;

entity project is 
	port(
		clk, reset : in std_logic;
		capture, display : in std_logic;
		data_in : in std_logic_vector(7 downto 0); 		--adc
		WR_bar, RD_bar, CS_bar: out std_logic;
		INTR_bar: in std_logic;
		OE_bar, CE_bar, WE_bar: out std_logic; 			--smc
		IO: inout std_logic_vector(7 downto 0);
		A: out std_logic_vector(12 downto 0);
		dac_data : out std_logic_vector(7 downto 0);	--dac
		--adc_out_rdy : out std_logic;
		dacDataCpy : out std_logic_vector(7 downto 0));	--dac
end entity;

architecture enclose of project is 

	component ccu is 
		port(
		clk, reset : in std_logic;
		capture, display : in std_logic;
		adc_run : out std_logic;
		adc_output_ready : in std_logic;
		adc_data : in std_logic_vector(7 downto 0);
		mc_start,mc_write : out std_logic;
		mc_address : out std_logic_vector(12 downto 0);
		mc_write_data : out std_logic_vector(7 downto 0);
		mc_read_data : in std_logic_vector(7 downto 0);
		mc_done : in std_logic;
		dac_data : out std_logic_vector(7 downto 0));
	end component;
	
	component smc is 
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
	end component;
	
	component adcc is 
		port (
		clk, reset: in std_logic;
		adc_run: in std_logic;
		adc_output_ready: out std_logic;
		adc_data: out std_logic_vector(7 downto 0);
		data_in: in std_logic_vector(7 downto 0);
		WR_bar, RD_bar, CS_bar: out std_logic;
		INTR_bar: in std_logic);
	end component;
	
	signal adc_run,adc_output_ready : std_logic;
	signal adc_data,dacData : std_logic_vector(7 downto 0);
	signal mc_start,mc_write,mc_done : std_logic;
	signal mc_address : std_logic_vector(12 downto 0);
	signal mc_write_data,mc_read_data : std_logic_vector(7 downto 0);
	signal capture_sync,display_sync,reset_sync : std_logic := '0';
	signal clk_smc : std_logic; 
begin

	dac_data <= dacData;
	dacDataCpy <= mc_address(7 downto 0);
	--adc_out_rdy <= adc_output_ready;

	process(clk)
	begin
		if(clk'event and (clk = '1')) then
			display_sync <= display;
			capture_sync <= capture;
			reset_sync <= reset;
		end if;
	end process;
	
	compccu : ccu 
		port map(
			clk => clk, reset => reset_sync,
			capture => capture_sync, display => display_sync,
			adc_run => adc_run, adc_output_ready => adc_output_ready, adc_data => adc_data,
			mc_start => mc_start, mc_write => mc_write, mc_address => mc_address, 
			mc_write_data => mc_write_data, mc_read_data => mc_read_data,
			mc_done => mc_done, dac_data => dacData);
	
	compadcc : adcc 
		port map(
			clk => clk, reset => reset_sync,
			adc_run => adc_run, adc_output_ready => adc_output_ready, adc_data => adc_data,
			data_in => data_in,
			WR_bar => WR_bar, RD_bar => RD_bar, CS_bar => CS_bar, INTR_bar => INTR_bar);
	
	compsmc : smc 
		port map(
			clk => clk_smc, reset => reset_sync,
			mc_start => mc_start, mc_write => mc_write, mc_done => mc_done,
			OE_bar => OE_bar, CS_bar => CE_bar, WE_bar => WE_bar,
			IO => IO, A => A,
			mc_write_data => mc_write_data, mc_read_data => mc_read_data, mc_address => mc_address);
	
	--scaler : clk_divider
		--generic map(3)	--clk division by pow(2,3)
		--port map(clk_in => clk, clk_out => clk_smc);
	clk_smc <= clk;
end architecture;