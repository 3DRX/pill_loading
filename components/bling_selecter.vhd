library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity bling_selecter is
    port (
             S1: in std_logic;          -- 右按钮
             S2: in std_logic;          -- 左按钮
             START: in std_logic;       -- 开始信号，1有效
             BLING_BIT: out std_logic_vector(7 downto 0)
         );
end entity bling_selecter;

architecture behav of bling_selecter is
    signal pressed_btn: std_logic_vector(4 downto 0) := "00000";
    signal bling_bit_temp: std_logic_vector(7 downto 0) := "00000001";
    signal selected_bit: integer range 0 to 7 := 0;
    signal left_right: std_logic := '0';
begin
    process(S1, S2)
    begin
        left_right <= S1 xor S2;
    end process;

    process(left_right)
    begin
        if left_right'event and left_right = '1' then
            if S1 = '0' and S2 = '1' then
                selected_bit <= selected_bit + 1;
            elsif S1 = '1' and S2 = '0' then
                if selected_bit = 0 then
                    selected_bit <= 7;
                else
                    selected_bit <= selected_bit - 1;
                end if;
            end if;
        end if;
    end process;

    process(selected_bit)
    begin
        bling_bit_temp <= "00000000";
        if START = '0' then
            bling_bit_temp(selected_bit) <= '1';
        end if;
    end process;

    BLING_BIT <= bling_bit_temp;
end architecture behav;
