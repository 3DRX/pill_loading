library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity key_seg is
    port(
            CLK: in std_logic;
            RST: in std_logic;
            COL: in std_logic_vector(3 downto 0);
            ROW: out std_logic_vector(3 downto 0);
            O: out integer
        );
end key_seg;

architecture Behavioral of key_seg is
begin
    -- TODO
end Behavioral;
