library IEEE;
use IEEE.std_logic_1164.all;

entity DECODER is
  port(
    input : in std_logic_vector(1 downto 0);
    output : out std_logic_vector(3 downto 0)
  );

end DECODER;

architecture ARKITEKT of DECODER is
begin process(all)
  begin case input is
    when "00" => output <= "1110";
    when "01" => output <= "1101";
    when "10" => output <= "1011";
    when others => output <= "0111";
     
  end case;
end process;
end ARKITEKT;