----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2023/03/30 16:59:14
-- Design Name: 
-- Module Name: martixInput - stl
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

entity martixInput is port(
    clk:in std_logic;
    clear:in std_logic;
    krow:out std_logic_vector(3 downto 0);
    kcol:in std_logic_vector(3 downto 0);
    pressed:out std_logic;
    seg_num:out std_logic_vector(3 downto 0)
);
end martixInput;

architecture stl of martixInput is
    --component bit_trans_mos is port ( 
        --bitt:in std_logic_vector(3 downto 0);
        --mos:out std_logic_vector(7 downto 0)
    --);
    --end component;
    --signal temp:std_logic_vector(3 downto 0):="0000";
    --signal clk0:std_logic;
begin
    --process(clk)
        --variable cnt:integer range 0 to 500000;
    --begin
        --if(rising_edge(clk)) then
            --if(cnt=500000) then
                --cnt:=0;
                --clk0<=not clk0;
            --else
                --cnt:=cnt+1;
            --end if;
        --end if;
    --end process;
    --��ʼ��������ɨ��
    process(clk,clear,kcol)
        --����һ���������ڴ����Ӧ����ܵ�ֵ
        variable q:std_logic_vector(3 downto 0);
        --����һ���������涨��ɨ���ģʽ
        variable sr:std_logic_vector(1 downto 0);
        variable temprow:std_logic_vector(3 downto 0);
    begin
        if(clear='1') then
            q:="1111";sr:="00";
            temprow:="0000";
            pressed<='0';
        elsif(rising_edge(clk)) then
            --ÿ���10ms����һ��ɨ��
            if(sr=0) then
                temprow:="1110";--ɨ���һ��
                sr:=sr+1;
            elsif(sr=1) then
                temprow:="1101";--ɨ��ڶ���
                sr:=sr+1;
            elsif(sr=2) then
                temprow:="1011";--ɨ�������
                sr:=sr+1;
            elsif(sr=3) then
                temprow:="0111";--ɨ�������
                sr:="00";
            end if;
            --����kcol��ֵ�������������
            pressed<='1';
            if(temprow="1110") then
                if(kcol="1011") then    
                    q:="0000";      --��һ�еڶ��У�0
                elsif(kcol="1110") then
                    q:="1101";
                else
                   pressed<='0'; 
                end if;
            elsif(temprow="1101") then
                if(kcol="0111") then
                    q:="0111";      --�ڶ��е�һ�У�7
                elsif(kcol="1011") then
                    q:="1000";      --�ڶ��еڶ��У�8
                elsif(kcol="1101") then
                    q:="1001";      --�ڶ��е����У�9
                elsif(kcol="1110") then
                    q:="1100";
                else
                    pressed<='0'; 
                end if;
            elsif(temprow="1011") then
                if(kcol="0111") then
                    q:="0100";      --�����е�һ�У�4
                elsif(kcol="1011") then
                    q:="0101";      --�����еڶ��У�5
                elsif(kcol="1101") then
                    q:="0110";      --�����е����У�6
                elsif(kcol="1110") then
                    q:="1011";
                else
                    pressed<='0'; 
                end if;
            elsif(temprow="0111") then
                if(kcol="0111") then
                    q:="0001";      --�����е�һ�У�1
                elsif(kcol="1011") then
                    q:="0010";      --�����еڶ��У�2
                elsif(kcol="1101") then
                    q:="0011";      --�����е����У�3
                elsif(kcol="1110") then
                    q:="1010";
                else
                    pressed<='0'; 
                end if;
            end if;
            krow<=temprow;
            seg_num<=q;
        end if;
    end process;
   -- u0:bit_trans_mos port map(bitt=>temp,mos=>seg_num);
end stl;
