library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity divider is
    port(
            CLK: in std_logic; -- CLK: 原始时钟
            RST: in std_logic; -- RST: 清零
            N: in integer;     -- N: 源周期/输出周期（N=2时，2分频）
            O: out std_logic   -- O: 输出时钟
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
