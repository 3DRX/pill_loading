library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- 0 < D < 9
-- D = 10 清零
-- DOT 小数点，'1' 不亮，'0' 亮
entity mos_driver is
    port(
            INTS: in integer_vector(7 downto 0);
            DOTS: in std_logic_vector(7 downto 0);
            CLK: in std_logic;
            OUTNUM: out std_logic_vector(7 downto 0);
            SELNUM: out std_logic_vector(7 downto 0)
        );
end mos_driver;

architecture Behavioral of mos_driver is
    signal the_ints: integer_vector(7 downto 0);
    signal the_dots: std_logic_vector(7 downto 0);
    signal out_temp: std_logic_vector(7 downto 0) := "11111111";
    signal sel_temp: std_logic_vector(7 downto 0) := "11111111";
    signal refreshing_bit: integer := 0;
begin
    process(CLK)
    begin
        if CLK'event and CLK = '1' then
            the_ints <= INTS;
            the_dots <= DOTS;
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
            else
                out_temp <= "11111101";
            end if;

            if refreshing_bit = 0 then
                sel_temp <= "11111110";
            elsif refreshing_bit = 1 then
                sel_temp <= "11111101";
            elsif refreshing_bit = 2 then
                sel_temp <= "11111011";
            elsif refreshing_bit = 3 then
                sel_temp <= "11110111";
            elsif refreshing_bit = 4 then
                sel_temp <= "11101111";
            elsif refreshing_bit = 5 then
                sel_temp <= "11011111";
            elsif refreshing_bit = 6 then
                sel_temp <= "10111111";
            elsif refreshing_bit = 7 then
                sel_temp <= "01111111";
            end if;

            if refreshing_bit = 7 then
                refreshing_bit <= 0;
            else
                refreshing_bit <= refreshing_bit + 1;
            end if;
        end if;
    end process;
    OUTNUM <= out_temp;
    SELNUM <= sel_temp;
end Behavioral;
