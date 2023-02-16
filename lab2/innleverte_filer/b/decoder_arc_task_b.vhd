library IEEE;
use IEEE.std_logic_1164.all;

architecture ARKITEKT of DECODER is
    
    begin
    
      with input select
        output <= "1110" when "00",
                  "1101" when "01",
                  "1011" when "10",
                  "1001" when "11", -- Changed the decoder so that it displays the decimal number 9 ("1001"), when given the decimal number 3 ("11") as input
                  "0000" when others;
    end ARKITEKT;
