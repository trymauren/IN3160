library ieee;
use ieee.std_logic_1164.all;

entity shiftn is
  generic(
    width : positive := 64
    );
  port(
      rst_n : in std_logic;
      mclk : in std_logic;
      in_ser : in std_logic;
      out_ser : out std_logic;
      out_par : out std_logic_vector(width-1 downto 0)
  );

end shiftn;

architecture shift_arc of shiftn is

  signal shift_register : std_logic_vector(width downto 0);
  
  component dff is
    port(
        rst_n     : in  std_logic;   -- Reset
        mclk      : in  std_logic;   -- Clock
        -- Shifted data in and out
        din       : in  std_logic;   -- Data in
        dout      : out std_logic    -- Data out
        );
  end component;
  begin
    instantiating_loop : for i in 0 to width-1 generate komponent: dff
      port map(
              rst_n => rst_n,
              mclk => mclk,
              dout => shift_register(i+1),
              din => shift_register(i)
              );
    end generate;

  shift_register(0) <= in_ser;
  out_par <= shift_register(width downto 1);
  out_ser <= shift_register(width);

end shift_arc;