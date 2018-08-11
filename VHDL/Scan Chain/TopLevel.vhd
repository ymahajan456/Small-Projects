library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity TopLevel is
  port (
         TDI : in std_logic; -- Test Data In
         TDO : out std_logic; -- Test Data Out
         TMS : in std_logic; -- TAP controller signal
         TCLK : in std_logic; -- Test clock
         TRST : in std_logic -- Test reset
       );
end TopLevel;

architecture Struct of TopLevel is
  -- declare DUT component
  component DUT is
    port (
    clock, reset: in std_logic;
    A, B: in std_logic_vector(15 downto 0);
    Sum: out std_logic_vector(15 downto 0));
  end component;

  -- declare Scan-chain component.
  component Scan_Chain is
    generic (
    in_pins : integer; -- Number of input pins
    out_pins : integer -- Number of output pins
  );
  port (
         TDI : in std_logic; -- Test Data In
         TDO : out std_logic; -- Test Data Out
         TMS : in std_logic; -- TAP controller signal
         TCLK : in std_logic; -- Test clock
         TRST : in std_logic; -- Test reset
         dut_in : out std_logic_vector(in_pins-1 downto 0); -- Input for the DUT
         dut_out : in std_logic_vector(out_pins-1 downto 0) -- Output from the DUT
       );
  end component;

  -- declare I/O signals to DUT component
  signal clock, reset: std_logic;
  signal A, B, Sum: std_logic_vector(15 downto 0);

  -- declare signals to Scan-chain component.
  signal scan_chain_parallel_in : std_logic_vector(33 downto 0);
  signal scan_chain_parallel_out: std_logic_vector(15 downto 0);
begin
  scan_instance: Scan_Chain
  generic map(in_pins => 34, out_pins => 16)
  port map (TDI => TDI,
            TDO => TDO,
            TMS => TMS,
            TCLK => TCLK,
            TRST => TRST,
            dut_in => scan_chain_parallel_in,
            dut_out => scan_chain_parallel_out);
  dut_instance: DUT
  port map(clock => clock, reset => reset, A => A, B => B, Sum => Sum);

  -- connections between DUT and Scan_Chain
  reset <= scan_chain_parallel_in(33);
  clock <= scan_chain_parallel_in(32);
  A <= scan_chain_parallel_in(31 downto 16);
  B <= scan_chain_parallel_in(15 downto 0);
  scan_chain_parallel_out <= Sum;
end Struct;
