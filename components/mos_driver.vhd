library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- 0 < IPT < 9
-- IPT = 10 清零
-- RST 清零
-- DOT 小数点，'1' 不亮，'0' 亮
entity mos_driver is
    port(
    D8, D7, D6, D5, D4, D3, D2, D1: in integer;
    CLK: in std_logic;
    RST: in std_logic;
    DOT8, DOT7, DOT6, DOT5, DOT4, DOT3, DOT2, DOT1: in std_logic;
    OUTNUM: out std_logic_vector(7 downto 0);
    SELNUM: out std_logic_vector(7 downto 0)
);
end mos_driver;

architecture Behavioral of mos_driver is
    type ints is array (1 to 8) of integer;
    type dots is array (1 to 8) of std_logic;
    signal the_ints: ints;
    signal the_dots: dots;
    signal out_temp: std_logic_vector(7 downto 0) := "11111111";
    signal sel_temp: std_logic_vector(7 downto 0) := "11111111";
    signal refreshing_bit: integer := 1;
begin
    process(CLK, RST)
    begin
        the_ints(1) <= D1;
        the_ints(2) <= D2;
        the_ints(3) <= D3;
        the_ints(4) <= D4;
        the_ints(5) <= D5;
        the_ints(6) <= D6;
        the_ints(7) <= D7;
        the_ints(8) <= D8;

        the_dots(1) <= DOT1;
        the_dots(2) <= DOT2;
        the_dots(3) <= DOT3;
        the_dots(4) <= DOT4;
        the_dots(5) <= DOT5;
        the_dots(6) <= DOT6;
        the_dots(7) <= DOT7;
        the_dots(8) <= DOT8;

        if RST = '1' then
            out_temp <= "11111111";
        elsif CLK'event and CLK = '1' then
            if the_ints(refreshing_bit) = 0 then
                out_temp <= "0000001" & the_dots(refreshing_bit);
            elsif the_ints(refreshing_bit) = 1 then
                out_temp <= "1001111" & the_dots(refreshing_bit);
            elsif the_ints(refreshing_bit) = 2 then
                out_temp <= "0010010" & the_dots(refreshing_bit);
            elsif the_ints(refreshing_bit) = 3 then
                out_temp <= "0000110" & the_dots(refreshing_bit);
            elsif the_ints(refreshing_bit) = 4 then
                out_temp <= "1001100" & the_dots(refreshing_bit);
            elsif the_ints(refreshing_bit) = 5 then
                out_temp <= "0100100" & the_dots(refreshing_bit);
            elsif the_ints(refreshing_bit) = 6 then
                out_temp <= "0100000" & the_dots(refreshing_bit);
            elsif the_ints(refreshing_bit) = 7 then
                out_temp <= "0001111" & the_dots(refreshing_bit);
            elsif the_ints(refreshing_bit) = 8 then
                out_temp <= "0000000" & the_dots(refreshing_bit);
            elsif the_ints(refreshing_bit) = 9 then
                out_temp <= "0000100" & the_dots(refreshing_bit);
            elsif the_ints(refreshing_bit) = 10 then
                out_temp <= "11111111";
            end if;
        end if;

        if refreshing_bit = 1 then
            sel_temp <= "11111110";
        elsif refreshing_bit = 2 then
            sel_temp <= "11111101";
        elsif refreshing_bit = 3 then
            sel_temp <= "11111011";
        elsif refreshing_bit = 4 then
            sel_temp <= "11110111";
        elsif refreshing_bit = 5 then
            sel_temp <= "11101111";
        elsif refreshing_bit = 6 then
            sel_temp <= "11011111";
        elsif refreshing_bit = 7 then
            sel_temp <= "10111111";
        elsif refreshing_bit = 8 then
            sel_temp <= "01111111";
        end if;

        if refreshing_bit = 8 then
            refreshing_bit <= 1;
        else
            refreshing_bit <= refreshing_bit + 1;
        end if;

    end process;
    OUTNUM <= out_temp;
    SELNUM <= sel_temp;
end Behavioral;
