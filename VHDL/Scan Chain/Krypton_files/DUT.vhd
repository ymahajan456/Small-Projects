library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
entity DUT is
  port (
  clock, reset: in std_logic;
  A, B: in std_logic_vector(15 downto 0);
  Sum: out std_logic_vector(15 downto 0));
end entity;
architecture Behave of DUT is
  signal sumvector: std_logic_vector(15 downto 0);
begin
  process(clock, reset)
  begin
    if (reset = '1') then
      sumvector <= std_logic_vector(to_unsigned(0, sumvector'length));
    elsif (clock'event and clock = '1') then
      sumvector <= std_logic_vector(unsigned(A) + unsigned(B));
    end if;
  end process;
  Sum <= sumvector;
end Behave;
