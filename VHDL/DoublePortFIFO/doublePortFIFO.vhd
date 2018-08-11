library ieee;
use ieee.numeric_std.all;
use ieee.std_logic_1164.all;
use ieee.math_real.all;
use work.all;
--use work.superscalar.all;

entity doubleport_fifo is
	generic(
		depth 		: integer := 32;
		word_length : integer := 5); 
	port(
		fifo_in0 : in std_logic_vector(word_length-1 downto 0);
		fifo_in1 : in std_logic_vector(word_length-1 downto 0);
		fifo_out0 : out std_logic_vector(word_length-1 downto 0);
		fifo_out1 : out std_logic_vector(word_length-1 downto 0);
		valid_out0, valid_out1, full, only_one_empty : out std_logic;
		wr0, wr1, rd0, rd1, clk, rst : in std_logic);
end entity;
-- Architecture Notes:
-- Can't use comparators as they can't differentiate between empty and full case

architecture behav of doubleport_fifo is
	type bus_array is array(natural range <>) of std_logic_vector(word_length-1 downto 0);
	signal memory_in : bus_array(depth-1 downto 0); --(word_length-1 downto 0);
	signal memory_out : bus_array(depth-1 downto 0); --(word_length-1 downto 0);
	constant pointer_length : integer := integer(ceil(log2(real(depth))));
	constant counter_length : integer := integer(ceil(log2(real(depth+1))));
	signal in_pointer0 : std_logic_vector(pointer_length-1 downto 0) := (others => '0');
	signal in_pointer1 : std_logic_vector(pointer_length-1 downto 0) := (others => '0');
	signal out_pointer0 : std_logic_vector(pointer_length-1 downto 0) := (others => '0');
	signal out_pointer1 : std_logic_vector(pointer_length-1 downto 0) := (others => '0');
	signal counter : std_logic_vector(counter_length-1 downto 0) := (others => '0');
	signal reg_wr_data0, reg_wr_data1 : std_logic_vector(word_length-1 downto 0) := (others => '0');
	signal reg_rd_data0, reg_rd_data1 : std_logic_vector(word_length-1 downto 0) := (others => '0');
	
	-- select / enable signals
	signal wr0_reg : std_logic := '0';
	signal wr1_reg : std_logic := '0';
	signal rd_sel : std_logic := '0';
	signal wr_reg : std_logic_vector(depth-1 downto 0) := (others => '0');
	signal in_pointer0_ena, in_pointer1_ena : std_logic := '1';
	signal out_pointer0_ena, out_pointer1_ena : std_logic := '1';
	signal counter_ena : std_logic := '1';
	-- in signals
	signal in_pointer0_in : std_logic_vector(pointer_length-1 downto 0) := (others => '0');
	signal in_pointer1_in : std_logic_vector(pointer_length-1 downto 0) := (others => '0');
	signal out_pointer0_in : std_logic_vector(pointer_length-1 downto 0) := (others => '0');
	signal out_pointer1_in : std_logic_vector(pointer_length-1 downto 0) := (others => '0');
	signal counter_in : std_logic_vector(counter_length-1 downto 0) := (others => '0');
	
	signal full_signal, only_one_empty_signal : std_logic := '0';
	signal valid_out0_signal, valid_out1_signal : std_logic := '0';
	
	component my_reg is
		generic ( data_width : integer);
		port(
			clk, ena, clr: in std_logic;
			Din: in std_logic_vector(data_width-1 downto 0);
			Dout: out std_logic_vector(data_width-1 downto 0));
	end component;
	
