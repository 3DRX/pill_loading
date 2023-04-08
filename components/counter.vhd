library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity counter is
    port(
            CLK: in std_logic; -- CLK: 时钟
            RST: in std_logic; -- RST: 清零
            N: in integer;     -- N: 输入最大值
            O: out integer;    -- O: 输出计数值 [0, N-1] 闭区间
            C: out std_logic   -- C: 进位输出
        );
end entity counter;

architecture behav of counter is
    signal temp: integer := 0;
    signal Ctemp: std_logic := '0';
begin
    process(CLK, RST)
    begin
        case RST is
            when '1' =>
                temp <= 0;
                Ctemp <= '0';
            when others =>
                if CLK'event and CLK = '1' then
                    if temp = N - 1 then
                        Ctemp <= '1';
                        temp <= 0;
                    else
                        Ctemp <= '0';
                        temp <= temp + 1;
                    end if;
                end if;
        end case;
    end process;
    C <= Ctemp;
    O <= temp;
end architecture behav;
