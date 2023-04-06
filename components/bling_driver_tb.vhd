library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity bling_driver_tb is
    end entity bling_driver_tb;

architecture test of bling_driver_tb is
    signal clk: std_logic := '0';
    signal bling_bit: std_logic_vector(7 downto 0) := "00000001";
    signal d8: integer := 0;
    signal d7: integer := 0;
    signal d6: integer := 0;
    signal d5: integer := 0;
    signal d4: integer := 0;
    signal d3: integer := 0;
    signal d2: integer := 0;
    signal d1: integer := 0;
    signal dot8: std_logic := '0';
    signal dot7: std_logic := '0';
    signal dot6: std_logic := '0';
    signal dot5: std_logic := '0';
    signal dot4: std_logic := '0';
    signal dot3: std_logic := '0';
    signal dot2: std_logic := '0';
    signal dot1: std_logic := '0';
    signal od8: integer := 0;
    signal od7: integer := 0;
    signal od6: integer := 0;
    signal od5: integer := 0;
    signal od4: integer := 0;
    signal od3: integer := 0;
    signal od2: integer := 0;
    signal od1: integer := 0;
    signal odot8: std_logic := '0';
    signal odot7: std_logic := '0';
    signal odot6: std_logic := '0';
    signal odot5: std_logic := '0';
    signal odot4: std_logic := '0';
    signal odot3: std_logic := '0';
    signal odot2: std_logic := '0';
    signal odot1: std_logic := '0';
    component bling_driver
        port (
                 bling_clk: in std_logic;
                 -- 闪烁的位，1有效
                 bling_bit: in std_logic_vector(7 downto 0);
        D8, D7, D6, D5, D4, D3, D2, D1: in integer;
        DOT8, DOT7, DOT6, DOT5, DOT4, DOT3, DOT2, DOT1: in std_logic;
        OD8, OD7, OD6, OD5, OD4, OD3, OD2, OD1: out integer;
        ODOT8, ODOT7, ODOT6, ODOT5, ODOT4, ODOT3, ODOT2, ODOT1: out std_logic
    );
    end component;
begin
    U1: bling_driver
    port map(
                bling_clk => clk,
                bling_bit => bling_bit,
                D8 => d8,
                D7 => d7,
                D6 => d6,
                D5 => d5,
                D4 => d4,
                D3 => d3,
                D2 => d2,
                D1 => d1,
                DOT8 => dot8,
                DOT7 => dot7,
                DOT6 => dot6,
                DOT5 => dot5,
                DOT4 => dot4,
                DOT3 => dot3,
                DOT2 => dot2,
                DOT1 => dot1,
                OD8 => od8,
                OD7 => od7,
                OD6 => od6,
                OD5 => od5,
                OD4 => od4,
                OD3 => od3,
                OD2 => od2,
                OD1 => od1,
                ODOT8 => odot8,
                ODOT7 => odot7,
                ODOT6 => odot6,
                ODOT5 => odot5,
                ODOT4 => odot4,
                ODOT3 => odot3,
                ODOT2 => odot2,
                ODOT1 => odot1
            );
    stimulus:
    process begin
        bling_bit <= "11111111";
        for i in 0 to 100 loop
            wait for 10 ns; clk <= '0'; wait for 1 ns; clk <= '1'; wait for 1 ns; clk <= '0';
        end loop;
    end process;
end architecture test;
