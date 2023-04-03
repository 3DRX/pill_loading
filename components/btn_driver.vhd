-- S1 - S6: 按钮编号，排列如下
--           3
-- 6       2 4 1
--           5
-- O: 输出编号integer

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity btn_driver is
    port (
             S1: in std_logic;
             S2: in std_logic;
             S3: in std_logic;
             S4: in std_logic;
             S5: in std_logic;
             S6: in std_logic;
             O: out integer
         );
end entity btn_driver;

architecture rtl of btn_driver is
    signal out_temp: integer := 0;
begin
    process(S1, S2, S3, S4, S5, S6)
    begin
        if S1 = '1' then
            out_temp <= 1;
        elsif S2 = '1' then
            out_temp <= 2;
        elsif S3 = '1' then
            out_temp <= 3;
        elsif S4 = '1' then
            out_temp <= 4;
        elsif S5 = '1' then
            out_temp <= 5;
        elsif S6 = '1' then
            out_temp <= 6;
        else
            out_temp <= 0;
        end if;
    end process;
    O <= out_temp;
end architecture rtl;
