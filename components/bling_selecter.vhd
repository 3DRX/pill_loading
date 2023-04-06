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
    signal selected_bit: integer := 0;
    component btn_driver
        port (
                 S1: in std_logic;
                 S2: in std_logic;
                 S3: in std_logic;
                 S4: in std_logic;
                 S5: in std_logic;
                 O: out std_logic_vector(4 downto 0)
             );
    end component;
begin
    U1: btn_driver
    port map(
                S1 => S1,
                S2 => S2,
                S3 => '0',
                S4 => '0',
                S5 => '0',
                O => pressed_btn
            );

    process(pressed_btn)
    begin
        if rising_edge(pressed_btn(1)) then
            if selected_bit = 7 then
                selected_bit <= 0;
            else
                selected_bit <= selected_bit + 1;
            end if;
        elsif rising_edge(pressed_btn(0)) then
            if selected_bit = 0 then
                selected_bit <= 7;
            else
                selected_bit <= selected_bit - 1;
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
