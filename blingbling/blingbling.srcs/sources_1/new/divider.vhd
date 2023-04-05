----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2023/04/04 14:05:57
-- Design Name: 
-- Module Name: divider - stl
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

entity divider is port ( 
    stdclk:in std_logic;--100MHz
    n:in integer;
    output:out std_logic
);
end divider;

architecture stl of divider is 
    signal tempoutput:std_logic;  
begin
    process(stdclk)
        variable cnt:integer;
    begin
        if(rising_edge(stdclk)) then
            if(cnt=n) then
                cnt:=0;
                tempoutput<=not tempoutput;
            else
                cnt:=cnt+1;
            end if;
        end if;
    end process;
    output<=tempoutput;
end stl;
