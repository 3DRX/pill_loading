----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2023/04/05 15:11:01
-- Design Name: 
-- Module Name: blingbling - stl
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

entity blingbling is port (
    clk:in std_logic;
    pressed:in std_logic;
    choose:in std_logic_vector(7 downto 0);
    q1,q2,q3,q4,q5,q6,q7,q8:inout std_logic_vector(3 downto 0)
);
end blingbling;

architecture stl of blingbling is
    signal temp:std_logic_vector(3 downto 0);
begin
        process(clk)
        begin
            if(clk='1') then
                temp<="1111";
            else
                if(choose(0)='0') then  temp<=q1;
                elsif(choose(1)='0') then   temp<=q2;
                elsif(choose(2)='0') then   temp<=q3;
                elsif(choose(3)='0') then   temp<=q4;
                elsif(choose(4)='0') then   temp<=q5;
                elsif(choose(5)='0') then   temp<=q6;
                elsif(choose(6)='0') then   temp<=q7;
                elsif(choose(7)='0') then   temp<=q8;
                end if;
            end if;
        end process;
        process(choose,temp)
        begin
            if(choose(0)='0') then  q1<=temp;
            elsif(choose(1)='0') then   q2<=temp;
            elsif(choose(2)='0') then   q3<=temp;
            elsif(choose(3)='0') then   q4<=temp;
            elsif(choose(4)='0') then   q5<=temp;
            elsif(choose(5)='0') then   q6<=temp;
            elsif(choose(6)='0') then   q7<=temp;
            elsif(choose(7)='0') then   q8<=temp;
            end if;
        end process;
end stl;
