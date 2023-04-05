----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2023/04/04 13:30:11
-- Design Name: 
-- Module Name: show_mos - stl
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
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity show_mos is port ( 
    start:in std_logic;
    clk:in std_logic;   --1000Hz
    blingblingclk:in std_logic; --2Hz
    q0,q1,q2,q3,q4,q5,q6,q7:in std_logic_vector(7 downto 0);
    whichbling:in std_logic_vector(7 downto 0);
    output:out std_logic_vector(7 downto 0);
    which:out std_logic_vector(7 downto 0)
);
end show_mos;

architecture stl of show_mos is
    signal tempwhich:std_logic_vector(7 downto 0);
    signal tempoutput:std_logic_vector(7 downto 0);
    signal tq0,tq1,tq2,tq3,tq4,tq5,tq6,tq7:std_logic_vector(7 downto 0);
begin
    process(clk,blingblingclk)
        variable cnt:integer range -1 to 7;
    begin
        if(start='0') then
            tq0<=q0;tq1<=q1;tq2<=q2;tq3<=q3;
            tq4<=q4;tq5<=q5;tq6<=q6;tq7<=q7;
        end if;
        if(blingblingclk='1') then
            if(whichbling(0)='0') then  tq0<="11111111";
            elsif(whichbling(1)='0') then   tq1<="11111111";
            elsif(whichbling(2)='0') then   tq2<="11111111";
            elsif(whichbling(3)='0') then   tq3<="11111111";
            elsif(whichbling(4)='0') then   tq4<="11111111";
            elsif(whichbling(5)='0') then   tq5<="11111111";
            elsif(whichbling(6)='0') then   tq6<="11111111";
            elsif(whichbling(7)='0') then   tq7<="11111111";
            end if;
        else
            tq0<=q0;tq1<=q1;tq2<=q2;tq3<=q3;
            tq4<=q4;tq5<=q5;tq6<=q6;tq7<=q7;
        end if;
        if(rising_edge(clk)) then
            if(cnt=0) then  tempwhich<="11111110";
            elsif(cnt=1) then   tempwhich<="01111111";
            elsif(cnt=2) then   tempwhich<="10111111";
            elsif(cnt=3) then   tempwhich<="11011111";
            elsif(cnt=4) then   tempwhich<="11101111";
            elsif(cnt=5) then   tempwhich<="11110111";
            elsif(cnt=6) then   tempwhich<="11111011";
            elsif(cnt=7) then   tempwhich<="11111101";cnt:=-1;
            end if;
            cnt:=cnt+1;
        end if;
        if(tempwhich(0)='0') then
            tempoutput<=tq0;
        elsif(tempwhich(1)='0') then
            tempoutput<=tq1;
        elsif(tempwhich(2)='0') then
            tempoutput<=tq2;
        elsif(tempwhich(3)='0') then
            tempoutput<=tq3;
        elsif(tempwhich(4)='0') then
            tempoutput<=tq4;
        elsif(tempwhich(5)='0') then
            tempoutput<=tq5;
        elsif(tempwhich(6)='0') then
            tempoutput<=tq6;
        elsif(tempwhich(7)='0') then
            tempoutput<=tq7;
        end if;
    end process;
    which<=tempwhich;
    output<=tempoutput;
end stl;
