library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity main is
    port(
            CLK: in std_logic;
            RST: in std_logic;
            -- ROW: in std_logic_vector(3 downto 0);
            -- COL: in std_logic_vector(3 downto 0);
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
    -- component key_seg
    --     port(
    --             CLK: in std_logic;
    --             RST: in std_logic;
    --             ROW: in std_logic_vector(3 downto 0);
    --             COL: in std_logic_vector(3 downto 0);
    --             O: out integer
    --         );
    -- end component;
    component mos_driver
        port(
                CLK: in std_logic;
                IPT: in integer;
                RST: in std_logic;
                DOT: in std_logic;
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
begin
    -- 时钟分频成秒
    the_divider: divider port map(
                                     CLK => CLK,
                                     RST => RST,
                                     N => 100000000,
                                     O => divided_clock
                                 );

    -- the_key_seg: key_seg port map(
    --                                  CLK => CLK,
    --                                  RST => RST,
    --                                  ROW => ROW,
    --                                  COL => COL,
    --                                  O => ipt_num
    --                              );

    the_counter: counter port map(
                                     CLK => divided_clock,
                                     RST => RST,
                                     N => 10,
                                     O => output_mos
                                 );

    the_mos_driver: mos_driver port map(
                                           CLK => divided_clock,
                                           IPT => output_mos,
                                           RST => RST,
                                           DOT => '1',
                                           OUTNUM => OUTNUM,
                                           SELNUM => SELNUM
                                       );

end Behavioral;
