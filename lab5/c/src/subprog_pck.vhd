library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

package subprog_pck is
  function toggle_function(indata: std_logic_vector) return std_logic;
  function xor_function(indata: unsigned) return std_logic;
end;

package body subprog_pck is
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
end subprog_pck;
