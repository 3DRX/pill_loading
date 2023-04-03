library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity mos_driver_tb is
    end entity mos_driver_tb;

architecture test of mos_driver_tb is
    type ints is array (1 to 8) of integer;
    type dots is array (1 to 8) of std_logic;
    signal the_ints: ints := (1, 2, 3, 4, 5, 6, 7, 8);
    signal the_dots: dots := ('1', '1', '1', '1', '1', '1', '1', '1');
    signal clk: std_logic := '0';
    signal OUTNUM: std_logic_vector(7 downto 0) := "00000000";
    signal SELNUM: std_logic_vector(7 downto 0) := "00000000";
    component mos_driver
        port(
        D8, D7, D6, D5, D4, D3, D2, D1: in integer;
        CLK: in std_logic;
        DOT8, DOT7, DOT6, DOT5, DOT4, DOT3, DOT2, DOT1: in std_logic;
        OUTNUM: out std_logic_vector(7 downto 0);
        SELNUM: out std_logic_vector(7 downto 0)
    );
    end component;
begin
    U1: mos_driver
    port map(
                D8 => the_ints(8),
                D7 => the_ints(7),
                D6 => the_ints(6),
                D5 => the_ints(5),
                D4 => the_ints(4),
                D3 => the_ints(3),
                D2 => the_ints(2),
                D1 => the_ints(1),

                DOT8 => the_dots(8),
                DOT7 => the_dots(7),
                DOT6 => the_dots(6),
                DOT5 => the_dots(5),
                DOT4 => the_dots(4),
                DOT3 => the_dots(3),
                DOT2 => the_dots(2),
                DOT1 => the_dots(1),
                CLK => clk,
                OUTNUM => OUTNUM,
                SELNUM => SELNUM
            );

    stimulus:
    process begin
        the_ints <= (1, 2, 3, 4, 5, 6, 7, 8);
        the_dots <= ('1', '1', '1', '1', '1', '1', '1', '1');
        for i in 1 to 100 loop
            clk <= '0'; wait for 1 ns; clk <= '1'; wait for 1 ns; clk <= '0';
            wait for 10 ns; 
        end loop;
    end process stimulus;
end architecture test;
