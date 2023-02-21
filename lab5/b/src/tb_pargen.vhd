library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
entity tb_pargen is
  generic (
    TB_WIDTH : integer := 16
  );
end tb_pargen;
architecture beh1 of tb_pargen is
  component pargen is
    generic (
      WIDTH : integer := TB_WIDTH
    );
    port (
      rst_n   : in  std_logic;
      mclk    : in  std_logic;
      indata1 : in  std_logic_vector(WIDTH-1 downto 0);
      indata2 : in  unsigned(WIDTH-1 downto 0);
      par     : out std_logic
    );
  end component pargen;
    
  signal rst_n   : std_logic;
  signal mclk    : std_logic;
  signal indata1 : std_logic_vector(TB_WIDTH-1 downto 0);
  signal indata2 : unsigned(TB_WIDTH-1 downto 0);
  signal par     : std_logic;
  
begin
  UUT: entity work.pargen(func_arc)
    port map (
      rst_n   => rst_n,   
      mclk    => mclk,    
      indata1 => indata1, 
      indata2 => indata2, 
      par     => par
    );    
    
  P_CLK_0: process
  begin
    mclk <= '0';
    wait for 50 ns;
    mclk <= '1';
    wait for 50 ns;    
  end process P_CLK_0;
  rst_n  <= '0', '1' after 100 ns;
  indata1 <= x"0001",
             x"0003" after 500 ns,
             x"0004" after 900 ns; 
  indata2 <= x"0000",
             x"0001" after 100 ns,
             x"0003" after 200 ns,
             x"0007" after 300 ns,
             x"000F" after 400 ns, 
             x"0000" after 500 ns,
             x"0001" after 600 ns,
             x"0003" after 700 ns,
             x"0007" after 800 ns,
             x"000F" after 900 ns;
end beh1;