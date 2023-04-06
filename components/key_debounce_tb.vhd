library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity key_debounce_tb is
    end entity key_debounce_tb;

architecture test of key_debounce_tb is
    signal clk: std_logic := '0';
    signal key: std_logic := '0';
    signal key_out: std_logic := '0';
    component key_debounce
        port(
        clk,key: in std_logic;
        key_out: out std_logic
    );
    end component;
begin
    U1: key_debounce
    port map(
                clk => clk,
                key => key,
                key_out => key_out
            );

    stimulus:
    process begin
        key <= '1';
        for i in 0 to 100000000 loop
            clk <= '0'; wait for 1 ns; clk <= '1'; wait for 1 ns; clk <= '0';
        end loop;
    end process;
end architecture test;
