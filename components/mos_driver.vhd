library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- 0 < IPT < 9
-- IPT = 10 清零
-- RST 清零
-- DOT 小数点，'1' 不亮，'0' 亮
entity mos_driver is
    port(
            IPT: in integer;
            RST: in std_logic;
            DOT: in std_logic;
            OUTNUM: out std_logic_vector(7 downto 0);
            SELNUM: out std_logic_vector(7 downto 0)
        );
end mos_driver;

architecture Behavioral of mos_driver is
    signal out_temp: std_logic_vector(7 downto 0) := "11111111";
begin
    process(IPT, RST)
    begin
        if RST = '1' then
            out_temp <= "11111111";
        else
            if IPT = 0 then
                out_temp <= "0000001" & DOT;
            elsif IPT = 1 then
                out_temp <= "1001111" & DOT;
            elsif IPT = 2 then
                out_temp <= "0010010" & DOT;
            elsif IPT = 3 then
                out_temp <= "0000110" & DOT;
            elsif IPT = 4 then
                out_temp <= "1001100" & DOT;
            elsif IPT = 5 then
                out_temp <= "0100100" & DOT;
            elsif IPT = 6 then
                out_temp <= "0100000" & DOT;
            elsif IPT = 7 then
                out_temp <= "0001111" & DOT;
            elsif IPT = 8 then
                out_temp <= "0000000" & DOT;
            elsif IPT = 9 then
                out_temp <= "0000100" & DOT;
            elsif IPT = 10 then
                out_temp <= "11111111";
            end if;
        end if;
    end process;
    OUTNUM <= out_temp;
    SELNUM <= "11111110";
end Behavioral;
