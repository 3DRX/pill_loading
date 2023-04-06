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
begin
    O <= S5 & S4 & S3 & S2 & S1;
end architecture rtl;
