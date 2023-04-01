-- 通用分频器
-- CLK: 时钟
-- RST: 清零
-- N: 源周期/输出周期（N=2时，2分频）
-- O: 输出时钟


library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity divider is
    port(
            CLK: in std_logic;
            RST: in std_logic;
            N: in integer;
            O: out std_logic
        );
end entity divider;

architecture behav of divider is
    signal state: std_logic := '0';
    signal count: integer := 0;
begin
    process(CLK, RST)
    begin
        if RST = '1' then
            state <= '0';
            count <= 0;
        elsif CLK'event and CLK = '1' then
            if count = N / 2 - 1 then
                count <= 0;
                state <= not state;
            else
                count <= count + 1;
            end if;
        end if;
    end process;
    O <= state;
end architecture behav;
