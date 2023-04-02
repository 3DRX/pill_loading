----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/31/2023 09:39:00 AM
-- Design Name: 
-- Module Name: main - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity main is
    port(
            CLK: in std_logic;
            RST: in std_logic;
            ROW: in std_logic_vector(3 downto 0);
            COL: in std_logic_vector(3 downto 0);
            OUTNUM: out std_logic_vector(7 downto 0);
            SELNUM: out std_logic_vector(7 downto 0)
        );
end entity main;

architecture Behavioral of main is
    signal ipt_num: integer range 0 to 9;
    component key_seg
        port(
                CLK: in std_logic;
                RST: in std_logic;
                ROW: in std_logic_vector(3 downto 0);
                COL: in std_logic_vector(3 downto 0);
                O: out integer
            );
    end component;
    component mos_driver
        port(
                CLK: in std_logic;
                IPT: in integer;
                OUTNUM: out std_logic_vector(7 downto 0);
                SELNUM: out std_logic_vector(7 downto 0)
            );
    end component;
begin
    U0: key_seg port map(
                            CLK => CLK,
                            RST => RST,
                            ROW => ROW,
                            COL => COL,
                            O => ipt_num
                        );
    U1: mos_driver port map(
                               CLK => CLK,
                               IPT => ipt_num,
                               OUTNUM => OUTNUM,
                               SELNUM => SELNUM
                           );
end Behavioral;
