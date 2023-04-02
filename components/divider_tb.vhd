library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity divider_tb is
    end entity divider_tb;

architecture test of divider_tb is
    signal clk: std_logic := '0';
    signal rst: std_logic := '0';
    signal n: integer := 0;
    signal o: std_logic := '0';
    component divider
        port(
                CLK: in std_logic;
                RST: in std_logic;
                N: in integer;
                O: out std_logic
            );
    end component;
begin
    U1: divider port map(
                            CLK => clk,
                            RST => rst,
                            N => 4,
                            O => o
                        );
    stimulus:
    process begin
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
