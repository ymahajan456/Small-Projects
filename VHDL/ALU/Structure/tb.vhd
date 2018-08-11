library ieee;
use ieee.std_logic_1164.all;
use std.textio.all;
use ieee.numeric_std.ALL;
use ieee.std_logic_textio.all;

entity tbtext is
end tbtext;

architecture test of tbtext is
	signal clk,rst : std_logic := '1';
	signal a,b,c : std_logic_vector(7 downto 0) := (others =>'0');
	signal op : std_logic_vector(1 downto 0) := (others =>'0');
	constant clk_p : time := 10 ns;
	
	component alu
		port(  clk,rst : in std_logic;   --clock signal
		a,b : in std_logic_vector(7 downto 0);  --input signals 8Bit
		op : in std_logic_vector(1 downto 0);  --operation code
		c : out std_logic_vector(7 downto 0) -- ou  signal 8Bit
		);
	end component;
	
	function vec_to_str(x:std_logic_vector) return String is
		variable L : Line;
		variable W : String(1 to x'length) :=(others => ' ');
		begin
		write(L,x);
		W(L.all'range) := L.all;
		Deallocate(L);
		return W;
	end vec_to_str;

	begin
	
	clk_process : process
	begin
       	  clk <= '1';
	  wait for clk_p/2;
	  clk <= '0';
	  wait for clk_p/2;
	end process;

	sim_process : process
	file f : text open read_mode is "output.txt";
	variable a_b,b_b,c_b : std_logic_vector(7 downto 0);
	variable op_b : std_logic_vector(1 downto 0);
	variable L : line;
	variable fail : integer :=0;
	variable c_tmp : std_logic_vector(7 downto 0);

	begin
	wait for clk_p;
	while not endfile(f) loop	
	readline (f,L);
	read (L,a_b);
	read (L,b_b);
	read (L,op_b);
	read (L,c_b);
	
	a <= a_b;
	b <= b_b;
	op <= op_b;
	wait for 2 ns;

	if not(c_b = c) then
	fail := fail +1;
	assert false report "Error. Input is" & vec_to_str(a_b) & " " & vec_to_str(b_b) & " " & vec_to_str(op) & " Expected" & vec_to_str(c_b) & "Observed" & vec_to_str(c)
	severity note;
	end if;
	wait for 8 ns;
	end loop; 
	
	wait;
	assert false report "Test Completed " & integer'image(fail) & " failures"
	severity note;  
	end process;

	dut : alu
	port map ( clk => clk,
		rst => rst,
		b => b,
		op => op,
		a => a,
		c => c
	);

end test;




