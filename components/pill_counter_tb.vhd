library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity pill_counter_tb is
    end entity pill_counter_tb;

architecture test of pill_counter_tb is
    signal clk: std_logic := '0';
    signal start: std_logic := '0';
    signal sum: integer := 0;
    signal pill_count: integer := 0;
    signal bottle_count: integer := 0;
    signal finish: std_logic := '0';
    component pill_counter
        port (
                 CLK: in std_logic; -- 0.5Hz
                 START: in std_logic; -- 1有效
                 PILL_MAX: in integer;      -- 每瓶最大药片数
                 BOTTLE_MAX: in integer;    -- 最大瓶数
                 SUM: out integer;          -- 总药片数
                 PILL_COUNT: out integer;   -- 每瓶药片
                 BOTTLE_COUNT: out integer; -- 已装瓶数
                 FINISH: out std_logic      -- 装满后为1
             );
    end component;
begin
    U1: pill_counter
    port map(
                CLK => clk,
                START => start,
                PILL_MAX => 10,
                BOTTLE_MAX => 5,
                SUM => sum,
                PILL_COUNT => pill_count,
                BOTTLE_COUNT => bottle_count,
                FINISH => finish
            );
    stimulus:
    process begin
        for i in 0 to 10 loop
            clk <= '0'; wait for 1 ns; clk <= '1'; wait for 1 ns; clk <= '0'; wait for 10 ns;
        end loop;
        start <= '1';
        for i in 0 to 100 loop
            clk <= '0'; wait for 1 ns; clk <= '1'; wait for 1 ns; clk <= '0'; wait for 10 ns;
        end loop;
    end process stimulus;
end architecture test;
