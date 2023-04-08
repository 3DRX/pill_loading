library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity main is
    port(
            CLK: in std_logic;
            START: in std_logic;
            kcol:in std_logic_vector(3 downto 0);
            krow:out std_logic_vector(3 downto 0);
            S1: in std_logic;
            S2: in std_logic;
            S3: in std_logic;
            S4: in std_logic;
            S5: in std_logic;
            OUTNUM: out std_logic_vector(7 downto 0);
            SELNUM: out std_logic_vector(7 downto 0);
            TEST: out std_logic
        );
end entity main;

architecture Behavioral of main is
    -- 消抖后的按钮
    signal OS1: std_logic;
    signal OS2: std_logic;
    signal OS3: std_logic;
    signal OS4: std_logic;
    signal OS5: std_logic;
    -- 输入数字
    signal ipt_num: integer range 0 to 9;
    -- 分频后的时钟
    signal one_second: std_logic := '0';
    signal mos_refresh_clk: std_logic := '0';
    signal bling_clk: std_logic := '0';
    signal debounce_clk: std_logic := '0';
    -- 计数器输出
    signal ten_counter: integer := 0;
    -- 数码管显示输出
    -- 计数值
    signal count_ints: integer_vector(7 downto 0) := (others => 0);
    -- 设置值
    signal set_ints: integer_vector(7 downto 0) := (others => 0);
    -- 显示输出值
    signal mos_ints: integer_vector(7 downto 0) := (others => 0);
    signal mos_dots: std_logic_vector(7 downto 0) := "11101011";
    signal o_mos_ints: integer_vector(7 downto 0) := (others => 0);
    signal o_mos_dots: std_logic_vector(7 downto 0) := (others => '0');
    -- 正在闪烁的位，1有效
    signal bling_bit: std_logic_vector(7 downto 0);
    -- 键盘输入值
    signal matrix_num: integer := 0;
    -- 当前设定的最大值
    signal t_pill_max: integer;
    signal t_bottle_max: integer;
    component mos_driver
        port(
                INTS: in integer_vector(7 downto 0);
                DOTS: in std_logic_vector(7 downto 0);
                CLK: in std_logic;
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
                O: out integer;
                C: out std_logic
            );
    end component;
    component bling_driver
        port (
                 bling_clk: in std_logic;
                 -- 闪烁的位，1有效
                 bling_bit: in std_logic_vector(7 downto 0);
                 MOS_INTS: in integer_vector(7 downto 0);
                 MOS_DOTS: in std_logic_vector(7 downto 0);
                 O_MOS_INTS: out integer_vector(7 downto 0);
                 O_MOS_DOTS: out std_logic_vector(7 downto 0)
             );
    end component;
    component DeBounce
        port(
                Clock : in std_logic;
                Reset : in std_logic;
                button_in : in std_logic;
                pulse_out : out std_logic
            );
    end component;
    component ints_switcher
        port (
                 START: in std_logic;
                 COUNT_INTS: in integer_vector(7 downto 0);
                 SET_INTS: in integer_vector(7 downto 0);
                 MOS_INTS: out integer_vector(7 downto 0)
             );
    end component;
    component set_num_controller
        port (
                 CLK: in std_logic; -- 100MHz
                 START: in std_logic;
                 S1: in std_logic;
                 S2: in std_logic;
                 S4: in std_logic;
                 kcol:in std_logic_vector(3 downto 0);
                 krow:out std_logic_vector(3 downto 0);
                 PILL_MAX: out integer;
                 BOTTLE_MAX: out integer;
                 BLING_BIT: out std_logic_vector(7 downto 0);
                 SET_INTS: out integer_vector(7 downto 0)
             );
    end component;
    component count_pill_controller
        port (
                 CLK: in std_logic; -- 10MHz
                 START: in std_logic;       -- 1有效
                 PILL_MAX: in integer;      -- 每瓶最大药片数
                 BOTTLE_MAX: in integer;    -- 最大瓶数
                 COUNT_INTS: out integer_vector(7 downto 0)
             );
    end component;
begin
    the_count_pill_controller: count_pill_controller
    port map(
                CLK => CLK,
                START => START,
                PILL_MAX => t_pill_max,
                BOTTLE_MAX => t_bottle_max,
                COUNT_INTS => count_ints
            );

    the_set_num_controller: set_num_controller
    port map(
                CLK => CLK,
                START => START,
                S1 => OS1,
                S2 => OS2,
                S4 => OS4,
                kcol => kcol,
                krow => krow,
                PILL_MAX => t_pill_max,
                BOTTLE_MAX => t_bottle_max,
                BLING_BIT => bling_bit,
                SET_INTS => set_ints
            );

    BTN1: DeBounce
    port map(
                Clock => debounce_clk,
                Reset => '0',
                button_in => S1,
                pulse_out => OS1
            );

    BTN2: DeBounce
    port map(
                Clock => debounce_clk,
                Reset => '0',
                button_in => S2,
                pulse_out => OS2
            );

    BTN3: DeBounce
    port map(
                Clock => debounce_clk,
                Reset => '0',
                button_in => S3,
                pulse_out => OS3
            );

    BTN4: DeBounce
    port map(
                Clock => debounce_clk,
                Reset => '0',
                button_in => S4,
                pulse_out => OS4
            );

    BTN5: DeBounce
    port map(
                Clock => debounce_clk,
                Reset => '0',
                button_in => S5,
                pulse_out => TEST
            );

    -- 时钟分频成秒
    divide_second: divider
    port map(
                CLK => CLK,
                RST => '0',
                N => 100000000,
                O => one_second
            );

    divide_bling: divider
    port map(
                CLK => CLK,
                RST => '0',
                N => 50000000,
                O => bling_clk
            );

    divide_debounce: divider
    port map(
                CLK => CLK,
                RST => '0',
                N => 500000,
                O => debounce_clk
            );

    divide_mos_refresh: divider
    port map(
                CLK => CLK,
                RST => '0',
                N => 100000,
                O => mos_refresh_clk
            );

    the_ints_switcher: ints_switcher
    port map(
                START => START,
                COUNT_INTS => count_ints,
                SET_INTS => set_ints,
                MOS_INTS => mos_ints
            );

    -- the_counter: counter
    -- port map(
    --             CLK => one_second,
    --             RST => not START,
    --             N => 10,
    --             O => ten_counter,
    --             C => open
    --         );

    the_mos_driver: mos_driver
    port map(
                INTS => o_mos_ints,
                DOTS => o_mos_dots,
                CLK => mos_refresh_clk,
                OUTNUM => OUTNUM,
                SELNUM => SELNUM
            );

    the_bling_driver: bling_driver
    port map(
                bling_clk => bling_clk,
                bling_bit => bling_bit,
                MOS_INTS => mos_ints,
                MOS_DOTS => mos_dots,
                O_MOS_INTS => o_mos_ints,
                O_MOS_DOTS => o_mos_dots
            );

end Behavioral;
