library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity buzz_controller is
    port (
             CLK: in std_logic; -- 100MHz
             START: in std_logic;
             BUZZ_OUT: out std_logic
         );
end entity buzz_controller;

architecture behav of buzz_controller is
    signal buzz_t: std_logic;
    signal buzz: std_logic;
    component divider
        port(
                CLK: in std_logic;
                RST: in std_logic;
                N: in integer;
                O: out std_logic
            );
    end component;
begin
    buzz_clk: divider
    port map(
                CLK => CLK,
                RST => '0',
                N => 1000000,
                O => buzz_t
            );

    process(START, buzz_t)
    begin
        case START is
            when '1' =>
                buzz <= buzz_t;
            when others =>
                buzz <= '0';
        end case;
    end process;

    BUZZ_OUT <= buzz;
end architecture behav;
