-- 药片计数器

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity pill_counter is
    port (
             CLK: in std_logic;         -- 0.5Hz
             START: in std_logic;       -- 1有效
             PILL_MAX: in integer;      -- 每瓶最大药片数
             BOTTLE_MAX: in integer;    -- 最大瓶数
             SUM: out integer;          -- 总药片数
             PILL_COUNT: out integer;   -- 每瓶药片
             BOTTLE_COUNT: out integer; -- 已装瓶数
             FINISH: out std_logic      -- 装满后为1
         );
end entity pill_counter;

architecture behav of pill_counter is
    signal pill_c: std_logic := '0';
    component counter
        port(
                CLK: in std_logic;
                RST: in std_logic;
                N: in integer;
                O: out integer;
                C: out std_logic
            );
    end component;
begin
    sum_counter: counter
    port map(
                CLK => CLK,
                RST => not START,
                N => PILL_MAX * BOTTLE_MAX,
                O => SUM,
                C => FINISH
            );
    pill: counter
    port map(
                CLK => CLK,
                RST => not START,
                N => PILL_MAX,
                O => PILL_COUNT,
                C => pill_c
            );
    bottle: counter
    port map(
                CLK => pill_c,
                RST => not START,
                N => BOTTLE_MAX,
                O => BOTTLE_COUNT,
                C => open
            );
end architecture behav;
