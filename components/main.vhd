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
    signal divided_clock: std_logic := '0';
    -- 数码管显示输出
    signal output_mos: integer := 0;
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
        RST: in std_logic;
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
    -- the_divider: divider
    -- port map(
    --             CLK => CLK,
    --             RST => RST,
    --             N => 100000000,
    --             O => divided_clock
    --         );

    -- the_matrix_input: matrix_input
    -- port map(
    --             CLK => CLK,
    --             CLR => RST,
    --             kcol => kcol,
    --             krow => krow,
    --             seg_num => output_mos
    --         );

    -- the_counter: counter
    -- port map(
    --             CLK => divided_clock,
    --             RST => RST,
    --             N => 10,
    --             O => output_mos
    --         );

    the_mos_driver: mos_driver
    port map(
                D8 => 8,
                D7 => 7,
                D6 => 6,
                D5 => 5,
                D4 => 4,
                D3 => 3,
                D2 => 2,
                D1 => 1,
                DOT8 => '1',
                DOT7 => '1',
                DOT6 => '1',
                DOT5 => '1',
                DOT4 => '1',
                DOT3 => '1',
                DOT2 => '1',
                DOT1 => '1',
                CLK => CLK,
                RST => RST,
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
