----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2023/04/05 14:45:18
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

entity inputbit is port (
    choose:in std_logic_vector(7 downto 0);
    pressed:in std_logic;
    input:in std_logic_vector(3 downto 0);
    q1,q2,q3,q4,q5,q6,q7,q8:inout std_logic_vector(3 downto 0)
);
end inputbit;

architecture stl of inputbit is
    signal temp:std_logic_vector(3 downto 0);
    signal tempbling:std_logic_vector(3 downto 0);
begin
    process(choose,pressed)
    begin
        if(pressed='1') then
            if(choose(0)='0') then  q1<=input;
            elsif(choose(1)='0') then   q2<=input;
            elsif(choose(2)='0') then   q3<=input;
            elsif(choose(3)='0') then   q4<=input;
            elsif(choose(4)='0') then   q5<=input;
            elsif(choose(5)='0') then   q6<=input;
            elsif(choose(6)='0') then   q7<=input;
            elsif(choose(7)='0') then   q8<=input;
            end if;
        end if;
    end process;

end stl;
