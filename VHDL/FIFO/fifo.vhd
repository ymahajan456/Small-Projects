library ieee;
use ieee.numeric_std.all;
use ieee.std_logic_1164.all;
use ieee.math_real.all;

entity fifo is
	generic(
		fifo_depth	: integer := 16;
		word_length : integer := 16);
	port(
		fifo_in  : in std_logic_vector(word_length-1 downto 0);
		fifo_out : out std_logic_vector(word_length-1 downto 0);
		empty, full : out std_logic;
		wr, rd, clk, rst : in std_logic);
end entity;

architecture behav of fifo is
	constant pointer_length : integer := integer(ceil(log2(real(fifo_depth))));
	constant counter_length : integer := integer(ceil(log2(real(fifo_depth + 1))));
	type memory_vector is array (fifo_depth-1 downto 0) of std_logic_vector(word_length-1 downto 0);
	signal fifo_memory : memory_vector;
	signal wr_pointer, wr_pointer_in : std_logic_vector(pointer_length-1 downto 0) := (others => '0');
	signal rd_pointer, rd_pointer_in : std_logic_vector(pointer_length-1 downto 0) := (others => '0');
	signal counter, counter_in : std_logic_vector(counter_length-1 downto 0) := (others => '0');
	signal wr_ena, rd_ena, counter_ena : std_logic := '0';
	signal read, write, is_empty, is_full : std_logic := '0';
	signal reg_ena : std_logic_vector(fifo_depth-1 downto 0) := (others => '0');
	
	component my_reg is
		generic ( data_width : integer);
		port(
			clk, ena, clr: in std_logic;
			Din: in std_logic_vector(data_width-1 downto 0);
			Dout: out std_logic_vector(data_width-1 downto 0));
	end component;
	
begin
	
	is_full <= '1' when (counter = std_logic_vector(to_unsigned(fifo_depth, counter_length))) else '0';
	is_empty <= '1' when (counter = std_logic_vector(to_unsigned(0, counter_length))) else '0';
	
	counter_reg : my_reg
		generic map(counter_length)
		port map(
			clk => clk, clr => rst, ena => counter_ena,
			Din => counter_in, Dout => counter);
		
	wr_pointer_reg : my_reg
		generic map(pointer_length)
		port map(
			clk => clk, clr => rst, ena => wr_ena,
			Din => wr_pointer_in, Dout => wr_pointer);
	wr_pointer_in <= std_logic_vector(unsigned(wr_pointer) + to_unsigned(1, pointer_length));
	
	rd_pointer_reg : my_reg
		generic map(pointer_length)
		port map(
			clk => clk, clr => rst, ena => rd_ena,
			Din => rd_pointer_in, Dout => rd_pointer);
	rd_pointer_in <= std_logic_vector(unsigned(rd_pointer) + to_unsigned(1, pointer_length));
	
	memory :
	for i in fifo_depth-1 downto 0 generate
		REGx : my_reg
			generic map(word_length)
			port map(
				clk => clk, clr => rst, ena => reg_ena(i),
				Din => fifo_in, Dout => fifo_memory(i));
	end generate;
	
	fifo_out <= fifo_memory(to_integer(unsigned(wr_pointer)));
	
	fifo_logic : process(clk, rd, wr)
		variable read_var, write_var : std_logic := '0';
		variable counter_ena_var :std_logic := '0';
	begin
		if(clk = '1' and clk'event) then
			if(rd = '1' and wr = '0') then
				read_var := '1';
				counter_in <= std_logic_vector(unsigned(counter) - to_unsigned(1, pointer_length));
				counter_ena_var := '1';
			elsif(wr = '1' and rd = '0') then
				write_var := '1';
				counter_in <= std_logic_vector(unsigned(counter) + to_unsigned(1, pointer_length));
				counter_ena_var := '1';
			elsif(wr = '1' and rd = '1') then
				read_var := '1';
				write_var := '1';
			end if;
		end if;
		write <= write_var;
		read <= read_var;
	end process;
	
	process(write, wr_pointer)
	begin
		reg_ena <= (others => '0');
		if(write = '1') then
			reg_ena(to_integer(unsigned(wr_pointer))) <= write;
		end if;
	end process;
end architecture ;
