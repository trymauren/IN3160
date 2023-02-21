-- *******************************************************
-- ** Pargen, parity bit is odd (1) if the parity is odd *
-- ** If the parity is even parity bit is even (0)       *
-- *******************************************************
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
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
architecture rtl1 of pargen is -- task architecture
  signal toggle_parity, xor_parity, combined_parity : std_logic;
begin  
  --Method 1: parity toggle, using for, loop and variables.   
  process (all) is
    variable toggle : std_logic;
  begin
    toggle := '0';
    for i in indata1'range loop
      if indata1(i) = '1' then
        toggle := not toggle;
      end if;        
    end loop;
    toggle_parity <= toggle;
  end process;
  -- Method: 2 parity using xor function (VHDL 2008)
  xor_parity <= xor(indata2);  -- Cascaded XORs 
  -- combining parity using the xor operator 
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
end rtl1;

architecture func_arc of pargen is -- solution architecture
  signal toggle_parity, xor_parity, combined_parity : std_logic;

  function toggle_function(indata: std_logic_vector) return std_logic is
    variable toggle: std_logic := '0';
  begin
    for i in indata'range loop
      if indata(i) = '1' then
        toggle := not toggle;
      end if;        
    end loop;
    return toggle;
  end toggle_function;

  function xor_function(indata: unsigned) return std_logic is
    variable parity: std_logic;
  begin
    parity := xor(indata);  -- Cascaded XORs 
    return parity;
  end xor_function;

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

