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
    signal twenty_milo_second: std_logic := '0';
    signal mos_refresh_clk: std_logic := '0';
    signal bling_clk: std_logic := '0';
    -- 计数器输出
    signal ten_counter: integer := 0;
    -- 数码管显示输出
    type ints is array (1 to 8) of integer;
    type dots is array (1 to 8) of std_logic;
    signal mos_ints: ints := (1, 2, 3, 4, 5, 6, 7, 8);
    signal mos_dots: dots := ('1', '1', '1', '1', '1', '1', '1', '1');
    signal o_mos_ints: ints := (1, 2, 3, 4, 5, 6, 7, 8);
    signal o_mos_dots: dots := ('1', '1', '1', '1', '1', '1', '1', '1');
    -- 正在闪烁的位
    signal bling_bit: integer range 1 to 8 := 1;
    -- 正在被按下的按钮
    signal btn_pressed: std_logic_vector(5 downto 0) := "000000";
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
                 BTN_CLK: in std_logic;
                 O: out std_logic_vector(5 downto 0)
             );
    end component;
    component bling_driver
        port (
        D8, D7, D6, D5, D4, D3, D2, D1: in integer;
        DOT8, DOT7, DOT6, DOT5, DOT4, DOT3, DOT2, DOT1: in std_logic;
        bling_clk: in std_logic;
        bling_bit: integer;
        OD8, OD7, OD6, OD5, OD4, OD3, OD2, OD1: out integer;
        ODOT8, ODOT7, ODOT6, ODOT5, ODOT4, ODOT3, ODOT2, ODOT1: out std_logic
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

    divide_btn: divider
    port map(
                CLK => CLK,
                RST => RST,
                N => 2000000,
                O => twenty_milo_second
            );

    divide_bling: divider
    port map(
                CLK => CLK,
                RST => RST,
                N => 50000000,
                O => bling_clk
            );

    divide_mos_refresh: divider
    port map(
                CLK => CLK,
                RST => RST,
                N => 100000,
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
                O => ten_counter
            );

    process(ten_counter)
    begin
    -- mos_ints <= (
    --             ten_counter,
    --             ten_counter,
    --             ten_counter,
    --             ten_counter,
    --             ten_counter,
    --             ten_counter,
    --             ten_counter,
    --             ten_counter
    --         );
    end process;

    the_mos_driver: mos_driver
    port map(
                D8 => o_mos_ints(8),
                D7 => o_mos_ints(7),
                D6 => o_mos_ints(6),
                D5 => o_mos_ints(5),
                D4 => o_mos_ints(4),
                D3 => o_mos_ints(3),
                D2 => o_mos_ints(2),
                D1 => o_mos_ints(1),
                DOT8 => o_mos_dots(8),
                DOT7 => o_mos_dots(7),
                DOT6 => o_mos_dots(6),
                DOT5 => o_mos_dots(5),
                DOT4 => o_mos_dots(4),
                DOT3 => o_mos_dots(3),
                DOT2 => o_mos_dots(2),
                DOT1 => o_mos_dots(1),
                CLK => mos_refresh_clk,
                OUTNUM => OUTNUM,
                SELNUM => SELNUM
            );

    the_bling_driver: bling_driver
    port map(
                bling_clk => bling_clk,
                bling_bit => bling_bit,
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
                OD8 => o_mos_ints(8),
                OD7 => o_mos_ints(7),
                OD6 => o_mos_ints(6),
                OD5 => o_mos_ints(5),
                OD4 => o_mos_ints(4),
                OD3 => o_mos_ints(3),
                OD2 => o_mos_ints(2),
                OD1 => o_mos_ints(1),
                ODOT8 => o_mos_dots(8),
                ODOT7 => o_mos_dots(7),
                ODOT6 => o_mos_dots(6),
                ODOT5 => o_mos_dots(5),
                ODOT4 => o_mos_dots(4),
                ODOT3 => o_mos_dots(3),
                ODOT2 => o_mos_dots(2),
                ODOT1 => o_mos_dots(1)
            );

    the_btn_driver: btn_driver
    port map(
                S1 => S1,
                S2 => S2,
                S3 => S3,
                S4 => S4,
                S5 => S5,
                S6 => S6,
                BTN_CLK => twenty_milo_second,
                O => btn_pressed
            );

    process(btn_pressed(0), btn_pressed(1))
    begin
        if rising_edge(btn_pressed(0)) then
            if bling_bit = 1 then
                bling_bit <= 8;
            else
                bling_bit <= bling_bit - 1;
            end if;
        end if;
        if rising_edge(btn_pressed(1)) then
            if bling_bit = 8 then
                bling_bit <= 1;
            else
                bling_bit <= bling_bit + 1;
            end if;
        end if;
    end process;

    process(bling_bit)
    begin
        mos_ints <= (
                    bling_bit,
                    bling_bit,
                    bling_bit,
                    bling_bit,
                    bling_bit,
                    bling_bit,
                    bling_bit,
                    bling_bit
                );
    end process;

end Behavioral;
