library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity bling_driver is
    port (
             bling_clk: in std_logic;
             bling_bit: in integer;
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
    signal o_mos_ints: ints := (D1, D2, D3, D4, D5, D6, D7, D8);
    signal o_mos_dots: dots := (DOT1, DOT2, DOT3, DOT4, DOT5, DOT6, DOT7, DOT8);
begin
    process(bling_clk)
    begin
        if bling_clk = '1' and bling_bit < 10 then
            o_mos_ints(bling_bit) <= 10;
            o_mos_dots(bling_bit) <= '1';
        end if;
    end process;
    OD8 <= o_mos_ints(8);
    OD7 <= o_mos_ints(7);
    OD6 <= o_mos_ints(6);
    OD5 <= o_mos_ints(5);
    OD4 <= o_mos_ints(4);
    OD3 <= o_mos_ints(3);
    OD2 <= o_mos_ints(2);
    OD1 <= o_mos_ints(1);
    ODOT8 <= o_mos_dots(8);
    ODOT7 <= o_mos_dots(7);
    ODOT6 <= o_mos_dots(6);
    ODOT5 <= o_mos_dots(5);
    ODOT4 <= o_mos_dots(4);
    ODOT3 <= o_mos_dots(3);
    ODOT2 <= o_mos_dots(2);
    ODOT1 <= o_mos_dots(1);
end architecture rtl;
