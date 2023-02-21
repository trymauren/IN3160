library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

package subprog_pck is

  function toggle_function(indata: std_logic_vector) return std_logic;
  function xor_function(indata: unsigned) return std_logic;
  procedure tb_proc(signal clk: in std_logic; signal outdata: out unsigned);
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

  procedure tb_proc(signal clk: in std_logic; signal outdata: out unsigned) is
  begin
    outdata <= to_unsigned(0,outdata'length);
    for i in 1 to 255 loop
      wait until rising_edge(clk);
      outdata <= to_unsigned(i, outdata'length); 
    end loop;
  end tb_proc;
end subprog_pck;

