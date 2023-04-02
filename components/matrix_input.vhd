library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity matrix_input is
    port(
            CLK:in std_logic;
            CLR:in std_logic;
            kcol:in std_logic_vector(3 downto 0);
            krow:out std_logic_vector(3 downto 0);
            seg_num:out integer
        );
end matrix_input;

architecture stl of matrix_input is
    signal clk0:std_logic;
begin
    --分频器，将100MHz分频为1kHz
    process(CLK)
        variable cnt:integer range 0 to 50000;
    begin
        if(rising_edge(CLK)) then
            cnt:=cnt+1;
            if(cnt=50000) then
                cnt:=0;
                clk0<=not clk0;
            end if;
        end if;
    end process;
    --开始进行行列扫描
    process(clk0,CLR,kcol)
        --定义一个变量用于储存对应数码管的值
        variable q:integer := 10;
        --定义一个变量来规定行扫描的模式
        variable sr:std_logic_vector(1 downto 0);
        variable temprow:std_logic_vector(3 downto 0);
    begin
        if(CLR='1') then
            q:=10;sr:="00";
            temprow:="0000";
        elsif(rising_edge(clk0)) then
            --每间隔10ms进行一次扫描
            if(sr=0) then
                temprow:="1110"; -- 扫描第一行
                sr:=sr+1;
            elsif(sr=1) then
                temprow:="1101"; -- 扫描第二行
                sr:=sr+1;
            elsif(sr=2) then
                temprow:="1011"; -- 扫描第三行
                sr:=sr+1;
            elsif(sr=3) then
                temprow:="0111"; -- 扫描第四行
                sr:="00";
            end if;
            --根据kcol的值决定输出的数字
            if(temprow="1110") then
                if(kcol="1011") then    
                    q:=0;      --第一行第二列：0
                end if;
            elsif(temprow="1101") then
                if(kcol="0111") then
                    q:=7;      --第二行第一列：7
                elsif(kcol="1011") then
                    q:=8;      --第二行第二列：8
                elsif(kcol="1101") then
                    q:=9;      --第二行第三列：9
                end if;
            elsif(temprow="1011") then
                if(kcol="0111") then
                    q:=4;      --第三行第一列：4
                elsif(kcol="1011") then
                    q:=5;      --第三行第二列：5
                elsif(kcol="1101") then
                    q:=6;      --第三行第三列：6
                end if;
            elsif(temprow="0111") then
                if(kcol="0111") then
                    q:=1;      --第四行第一列：1
                elsif(kcol="1011") then
                    q:=2;      --第四行第二列：2
                elsif(kcol="1101") then
                    q:=3;      --第四行第三列：3
                end if;
            end if;
            krow<=temprow;
            seg_num<=q;
        end if;
    end process;
end stl;