begin
	
	-- connect memory ins and outs
	MEMORY:
	for i in depth-1 downto 0 generate
		REGx : my_reg
			generic map(word_length)
			port map(
				clk => clk, clr => rst, ena => wr_reg(i),
				Din => memory_in(i), Dout => memory_out(i));
	end generate;
	
	COUNTERINST: my_reg
		generic map(counter_length)
		port map(clk => clk, clr => rst, ena => counter_ena,
				Din => counter_in, Dout => counter);
				
	IN_POINTER0INST : my_reg
		generic map(pointer_length)
		port map(clk => clk, clr => rst, ena => in_pointer0_ena,
				Din => in_pointer0_in, Dout => in_pointer0);
				
	IN_POINTER1INST : my_reg
		generic map(pointer_length)
		port map(clk => clk, clr => '0', ena => in_pointer1_ena,
				Din => in_pointer1_in, Dout => in_pointer1);
				
	OUT_POINTER0INST : my_reg
		generic map(pointer_length)
		port map(clk => clk, clr => rst, ena => out_pointer0_ena,
				Din => out_pointer0_in, Dout => out_pointer0);
				
	OUT_POINTER1INST : my_reg
		generic map(pointer_length)
		port map(clk => clk, clr => '0', ena => out_pointer1_ena,
				Din => out_pointer1_in, Dout => out_pointer1);
				
	valid_out0_signal <= '0' when (counter = std_logic_vector(to_unsigned(0, counter_length))) else '1';
	valid_out1_signal <= '0' when (counter < std_logic_vector(to_unsigned(2, counter_length))) else '1';
	valid_out0 <= valid_out0_signal;
	valid_out1 <= valid_out1_signal;
	
	full_signal <= '1' when (counter = std_logic_vector(to_unsigned(depth, counter_length))) else '0';
	--full_signal <= '0';
	only_one_empty_signal <= '1' when(counter = std_logic_vector(to_unsigned(depth-1 , counter_length))) else '0';
	full <= full_signal;
	only_one_empty <= only_one_empty_signal;
	
	reg_wr_data0 <= fifo_in1 when((wr1 and (not wr0)) = '1') else fifo_in0;
	reg_wr_data1 <= fifo_in1;
	
	rd_sel <= rd0 and rd1;
	fifo_out0 <= reg_rd_data0;
	fifo_out1 <= reg_rd_data1 when(rd_sel = '1') else reg_rd_data0;

	fifo_logic : process(rst, wr0, wr1, rd0, rd1,  full_signal, only_one_empty_signal, valid_out0_signal, valid_out1_signal, counter, in_pointer0, in_pointer1, out_pointer0, out_pointer1)
		variable wr_num, rd_num : std_logic_vector(1 downto 0) := (others => '0'); 
	begin
		if(rst = '1') then
			wr0_reg <= '0'; wr1_reg <= '0';
			in_pointer0_in <= (others => '0');
			in_pointer1_in <= std_logic_vector(to_unsigned(1, pointer_length));
			out_pointer0_in <= (others => '0');
			out_pointer1_in <= std_logic_vector(to_unsigned(1, pointer_length));
			counter_in <= (others => '0');
		else
			if((wr0 and wr1 and (not (full_signal or only_one_empty_signal))) = '1') then  		-- wr logic
				wr_num := "10";
				wr0_reg <= '1';
				wr1_reg <= '1';
			elsif(((wr0 or wr1) and (not full_signal) ) = '1') then
				wr_num := "01";
				wr0_reg <= '1';
				wr1_reg <= '0';
			else
				wr_num := "00";
				wr0_reg <= '0';
				wr1_reg <= '0';
			end if;
			if((rd0 and rd1 and valid_out0_signal and valid_out1_signal) = '1') then		-- rd logic
				rd_num := "10";
			elsif(((rd0 or rd1) and valid_out0_signal) = '1') then
				rd_num := "01";
			else
				rd_num := "00";
			end if;
			counter_in <= std_logic_vector(unsigned(counter) + unsigned(wr_num) - unsigned(rd_num));
			out_pointer0_in <= std_logic_vector(unsigned(out_pointer0) + unsigned(rd_num));
			out_pointer1_in <= std_logic_vector(unsigned(out_pointer1) + unsigned(rd_num));
			in_pointer0_in <= std_logic_vector(unsigned(in_pointer0) + unsigned(wr_num));
			in_pointer1_in <= std_logic_vector(unsigned(in_pointer1) + unsigned(wr_num));
		end if;
	end process;
	
	wr_ena_to_reg : process(wr0_reg, wr1_reg, in_pointer0, in_pointer1)
	begin
		wr_reg <= (others => '0');
		if(wr0_reg = '1') then
			wr_reg(to_integer(unsigned(in_pointer0))) <= wr0_reg;
		end if;
		if(wr1_reg = '1') then
			wr_reg(to_integer(unsigned(in_pointer1))) <= wr1_reg;
		end if;
	end process;
	
	wr_to_reg: process(in_pointer0, in_pointer1, reg_wr_data0, reg_wr_data1)
	begin
		memory_in <= (others => (others => '-'));
		memory_in(to_integer(unsigned(in_pointer0))) <= reg_wr_data0;
		memory_in(to_integer(unsigned(in_pointer1))) <= reg_wr_data1;
	end process;
	
	reg_to_rd: process(out_pointer0, out_pointer1, memory_out)
	begin
		reg_rd_data0 <= memory_out(to_integer(unsigned(out_pointer0)));
		reg_rd_data1 <= memory_out(to_integer(unsigned(out_pointer1)));
	end process;
end architecture;

