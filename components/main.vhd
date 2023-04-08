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
    signal bling_bit: std_logic_vector(7 downto 0) := "00000000";
    -- 键盘输入值
    signal matrix_num: integer := 0;
    component bling_selecter
        port (
                 S1: in std_logic;          -- 右按钮
                 S2: in std_logic;          -- 左按钮
                 START: in std_logic;       -- 开始信号，1有效
                 BLING_BIT: out std_logic_vector(7 downto 0)
             );
    end component;
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
begin

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

    -- the_ints_switcher: ints_switcher
    -- port map(
    --             START => START,
    --             COUNT_INTS => count_ints,
    --             SET_INTS => set_ints,
    --             MOS_INTS => mos_ints
    --         );

    -- the_matrix_input: matrix_input
    -- port map(
    --             CLK => CLK,
    --             CLR => START,
    --             kcol => kcol,
    --             krow => krow,
    --             seg_num => matrix_num
    --         );

    -- process(matrix_num, START, bling_bit)
    -- begin
    --     if START = '0' then
    --         case bling_bit is
    --             when "00001000" =>
    --                 set_ints(3) <= matrix_num;
    --             when "00000100" =>
    --                 set_ints(2) <= matrix_num;
    --             when "00000010" =>
    --                 set_ints(1) <= matrix_num;
    --             when "00000001" =>
    --                 set_ints(0) <= matrix_num;
    --             when others =>
    --         end case;
    --     end if;
    -- end process;

    the_counter: counter
    port map(
                CLK => one_second,
                RST => not START,
                N => 10,
                O => ten_counter,
                C => open
            );

    process(ten_counter)
    begin
        if START = '1' then
            mos_ints <= (
                        ten_counter,
                        ten_counter,
                        ten_counter,
                        ten_counter,
                        ten_counter,
                        ten_counter,
                        ten_counter,
                        ten_counter
                    );
        end if;
    end process;

    the_bling_selecter: bling_selecter
    port map(
                S1 => OS1,
                S2 => OS2,
                START => START,
                BLING_BIT => bling_bit
            );

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
