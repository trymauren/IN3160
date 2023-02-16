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
  
  component dff is
    port(
        rst_n     : in  std_logic;   -- Reset
        mclk      : in  std_logic;   -- Clock
        din       : in  std_logic;   -- Data in
        dout      : out std_logic    -- Data out
        );
  end component;

  begin
    dff_1 : dff
      port map(
              rst_n => rst_n,
              mclk => mclk, 
              dout => shift_register(1),
              din => shift_register(0)
              );
    dff_2 : dff
      port map(
              rst_n => rst_n,
              mclk => mclk, 
              dout => shift_register(2),
              din => shift_register(1)
              );
    dff_3 : dff
      port map(
              rst_n => rst_n,
              mclk => mclk, 
              dout => shift_register(3),
              din => shift_register(2)
              );
    dff_4 : dff
      port map(
              rst_n => rst_n,
              mclk => mclk, 
              dout => shift_register(4),
              din => shift_register(3)
              );
    dff_5 : dff
      port map(
              rst_n => rst_n,
              mclk => mclk, 
              dout => shift_register(5),
              din => shift_register(4)
              );
    dff_6 : dff
      port map(
              rst_n => rst_n,
              mclk => mclk, 
              dout => shift_register(6),
              din => shift_register(5)
              );
    dff_7 : dff
      port map(
              rst_n => rst_n,
              mclk => mclk, 
              dout => shift_register(7),
              din => shift_register(6)
              );
    dff_8 : dff
      port map(
              rst_n => rst_n,
              mclk => mclk, 
              dout => shift_register(8),
              din => shift_register(7)
              );
    shift_register(0) <= in_ser;
    out_par <= shift_register(8 downto 1);
    out_ser <= shift_register(8);

end shift_arc;