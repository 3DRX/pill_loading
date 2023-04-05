library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity bling_driver is
    port (
             bling_clk: in std_logic;
             -- 闪烁的位，1有效
             bling_bit: in std_logic_vector(7 downto 0);
    D8, D7, D6, D5, D4, D3, D2, D1: in integer;
    DOT8, DOT7, DOT6, DOT5, DOT4, DOT3, DOT2, DOT1: in std_logic;
    OD8, OD7, OD6, OD5, OD4, OD3, OD2, OD1: out integer;
    ODOT8, ODOT7, ODOT6, ODOT5, ODOT4, ODOT3, ODOT2, ODOT1: out std_logic
);
end entity bling_driver;

architecture rtl of bling_driver is
    type ints is array (1 to 8) of integer;
    type dots is array (1 to 8) of std_logic;
    signal mos_ints: ints := (D1, D2, D3, D4, D5, D6, D7, D8);
    signal mos_dots: dots := (DOT1, DOT2, DOT3, DOT4, DOT5, DOT6, DOT7, DOT8);
begin
    process(bling_clk)
    begin
        mos_ints(8) <= D8;
        mos_ints(7) <= D7;
        mos_ints(6) <= D6;
        mos_ints(5) <= D5;
        mos_ints(4) <= D4;
        mos_ints(3) <= D3;
        mos_ints(2) <= D2;
        mos_ints(1) <= D1;
        mos_dots(8) <= DOT8;
        mos_dots(7) <= DOT7;
        mos_dots(6) <= DOT6;
        mos_dots(5) <= DOT5;
        mos_dots(4) <= DOT4;
        mos_dots(3) <= DOT3;
        mos_dots(2) <= DOT2;
        mos_dots(1) <= DOT1;
        if bling_clk = '1' then
            for i in 1 to 8 loop
                if bling_bit(i-1) = '1' then
                    mos_ints(i) <= 10;
                    mos_dots(i) <= '1';
                end if;
            end loop;
        end if;
    end process;
    OD8 <= mos_ints(8);
    OD7 <= mos_ints(7);
    OD6 <= mos_ints(6);
    OD5 <= mos_ints(5);
    OD4 <= mos_ints(4);
    OD3 <= mos_ints(3);
    OD2 <= mos_ints(2);
    OD1 <= mos_ints(1);
    ODOT8 <= mos_dots(8);
    ODOT7 <= mos_dots(7);
    ODOT6 <= mos_dots(6);
    ODOT5 <= mos_dots(5);
    ODOT4 <= mos_dots(4);
    ODOT3 <= mos_dots(3);
    ODOT2 <= mos_dots(2);
    ODOT1 <= mos_dots(1);
end architecture rtl;
