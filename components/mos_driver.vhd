library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- 只有一个管输出IPT，其他灭
entity mos_driver is
    port(
            CLK: in std_logic;
            IPT: in integer;
            OUTNUM: out std_logic_vector(7 downto 0);
            SELNUM: out std_logic_vector(7 downto 0)
        );
end mos_driver;

architecture Behavioral of mos_driver is
    signal out_temp: std_logic_vector(7 downto 0);
begin
    process(CLK)
    begin
        if CLK'event and CLK = '1' then
            if IPT = 0 then
                out_temp <= "11000000";
            elsif IPT = 1 then
                out_temp <= "11111001";
            elsif IPT = 2 then
                out_temp <= "10100100";
            elsif IPT = 3 then
                out_temp <= "10110000";
            elsif IPT = 4 then
                out_temp <= "10011001";
            elsif IPT = 5 then
                out_temp <= "10010010";
            elsif IPT = 6 then
                out_temp <= "10000010";
            elsif IPT = 7 then
                out_temp <= "11111000";
            elsif IPT = 8 then
                out_temp <= "10000000";
            elsif IPT = 9 then
                out_temp <= "10010000";
            end if;
        end if;
    end process;
    OUTNUM <= "11111110";
end Behavioral;
