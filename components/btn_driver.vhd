-- S1 - S6: 按钮编号，排列如下
--           3
-- 6       2 4 1
--           5
-- O: 输出编号integer，在无输入时输出0

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity btn_driver is
    port (
             S1: in std_logic;
             S2: in std_logic;
             S3: in std_logic;
             S4: in std_logic;
             S5: in std_logic;
             O: out std_logic_vector(4 downto 0)
         );
end entity btn_driver;

architecture rtl of btn_driver is
    signal out_temp: std_logic_vector(4 downto 0) := "00000";
    signal s1_temp: std_logic := '0';
    signal s2_temp: std_logic := '0';
begin
    process(S1)
    begin
        if falling_edge(S1) then
            out_temp(0) <= '1';
        elsif rising_edge(S1) then
            out_temp(0) <= '0';
        end if;
    end process;

    process(S2)
    begin
        if falling_edge(S2) then
            out_temp(1) <= '1';
        elsif rising_edge(S2) then
            out_temp(1) <= '0';
        end if;
    end process;
    O <= out_temp;
end architecture rtl;
