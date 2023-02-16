library IEEE;
use IEEE.std_logic_1164.all;

entity DECODER_TEST is
-- Empty entity of the testbench
end DECODER_TEST;

architecture TESTBENCH of DECODER_TEST is
  -- Area for declarations

  -- Component declaration
  component DECODER
    port(
        input   : in  std_logic_vector(1 downto 0);
        output  : out std_logic_vector(3 downto 0)
        );
  end component;

  signal tb_input  : std_logic_vector(1 downto 0) := "00";
  signal tb_output : std_logic_vector(3 downto 0) := "0000";
  
begin
  -- Concurrent statements

  -- Instantiating the unit under test
  UUT : DECODER
    port map
    (
      input   => tb_input,
      output  => tb_output
      );
      

  STIMULI :
  process
  begin
    tb_input <= "00";
    wait for 100 ns;
    tb_input <= "01";
    wait for 100 ns;
    tb_input <= "10";
    wait for 100 ns;
    tb_input <= "11";
    wait;
  end process;
  
end TESTBENCH;
