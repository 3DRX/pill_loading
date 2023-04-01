library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity counter is
    port(
            CLK: in std_logic;
            RST: in std_logic;
            N: in integer;
            O: out integer
        );
end entity counter;

architecture behav of counter is
    signal temp: integer := 0;
begin
    process(CLK)
    begin
        if CLK'event and CLK = '1' then
            if temp = N - 1 then
                temp <= 0;
            else
                temp <= temp + 1;
            end if;
        end if;
    end process;
    O <= temp;
end architecture behav;
