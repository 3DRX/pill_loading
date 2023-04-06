library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity bling_selecter_tb is
    end entity bling_selecter_tb;

architecture test of bling_selecter_tb is
    signal clk: std_logic := '0';
    signal s1: std_logic;
    signal s2: std_logic;
    signal start: std_logic;
    signal bling_bit: std_logic_vector(7 downto 0);
    component bling_selecter
        port (
                 S1: in std_logic;
                 S2: in std_logic;
                 START: in std_logic;       -- 开始信号，1有效
                 BLING_BIT: out std_logic_vector(7 downto 0)
             );
    end component;
begin
    U1: bling_selecter
    port map(
                S1 => s1,
                S2 => s2,
                START => start,
                BLING_BIT => bling_bit
            );
    stimulus:
    process begin
        s1 <= '1';
        s2 <= '0';
        start <= '0';
        wait for 10 ns; clk <= '0'; wait for 1 ns; clk <= '1'; wait for 1 ns; clk <= '0';
        wait for 10 ns; clk <= '0'; wait for 1 ns; clk <= '1'; wait for 1 ns; clk <= '0';
        wait for 10 ns; clk <= '0'; wait for 1 ns; clk <= '1'; wait for 1 ns; clk <= '0';
        s1 <= '0';
        wait for 10 ns; clk <= '0'; wait for 1 ns; clk <= '1'; wait for 1 ns; clk <= '0';
        wait for 10 ns; clk <= '0'; wait for 1 ns; clk <= '1'; wait for 1 ns; clk <= '0';
        s1 <= '1';
        wait for 10 ns; clk <= '0'; wait for 1 ns; clk <= '1'; wait for 1 ns; clk <= '0';
        wait for 10 ns; clk <= '0'; wait for 1 ns; clk <= '1'; wait for 1 ns; clk <= '0';
        s1 <= '0';
        wait for 10 ns; clk <= '0'; wait for 1 ns; clk <= '1'; wait for 1 ns; clk <= '0';
        wait for 10 ns; clk <= '0'; wait for 1 ns; clk <= '1'; wait for 1 ns; clk <= '0';
        wait for 10 ns; clk <= '0'; wait for 1 ns; clk <= '1'; wait for 1 ns; clk <= '0';
        s1 <= '1';
        wait for 10 ns; clk <= '0'; wait for 1 ns; clk <= '1'; wait for 1 ns; clk <= '0';
        wait for 10 ns; clk <= '0'; wait for 1 ns; clk <= '1'; wait for 1 ns; clk <= '0';
        wait for 10 ns; clk <= '0'; wait for 1 ns; clk <= '1'; wait for 1 ns; clk <= '0';
        wait for 10 ns; clk <= '0'; wait for 1 ns; clk <= '1'; wait for 1 ns; clk <= '0';
        wait for 10 ns; clk <= '0'; wait for 1 ns; clk <= '1'; wait for 1 ns; clk <= '0';
        s1 <= '0';
        wait for 10 ns; clk <= '0'; wait for 1 ns; clk <= '1'; wait for 1 ns; clk <= '0';
        wait for 10 ns; clk <= '0'; wait for 1 ns; clk <= '1'; wait for 1 ns; clk <= '0';
        wait for 10 ns; clk <= '0'; wait for 1 ns; clk <= '1'; wait for 1 ns; clk <= '0';
        wait for 10 ns; clk <= '0'; wait for 1 ns; clk <= '1'; wait for 1 ns; clk <= '0';
        wait for 10 ns; clk <= '0'; wait for 1 ns; clk <= '1'; wait for 1 ns; clk <= '0';
        wait for 10 ns; clk <= '0'; wait for 1 ns; clk <= '1'; wait for 1 ns; clk <= '0';
        wait for 10 ns; clk <= '0'; wait for 1 ns; clk <= '1'; wait for 1 ns; clk <= '0';
        wait for 10 ns; clk <= '0'; wait for 1 ns; clk <= '1'; wait for 1 ns; clk <= '0';
        wait for 10 ns; clk <= '0'; wait for 1 ns; clk <= '1'; wait for 1 ns; clk <= '0';
        wait for 10 ns; clk <= '0'; wait for 1 ns; clk <= '1'; wait for 1 ns; clk <= '0';
        wait for 10 ns; clk <= '0'; wait for 1 ns; clk <= '1'; wait for 1 ns; clk <= '0';
        wait for 10 ns; clk <= '0'; wait for 1 ns; clk <= '1'; wait for 1 ns; clk <= '0';
        wait for 10 ns; clk <= '0'; wait for 1 ns; clk <= '1'; wait for 1 ns; clk <= '0';
        wait for 10 ns; clk <= '0'; wait for 1 ns; clk <= '1'; wait for 1 ns; clk <= '0';
        wait for 10 ns; clk <= '0'; wait for 1 ns; clk <= '1'; wait for 1 ns; clk <= '0';
        wait for 10 ns; clk <= '0'; wait for 1 ns; clk <= '1'; wait for 1 ns; clk <= '0';
        wait for 10 ns; clk <= '0'; wait for 1 ns; clk <= '1'; wait for 1 ns; clk <= '0';
        wait for 10 ns; clk <= '0'; wait for 1 ns; clk <= '1'; wait for 1 ns; clk <= '0';
        wait for 10 ns; clk <= '0'; wait for 1 ns; clk <= '1'; wait for 1 ns; clk <= '0';
        wait for 10 ns; clk <= '0'; wait for 1 ns; clk <= '1'; wait for 1 ns; clk <= '0';
        wait for 10 ns; clk <= '0'; wait for 1 ns; clk <= '1'; wait for 1 ns; clk <= '0';
        wait for 10 ns; clk <= '0'; wait for 1 ns; clk <= '1'; wait for 1 ns; clk <= '0';
        wait for 10 ns; clk <= '0'; wait for 1 ns; clk <= '1'; wait for 1 ns; clk <= '0';
        wait for 10 ns; clk <= '0'; wait for 1 ns; clk <= '1'; wait for 1 ns; clk <= '0';
        wait for 10 ns; clk <= '0'; wait for 1 ns; clk <= '1'; wait for 1 ns; clk <= '0';
    end process;
end architecture test;
