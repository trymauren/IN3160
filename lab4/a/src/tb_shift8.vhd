library ieee;
use ieee.std_logic_1164.all;

entity tb_shift8 is
end tb_shift8;

architecture behavioural of tb_shift8 is
  
  -- see https://vhdlwhiz.com/clocked-process/
  constant clk_period : time := 100 ns;

  signal mclk : std_logic := '1';
  signal rst_n : std_logic := '0';
  signal in_ser : std_logic := '0';
  signal out_ser : std_logic;
  signal out_par : std_logic_vector(7 downto 0);


  component shift8
    port(
        rst_n : in std_logic;
        mclk : in std_logic;
        in_ser : in std_logic;
        out_ser : out std_logic;
        out_par : out std_logic_vector(7 downto 0)
      );
  end component;

begin

  UUT_0: entity work.shift8(shift_arc)
    port map(
            rst_n  => rst_n,
            mclk => mclk,
            in_ser => in_ser,
            out_ser => out_ser,
            out_par => out_par
            );

  mclk <= not mclk after clk_period/2; -- process that generates clock

  process is
  begin
    rst_n <= '1';
    wait for 50 ns;
    in_ser <= '1';
    wait for 50 ns;
    in_ser <= '0';
    wait for 50 ns;
    in_ser <= '0';
    wait for 50 ns;
    in_ser <= '0';
    wait for 50 ns;
    in_ser <= '1';
    wait for 600 ns;
    rst_n <= '0';
    wait;
    end process;
end behavioural;
