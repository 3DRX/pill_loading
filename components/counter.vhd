-- 通用计数器
-- N: 输入最大值
-- O: 输出计数值 [0, N-1] 闭区间
-- CLK: 时钟
-- RST: 清零

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity counter is
    port(
            CLK: in std_logic;
            RST: in std_logic;
            N: in integer;
            O: out integer;
            C: out std_logic
        );
end entity counter;

architecture behav of counter is
    signal temp: integer := 0;
    signal Ctemp: std_logic := '0';
begin
    process(CLK, RST)
    begin
        if RST = '1' then
            temp <= 0;
            Ctemp <= '0';
        elsif CLK'event and CLK = '1' then
            if temp = N - 1 then
                Ctemp <= '1';
                temp <= 0;
            else
                Ctemp <= '0';
                temp <= temp + 1;
            end if;
        end if;
    end process;
    C <= Ctemp;
    O <= temp;
end architecture behav;
