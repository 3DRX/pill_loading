library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity bling_driver is
    port (
    D8, D7, D6, D5, D4, D3, D2, D1: in integer;
    DOT8, DOT7, DOT6, DOT5, DOT4, DOT3, DOT2, DOT1: in std_logic;
    bling: in std_logic;
    bling_bit: integer;
    OD8, OD7, OD6, OD5, OD4, OD3, OD2, OD1: in integer;
    ODOT8, ODOT7, ODOT6, ODOT5, ODOT4, ODOT3, ODOT2, ODOT1: in std_logic
);
end entity bling_driver;

architecture rtl of bling_driver is
    type ints is array (1 to 8) of integer;
    type dots is array (1 to 8) of std_logic;
    signal mos_ints: ints := (D1, D2, D3, D4, D5, D6, D7, D8);
    signal mos_dots: dots := (D1, D2, D3, D4, D5, D6, D7, D8);
begin
end architecture rtl;
