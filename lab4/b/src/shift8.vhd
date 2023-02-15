library ieee;
use ieee.std_logic_1164.all;

entity shift8 is

  port(
      rst_n : in std_logic;
      mclk : in std_logic;
      in_ser : in std_logic;
      out_ser : out std_logic;
      out_par : out std_logic_vector(7 downto 0)
  );

end shift8;

architecture shift_arc of shift8 is

  signal shift_register : std_logic_vector(8 downto 0);
  
  component dff is -- ikke endre denne! Den skal være lik som entitet i dff.vhd
    port(
        rst_n     : in  std_logic;   -- Reset
        mclk      : in  std_logic;   -- Clock
        -- Shifted data in and out
        din       : in  std_logic;   -- Data in
        dout      : out std_logic    -- Data out
        );
  end component;
  begin
    instantiating_loop : for i in 0 to 7 generate komponent: dff
      port map(
              --din => din(i)
              --dout => dout(i)
              rst_n => rst_n, --good
              mclk => mclk, --good
              dout => shift_register(i+1),
              din => shift_register(i)
              );
    end generate;

  shift_register(0) <= in_ser;
  out_par <= shift_register(8 downto 1);
  out_ser <= shift_register(8);

end shift_arc;