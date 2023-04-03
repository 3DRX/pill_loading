-- S1 - S6: 按钮编号，排列如下
--           3
-- 6       2 4 1
--           5
-- O: 输出编号integer，在无输入时输出0

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
             BTN_CLK: in std_logic;
             O: out std_logic_vector(5 downto 0)
         );
end entity btn_driver;

architecture rtl of btn_driver is
    signal out_temp: std_logic_vector(5 downto 0) := "000000";
begin
    process(BTN_CLK)
    begin
        out_temp <= "000000";
        if BTN_CLK'event and BTN_CLK = '1' then
            if S1 = '1' then
                out_temp(0) <= '1';
            end if;
            if S2 = '1' then
                out_temp(1) <= '1';
            end if;
            if S3 = '1' then
                out_temp(2) <= '1';
            end if;
            if S4 = '1' then
                out_temp(3) <= '1';
            end if;
            if S5 = '1' then
                out_temp(4) <= '1';
            end if;
            if S6 = '1' then
                out_temp(5) <= '1';
            end if;
        end if;
    end process;
    O <= out_temp;
end architecture rtl;
