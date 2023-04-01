library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity counter_tb is
    end entity counter_tb;

architecture test of counter_tb is
    signal clk: std_logic := '0';
    signal rst: std_logic := '0';
    signal n: integer := 0;
    signal o: integer := 0;
    component counter
        port(
                CLK: in std_logic;
                RST: in std_logic;
                N: in integer;
                O: out integer
            );
    end component;
begin
    U1: counter port map(
                            CLK => clk,
                            RST => rst,
                            N => n,
                            O => o
                        );
    stimulus:
    process begin
        n <= 20;
        wait for 10 ns;
        clk <= '0'; wait for 1 ns; clk <= '1'; wait for 1 ns; clk <= '0'; wait for 10 ns;
        clk <= '0'; wait for 1 ns; clk <= '1'; wait for 1 ns; clk <= '0'; wait for 10 ns;
        clk <= '0'; wait for 1 ns; clk <= '1'; wait for 1 ns; clk <= '0'; wait for 10 ns;
        clk <= '0'; wait for 1 ns; clk <= '1'; wait for 1 ns; clk <= '0'; wait for 10 ns;
        rst <= '1';
        clk <= '0'; wait for 1 ns; clk <= '1'; wait for 1 ns; clk <= '0'; wait for 10 ns;
        clk <= '0'; wait for 1 ns; clk <= '1'; wait for 1 ns; clk <= '0'; wait for 10 ns;
        clk <= '0'; wait for 1 ns; clk <= '1'; wait for 1 ns; clk <= '0'; wait for 10 ns;
        clk <= '0'; wait for 1 ns; clk <= '1'; wait for 1 ns; clk <= '0'; wait for 10 ns;
        rst <= '0';
        clk <= '0'; wait for 1 ns; clk <= '1'; wait for 1 ns; clk <= '0'; wait for 10 ns;
        clk <= '0'; wait for 1 ns; clk <= '1'; wait for 1 ns; clk <= '0'; wait for 10 ns;
        clk <= '0'; wait for 1 ns; clk <= '1'; wait for 1 ns; clk <= '0'; wait for 10 ns;
        clk <= '0'; wait for 1 ns; clk <= '1'; wait for 1 ns; clk <= '0'; wait for 10 ns;
        clk <= '0'; wait for 1 ns; clk <= '1'; wait for 1 ns; clk <= '0'; wait for 10 ns;
        clk <= '0'; wait for 1 ns; clk <= '1'; wait for 1 ns; clk <= '0'; wait for 10 ns;
        clk <= '0'; wait for 1 ns; clk <= '1'; wait for 1 ns; clk <= '0'; wait for 10 ns;
        clk <= '0'; wait for 1 ns; clk <= '1'; wait for 1 ns; clk <= '0'; wait for 10 ns;
        clk <= '0'; wait for 1 ns; clk <= '1'; wait for 1 ns; clk <= '0'; wait for 10 ns;
        clk <= '0'; wait for 1 ns; clk <= '1'; wait for 1 ns; clk <= '0'; wait for 10 ns;
        clk <= '0'; wait for 1 ns; clk <= '1'; wait for 1 ns; clk <= '0'; wait for 10 ns;
        clk <= '0'; wait for 1 ns; clk <= '1'; wait for 1 ns; clk <= '0'; wait for 10 ns;
        clk <= '0'; wait for 1 ns; clk <= '1'; wait for 1 ns; clk <= '0'; wait for 10 ns;
        clk <= '0'; wait for 1 ns; clk <= '1'; wait for 1 ns; clk <= '0'; wait for 10 ns;
        clk <= '0'; wait for 1 ns; clk <= '1'; wait for 1 ns; clk <= '0'; wait for 10 ns;
        clk <= '0'; wait for 1 ns; clk <= '1'; wait for 1 ns; clk <= '0'; wait for 10 ns;
        clk <= '0'; wait for 1 ns; clk <= '1'; wait for 1 ns; clk <= '0'; wait for 10 ns;
        clk <= '0'; wait for 1 ns; clk <= '1'; wait for 1 ns; clk <= '0'; wait for 10 ns;
        clk <= '0'; wait for 1 ns; clk <= '1'; wait for 1 ns; clk <= '0'; wait for 10 ns;
        clk <= '0'; wait for 1 ns; clk <= '1'; wait for 1 ns; clk <= '0'; wait for 10 ns;
        clk <= '0'; wait for 1 ns; clk <= '1'; wait for 1 ns; clk <= '0'; wait for 10 ns;
        clk <= '0'; wait for 1 ns; clk <= '1'; wait for 1 ns; clk <= '0'; wait for 10 ns;
        clk <= '0'; wait for 1 ns; clk <= '1'; wait for 1 ns; clk <= '0'; wait for 10 ns;
        clk <= '0'; wait for 1 ns; clk <= '1'; wait for 1 ns; clk <= '0'; wait for 10 ns;
        clk <= '0'; wait for 1 ns; clk <= '1'; wait for 1 ns; clk <= '0'; wait for 10 ns;
        clk <= '0'; wait for 1 ns; clk <= '1'; wait for 1 ns; clk <= '0'; wait for 10 ns;
        clk <= '0'; wait for 1 ns; clk <= '1'; wait for 1 ns; clk <= '0'; wait for 10 ns;
        clk <= '0'; wait for 1 ns; clk <= '1'; wait for 1 ns; clk <= '0'; wait for 10 ns;
        clk <= '0'; wait for 1 ns; clk <= '1'; wait for 1 ns; clk <= '0'; wait for 10 ns;
        clk <= '0'; wait for 1 ns; clk <= '1'; wait for 1 ns; clk <= '0'; wait for 10 ns;
        clk <= '0'; wait for 1 ns; clk <= '1'; wait for 1 ns; clk <= '0'; wait for 10 ns;
        clk <= '0'; wait for 1 ns; clk <= '1'; wait for 1 ns; clk <= '0'; wait for 10 ns;
        clk <= '0'; wait for 1 ns; clk <= '1'; wait for 1 ns; clk <= '0'; wait for 10 ns;
        clk <= '0'; wait for 1 ns; clk <= '1'; wait for 1 ns; clk <= '0'; wait for 10 ns;
        clk <= '0'; wait for 1 ns; clk <= '1'; wait for 1 ns; clk <= '0'; wait for 10 ns;
        clk <= '0'; wait for 1 ns; clk <= '1'; wait for 1 ns; clk <= '0'; wait for 10 ns;
        clk <= '0'; wait for 1 ns; clk <= '1'; wait for 1 ns; clk <= '0'; wait for 10 ns;
        clk <= '0'; wait for 1 ns; clk <= '1'; wait for 1 ns; clk <= '0'; wait for 10 ns;
        clk <= '0'; wait for 1 ns; clk <= '1'; wait for 1 ns; clk <= '0'; wait for 10 ns;
        clk <= '0'; wait for 1 ns; clk <= '1'; wait for 1 ns; clk <= '0'; wait for 10 ns;
        clk <= '0'; wait for 1 ns; clk <= '1'; wait for 1 ns; clk <= '0'; wait for 10 ns;
        clk <= '0'; wait for 1 ns; clk <= '1'; wait for 1 ns; clk <= '0'; wait for 10 ns;
        clk <= '0'; wait for 1 ns; clk <= '1'; wait for 1 ns; clk <= '0'; wait for 10 ns;
        clk <= '0'; wait for 1 ns; clk <= '1'; wait for 1 ns; clk <= '0'; wait for 10 ns;
        clk <= '0'; wait for 1 ns; clk <= '1'; wait for 1 ns; clk <= '0'; wait for 10 ns;
        clk <= '0'; wait for 1 ns; clk <= '1'; wait for 1 ns; clk <= '0'; wait for 10 ns;
        clk <= '0'; wait for 1 ns; clk <= '1'; wait for 1 ns; clk <= '0'; wait for 10 ns;
        clk <= '0'; wait for 1 ns; clk <= '1'; wait for 1 ns; clk <= '0'; wait for 10 ns;
        clk <= '0'; wait for 1 ns; clk <= '1'; wait for 1 ns; clk <= '0'; wait for 10 ns;
        clk <= '0'; wait for 1 ns; clk <= '1'; wait for 1 ns; clk <= '0'; wait for 10 ns;
        clk <= '0'; wait for 1 ns; clk <= '1'; wait for 1 ns; clk <= '0'; wait for 10 ns;
        clk <= '0'; wait for 1 ns; clk <= '1'; wait for 1 ns; clk <= '0'; wait for 10 ns;
        clk <= '0'; wait for 1 ns; clk <= '1'; wait for 1 ns; clk <= '0'; wait for 10 ns;
        clk <= '0'; wait for 1 ns; clk <= '1'; wait for 1 ns; clk <= '0'; wait for 10 ns;
        clk <= '0'; wait for 1 ns; clk <= '1'; wait for 1 ns; clk <= '0'; wait for 10 ns;
        clk <= '0'; wait for 1 ns; clk <= '1'; wait for 1 ns; clk <= '0'; wait for 10 ns;
        clk <= '0'; wait for 1 ns; clk <= '1'; wait for 1 ns; clk <= '0'; wait for 10 ns;
        clk <= '0'; wait for 1 ns; clk <= '1'; wait for 1 ns; clk <= '0'; wait for 10 ns;
        clk <= '0'; wait for 1 ns; clk <= '1'; wait for 1 ns; clk <= '0'; wait for 10 ns;
        clk <= '0'; wait for 1 ns; clk <= '1'; wait for 1 ns; clk <= '0'; wait for 10 ns;
        clk <= '0'; wait for 1 ns; clk <= '1'; wait for 1 ns; clk <= '0'; wait for 10 ns;
        clk <= '0'; wait for 1 ns; clk <= '1'; wait for 1 ns; clk <= '0'; wait for 10 ns;
        clk <= '0'; wait for 1 ns; clk <= '1'; wait for 1 ns; clk <= '0'; wait for 10 ns;
        clk <= '0'; wait for 1 ns; clk <= '1'; wait for 1 ns; clk <= '0'; wait for 10 ns;
        clk <= '0'; wait for 1 ns; clk <= '1'; wait for 1 ns; clk <= '0'; wait for 10 ns;
        clk <= '0'; wait for 1 ns; clk <= '1'; wait for 1 ns; clk <= '0'; wait for 10 ns;
        clk <= '0'; wait for 1 ns; clk <= '1'; wait for 1 ns; clk <= '0'; wait for 10 ns;
        clk <= '0'; wait for 1 ns; clk <= '1'; wait for 1 ns; clk <= '0'; wait for 10 ns;
        clk <= '0'; wait for 1 ns; clk <= '1'; wait for 1 ns; clk <= '0'; wait for 10 ns;
        clk <= '0'; wait for 1 ns; clk <= '1'; wait for 1 ns; clk <= '0'; wait for 10 ns;
        clk <= '0'; wait for 1 ns; clk <= '1'; wait for 1 ns; clk <= '0'; wait for 10 ns;
        clk <= '0'; wait for 1 ns; clk <= '1'; wait for 1 ns; clk <= '0'; wait for 10 ns;
        clk <= '0'; wait for 1 ns; clk <= '1'; wait for 1 ns; clk <= '0'; wait for 10 ns;
        clk <= '0'; wait for 1 ns; clk <= '1'; wait for 1 ns; clk <= '0'; wait for 10 ns;
        clk <= '0'; wait for 1 ns; clk <= '1'; wait for 1 ns; clk <= '0'; wait for 10 ns;
        clk <= '0'; wait for 1 ns; clk <= '1'; wait for 1 ns; clk <= '0'; wait for 10 ns;
        clk <= '0'; wait for 1 ns; clk <= '1'; wait for 1 ns; clk <= '0'; wait for 10 ns;
        clk <= '0'; wait for 1 ns; clk <= '1'; wait for 1 ns; clk <= '0'; wait for 10 ns;
        clk <= '0'; wait for 1 ns; clk <= '1'; wait for 1 ns; clk <= '0'; wait for 10 ns;
        clk <= '0'; wait for 1 ns; clk <= '1'; wait for 1 ns; clk <= '0'; wait for 10 ns;
        clk <= '0'; wait for 1 ns; clk <= '1'; wait for 1 ns; clk <= '0'; wait for 10 ns;
        clk <= '0'; wait for 1 ns; clk <= '1'; wait for 1 ns; clk <= '0'; wait for 10 ns;
        clk <= '0'; wait for 1 ns; clk <= '1'; wait for 1 ns; clk <= '0'; wait for 10 ns;
        clk <= '0'; wait for 1 ns; clk <= '1'; wait for 1 ns; clk <= '0'; wait for 10 ns;
        clk <= '0'; wait for 1 ns; clk <= '1'; wait for 1 ns; clk <= '0'; wait for 10 ns;
        clk <= '0'; wait for 1 ns; clk <= '1'; wait for 1 ns; clk <= '0'; wait for 10 ns;
        clk <= '0'; wait for 1 ns; clk <= '1'; wait for 1 ns; clk <= '0'; wait for 10 ns;
        wait;
    end process stimulus;

end architecture test;
