-- *******************************************************
-- ** Pargen, parity bit is odd (1) if the parity is odd *
-- ** If the parity is even parity bit is even (0)       *
-- *******************************************************
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library work;
use work.subprog_pck.all;

entity pargen is 
  generic (
    WIDTH : integer := 16
  );
  port (
    rst_n        : in  std_logic;
    mclk         : in  std_logic;
    indata1      : in  std_logic_vector(WIDTH-1 downto 0);
    indata2      : in  unsigned(WIDTH-1 downto 0);
    par          : out std_logic);  
end pargen;

architecture func_arc of pargen is -- solution architecture
  signal toggle_parity, xor_parity, combined_parity : std_logic;
begin
  toggle_parity <= toggle_function(indata1); -- calling toggle
  xor_parity <= xor_function(indata2);       -- calling xor
  combined_parity <= toggle_parity xor xor_parity; 

  -- clocked process for creating stable and synchronized output
  process (rst_n, mclk) is    
  begin
    if (rst_n = '0') then 
      par <= '0';
    elsif rising_edge(mclk) then 
      par <= combined_parity;
    end if;
  end process;
end func_arc;

