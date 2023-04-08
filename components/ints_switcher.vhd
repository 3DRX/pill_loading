library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity ints_switcher is
    port (
             START: in std_logic;                       -- 标志着在哪个模式
             COUNT_INTS: in integer_vector(7 downto 0); -- 计数模式输出缓冲
             SET_INTS: in integer_vector(7 downto 0);   -- 置数模式输出缓冲
             MOS_INTS: out integer_vector(7 downto 0)   -- 选择当前模式的输出
         );
end entity ints_switcher;

architecture behav of ints_switcher is
    signal out_ints: integer_vector(7 downto 0) := (others => 0);
begin
    with START select
        MOS_INTS <= COUNT_INTS when '1',
                    SET_INTS when '0',
                    (11, 11, 11, 11, 11, 11, 11, 11) when others;
end architecture behav;
