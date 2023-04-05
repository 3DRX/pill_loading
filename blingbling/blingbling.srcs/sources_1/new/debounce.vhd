----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2023/04/04 15:22:41
-- Design Name: 
-- Module Name: debounce - stl
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

entity debounce is port ( 
    clk:in std_logic;   --Ïû¶¶Ê±Ðò£º20HZ
    key:in std_logic;
    output:out std_logic    
);
end debounce;

architecture stl of debounce is
    signal temp,temp1,temp2,ignore,tempoutput:std_logic;
begin
    process(clk)
    begin
        if(rising_edge(clk)) then
            temp1<=key;
            temp2<=temp1;
        end if;
        temp<=temp1 xor temp2;
        ignore<=temp;
    end process;
    
    process(clk,ignore)
    begin
        if(ignore='1') then null;
        elsif(rising_edge(clk)) then
            tempoutput<=key;
        end if;
    end process;
    output<=tempoutput;
end stl;
