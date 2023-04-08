library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity bling_driver is
    port (
             bling_clk: in std_logic;
             -- 闪烁的位，1有效
             bling_bit: in std_logic_vector(7 downto 0);
             MOS_INTS: in integer_vector(7 downto 0);
             MOS_DOTS: in std_logic_vector(7 downto 0);
             O_MOS_INTS: out integer_vector(7 downto 0);
             O_MOS_DOTS: out std_logic_vector(7 downto 0)
         );
end entity bling_driver;

architecture behav of bling_driver is
    signal t_mos_ints: integer_vector(7 downto 0) := MOS_INTS;
    signal t_mos_dots: std_logic_vector(7 downto 0) := MOS_DOTS;
    signal show: integer := 1;
begin
    process(bling_clk)
    begin
        if bling_clk'event and bling_clk = '1' then
            if show = 1 then
                show <= 0;
            elsif show = 0 then
                show <= 1;
            else
                show <= 1;
            end if;
        end if;
    end process;

    process(show)
    begin
        t_mos_ints <= MOS_INTS;
        t_mos_dots <= MOS_DOTS;
        if show = 0 then
            for i in 0 to 7 loop
                if bling_bit(i) = '1' then
                    t_mos_ints(i) <= 10;
                    -- t_mos_dots(i) <= '1';
                end if;
            end loop;
        end if;
    end process;
    O_MOS_INTS <= t_mos_ints;
    O_MOS_DOTS <= t_mos_dots;
end architecture behav;
