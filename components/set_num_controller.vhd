library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity set_num_controller is
    port (
             CLK: in std_logic; -- 100MHz
             START: in std_logic;
             S1: in std_logic;
             S2: in std_logic;
             S4: in std_logic;
             kcol:in std_logic_vector(3 downto 0);
             krow:out std_logic_vector(3 downto 0);
             BLING_BIT: out std_logic_vector(7 downto 0);
             SET_INTS: out integer_vector(7 downto 0)
         );
end entity set_num_controller;

architecture behav of set_num_controller is
    signal t_set_ints: integer_vector(7 downto 0) := (others => 0);
    signal t_bling_bit: std_logic_vector(7 downto 0);
    signal matrix_num: integer;
    component matrix_input
        port(
                CLK:in std_logic;
                CLR:in std_logic;
                kcol:in std_logic_vector(3 downto 0);
                krow:out std_logic_vector(3 downto 0);
                seg_num:out integer
            );
    end component;
    component bling_selecter
        port (
                 S1: in std_logic;          -- 右按钮
                 S2: in std_logic;          -- 左按钮
                 START: in std_logic;       -- 开始信号，1有效
                 BLING_BIT: out std_logic_vector(7 downto 0)
             );
    end component;
begin
    the_matrix_input: matrix_input
    port map(
                CLK => CLK,
                CLR => '0',
                kcol => kcol,
                krow => krow,
                seg_num => matrix_num
            );

    the_bling_selecter: bling_selecter
    port map(
                S1 => S1,
                S2 => S2,
                START => START,
                BLING_BIT => t_bling_bit
            );

    process(matrix_num, START, bling_bit)
    begin
        if START = '0' then
            case bling_bit is
                when "00001000" =>
                    t_set_ints(3) <= matrix_num;
                when "00000100" =>
                    t_set_ints(2) <= matrix_num;
                when "00000010" =>
                    t_set_ints(1) <= matrix_num;
                when "00000001" =>
                    t_set_ints(0) <= matrix_num;
                when others =>
            end case;
        end if;
    end process;

    SET_INTS <= t_set_ints;
    BLING_BIT <= t_bling_bit;
end architecture behav;
