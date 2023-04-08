library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity count_pill_controller is
    port (
             CLK: in std_logic;                          -- 100MHz
             START: in std_logic;                        -- 1有效
             PILL_MAX: in integer;                       -- 每瓶最大药片数
             BOTTLE_MAX: in integer;                     -- 最大瓶数
             COUNT_INTS: out integer_vector(7 downto 0); -- 输出显示缓冲
             BUZZ: out std_logic                         -- 输出蜂鸣器使能
         );
end entity count_pill_controller;

architecture behav of count_pill_controller is
    signal counting_start: std_logic := '1';
    signal pill_clk: std_logic;
    signal t_finish: std_logic;
    signal t_sum: integer;
    signal t_pill_count: integer;
    signal t_bottle_count: integer;
    signal t_count_ints: integer_vector(7 downto 0) := (others => 10);
    component pill_counter
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
    end component;
    component buzz_controller
        port (
                 CLK: in std_logic; -- 100MHz
                 START: in std_logic;
                 BUZZ_OUT: out std_logic
             );
    end component;
    component divider
        port(
                CLK: in std_logic;
                RST: in std_logic;
                N: in integer;
                O: out std_logic
            );
    end component;
begin
    pill_count_clk: divider
    port map(
                CLK => CLK,
                RST => '0',
                N => 50000000,
                O => pill_clk
            );

    the_buzz_controller: buzz_controller
    port map(
                CLK => CLK,
                START => not counting_start,
                BUZZ_OUT => BUZZ
            );

    the_pill_counter: pill_counter
    port map(
                CLK => pill_clk,
                START => counting_start and START,
                PILL_MAX => PILL_MAX,
                BOTTLE_MAX => BOTTLE_MAX,
                SUM => t_sum,
                PILL_COUNT => t_pill_count,
                BOTTLE_COUNT => t_bottle_count,
                FINISH => t_finish
            );

    process(t_sum, t_bottle_count, t_pill_count, t_finish, START)
    begin
        case START is
            when '1' =>
                case t_finish is
                    when '1' =>
                        t_count_ints <= (others => 0);
                        counting_start <= '0';
                    when '0' =>
                        t_count_ints <= (
                                        10,
                                        t_sum / 100,
                                        (t_sum mod 100) / 10,
                                        t_sum mod 10,
                                        t_bottle_count / 10,
                                        t_bottle_count mod 10,
                                        t_pill_count / 10,
                                        t_pill_count mod 10
                                    );
                end case;
            when '0' =>
                t_count_ints <= (others => 0);
                counting_start <= '1';
        end case;
    end process;

    COUNT_INTS <= t_count_ints;
end architecture behav;
