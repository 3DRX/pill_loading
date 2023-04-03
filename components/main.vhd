library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity main is
    port(
            CLK: in std_logic;
            RST: in std_logic;
            kcol:in std_logic_vector(3 downto 0);
            krow:out std_logic_vector(3 downto 0);
            S1: in std_logic;
            S2: in std_logic;
            S3: in std_logic;
            S4: in std_logic;
            S5: in std_logic;
            S6: in std_logic;
            OUTNUM: out std_logic_vector(7 downto 0);
            SELNUM: out std_logic_vector(7 downto 0)
        );
end entity main;

architecture Behavioral of main is
    signal ipt_num: integer range 0 to 9;
    -- 分频后的时钟
    signal one_second: std_logic := '0';
    signal mos_refresh_clk: std_logic := '0';
    -- 十进制计数器输出
    signal counter_output: integer := 0;
    -- 数码管显示输出
    type ints is array (1 to 8) of integer;
    type dots is array (1 to 8) of std_logic;
    signal mos_ints: ints := (1, 2, 3, 4, 5, 6, 7, 8);
    signal mos_dots: dots := ('1', '1', '1', '1', '1', '1', '1', '1');
    -- 正在闪烁的位
    signal bling_bit: integer := 1;
    -- 正在被按下的按钮
    signal btn_pressed: integer := 0;
    component matrix_input
        port(
                CLK:in std_logic;
                CLR:in std_logic;
                kcol:in std_logic_vector(3 downto 0);
                krow:out std_logic_vector(3 downto 0);
                seg_num:out integer
            );
    end component;
    component mos_driver
        port(
        D8, D7, D6, D5, D4, D3, D2, D1: in integer;
        CLK: in std_logic;
        DOT8, DOT7, DOT6, DOT5, DOT4, DOT3, DOT2, DOT1: in std_logic;
        OUTNUM: out std_logic_vector(7 downto 0);
        SELNUM: out std_logic_vector(7 downto 0)
    );
    end component;
    component divider
        port(
                CLK: in std_logic;
                RST: in std_logic;
                N: in integer;
                O: out std_logic
            );
    end component;
    component counter
        port(
                CLK: in std_logic;
                RST: in std_logic;
                N: in integer;
                O: out integer
            );
    end component;
    component btn_driver
        port (
                 S1: in std_logic;
                 S2: in std_logic;
                 S3: in std_logic;
                 S4: in std_logic;
                 S5: in std_logic;
                 S6: in std_logic;
                 O: out integer
             );
    end component;
begin

    -- 时钟分频成秒
    divide_second: divider
    port map(
                CLK => CLK,
                RST => RST,
                N => 100000000,
                O => one_second
            );

    divide_mos_refresh: divider
    port map(
                CLK => CLK,
                RST => RST,
                N => 10000,
                O => mos_refresh_clk
            );

    -- the_matrix_input: matrix_input
    -- port map(
    --             CLK => CLK,
    --             CLR => RST,
    --             kcol => kcol,
    --             krow => krow,
    --             seg_num => output_mos
    --         );

    the_counter: counter
    port map(
                CLK => one_second,
                RST => RST,
                N => 10,
                O => counter_output
            );

    process(counter_output)
    begin
        mos_ints <= (
                    counter_output,
                    counter_output,
                    counter_output,
                    counter_output,
                    counter_output,
                    counter_output,
                    counter_output,
                    counter_output
                );
    end process;

    the_mos_driver: mos_driver
    port map(
                D8 => mos_ints(8),
                D7 => mos_ints(7),
                D6 => mos_ints(6),
                D5 => mos_ints(5),
                D4 => mos_ints(4),
                D3 => mos_ints(3),
                D2 => mos_ints(2),
                D1 => mos_ints(1),
                DOT8 => mos_dots(8),
                DOT7 => mos_dots(7),
                DOT6 => mos_dots(6),
                DOT5 => mos_dots(5),
                DOT4 => mos_dots(4),
                DOT3 => mos_dots(3),
                DOT2 => mos_dots(2),
                DOT1 => mos_dots(1),
                CLK => mos_refresh_clk,
                OUTNUM => OUTNUM,
                SELNUM => SELNUM
            );

-- the_btn_driver: btn_driver
-- port map(
--             S1 => S1,
--             S2 => S2,
--             S3 => S3,
--             S4 => S4,
--             S5 => S5,
--             S6 => S6,
--             O => btn_pressed
--         );

-- process(btn_pressed)
-- begin
--     if btn_pressed = 2 then
--         if bling_bit = 8 then
--             bling_bit <= 1;
--         else
--             bling_bit <= bling_bit + 1;
--         end if;
--     elsif btn_pressed = 1 then
--         if bling_bit = 1 then
--             bling_bit <= 8;
--         else
--             bling_bit <= bling_bit - 1;
--         end if;
--     end if;
-- end process;

end Behavioral;
