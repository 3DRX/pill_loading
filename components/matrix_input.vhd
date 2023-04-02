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
    --��Ƶ������100MHz��ƵΪ1kHz
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
    --��ʼ��������ɨ��
    process(clk0,CLR,kcol)
        --����һ���������ڴ����Ӧ����ܵ�ֵ
        variable q:integer := 10;
        --����һ���������涨��ɨ���ģʽ
        variable sr:std_logic_vector(1 downto 0);
        variable temprow:std_logic_vector(3 downto 0);
    begin
        if(CLR='1') then
            q:=10;sr:="00";
            temprow:="0000";
        elsif(rising_edge(clk0)) then
            --ÿ���10ms����һ��ɨ��
            if(sr=0) then
                temprow:="1110"; -- ɨ���һ��
                sr:=sr+1;
            elsif(sr=1) then
                temprow:="1101"; -- ɨ��ڶ���
                sr:=sr+1;
            elsif(sr=2) then
                temprow:="1011"; -- ɨ�������
                sr:=sr+1;
            elsif(sr=3) then
                temprow:="0111"; -- ɨ�������
                sr:="00";
            end if;
            --����kcol��ֵ�������������
            if(temprow="1110") then
                if(kcol="1011") then    
                    q:=0;      --��һ�еڶ��У�0
                end if;
            elsif(temprow="1101") then
                if(kcol="0111") then
                    q:=7;      --�ڶ��е�һ�У�7
                elsif(kcol="1011") then
                    q:=8;      --�ڶ��еڶ��У�8
                elsif(kcol="1101") then
                    q:=9;      --�ڶ��е����У�9
                end if;
            elsif(temprow="1011") then
                if(kcol="0111") then
                    q:=4;      --�����е�һ�У�4
                elsif(kcol="1011") then
                    q:=5;      --�����еڶ��У�5
                elsif(kcol="1101") then
                    q:=6;      --�����е����У�6
                end if;
            elsif(temprow="0111") then
                if(kcol="0111") then
                    q:=1;      --�����е�һ�У�1
                elsif(kcol="1011") then
                    q:=2;      --�����еڶ��У�2
                elsif(kcol="1101") then
                    q:=3;      --�����е����У�3
                end if;
            end if;
            krow<=temprow;
            seg_num<=q;
        end if;
    end process;
end stl;
