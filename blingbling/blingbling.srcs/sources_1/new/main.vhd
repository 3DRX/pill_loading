----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2023/04/04 16:05:43
-- Design Name: 
-- Module Name: main - stl
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

entity main is port ( 
    start:in std_logic;
    stdclk:in std_logic; --100MHz
    clear:in std_logic;  --����
    krow:out std_logic_vector(3 downto 0);
    kcol:in std_logic_vector(3 downto 0);
    btn1,btn2:in std_logic;
    output:out std_logic_vector(7 downto 0);--�������ʾ����
    which:out std_logic_vector(7 downto 0)  --�������ʾλ
);
end main;

architecture stl of main is
    --�Ӽ��̻�ȡ����
    component martixInput is port(
        clk:in std_logic;
        clear:in std_logic;
        krow:out std_logic_vector(3 downto 0);
        kcol:in std_logic_vector(3 downto 0);
        pressed:out std_logic;
        seg_num:out std_logic_vector(3 downto 0)
    );
    end component;
    --������չʾ���������
    component show_mos is port ( 
        start:in std_logic;
        clk:in std_logic;   --1000Hz
        blingblingclk:in std_logic; --2Hz
        q0,q1,q2,q3,q4,q5,q6,q7:in std_logic_vector(7 downto 0);
        whichbling:in std_logic_vector(7 downto 0);
        output:out std_logic_vector(7 downto 0);
        which:out std_logic_vector(7 downto 0)
    );
    end component;
    --����һ��integer����ö�ӦƵ�ʷ�Ƶ
    component divider is port ( 
        stdclk:in std_logic;--100MHz
        n:in integer;
        output:out std_logic
    );
    end component;
    --����λ��������ת��Ϊ�߶����������ʾ������
    component bit_trans_mos is port ( 
        bitt:in std_logic_vector(3 downto 0);
        mos:out std_logic_vector(7 downto 0)
    );
    end component;
    --ͨ����ť�ı�Ҫ�����λ
    component choosebit is port ( 
        clk:in std_logic;
        btn1,btn2:in std_logic;
        start:in std_logic;
        inputchoose:in std_logic_vector(7 downto 0);
        init:in std_logic_vector(7 downto 0);
        outputchoose:out std_logic_vector(7 downto 0)
    );
    end component;
    --��������
    component debounce is port ( 
        clk:in std_logic;   --����ʱ��20HZ
        key:in std_logic;
        output:out std_logic    
    );
    end component;
    --blingbling
    component inputbit is port (
        choose:in std_logic_vector(7 downto 0);
        pressed:in std_logic;
        input:in std_logic_vector(3 downto 0);
        q1,q2,q3,q4,q5,q6,q7,q8:inout std_logic_vector(3 downto 0)
    );
    end component;
    --����Ƶ��
    signal oneThousandHz:std_logic;
    signal tenThousandHz:std_logic;
    signal twentyHz:std_logic;
    signal fiveHz:std_logic;
    signal oneHz:std_logic;
    --��������������
    signal tempmartix:std_logic_vector(3 downto 0);
    --������ʾ�ܵ�����(��λ������)
    signal q1:std_logic_vector(3 downto 0):="0000";
    signal q2:std_logic_vector(3 downto 0):="0000";
    signal q3:std_logic_vector(3 downto 0):="0000";
    signal q4:std_logic_vector(3 downto 0):="0000";
    signal q5:std_logic_vector(3 downto 0):="0000";
    signal q6:std_logic_vector(3 downto 0):="0000";
    signal q7:std_logic_vector(3 downto 0):="0000";
    signal q8:std_logic_vector(3 downto 0):="0000";
    --������ʾ�ܵ�����(��λ)
    signal mq1,mq2,mq3,mq4,mq5,mq6,mq7,mq8:std_logic_vector(7 downto 0);
    --ѡ���޸ĵ�λ
    signal tempchoose:std_logic_vector(7 downto 0):="00000001";
    --��ť�������
    signal btn1pressed,btn2pressed:std_logic;
    signal pressed:std_logic:='0';
begin
    --��ȡ��Ҫ��Ƶ��
    u1:divider port map(stdclk=>stdclk,n=>10000000,output=>fiveHz);
    u2:divider port map(stdclk=>stdclk,n=>500000,output=>oneThousandHz);
    u3:divider port map(stdclk=>stdclk,n=>2500000,output=>twentyHz);
    u18:divider port map(stdclk=>stdclk,n=>50000,output=>tenThousandHz);
    u20:divider port map(stdclk=>stdclk,n=>50000000,output=>oneHz);
    --�Ӿ�������л�ȡ����
    u4:martixInput port map(clk=>oneThousandHz,clear=>clear,krow=>krow,kcol=>kcol,seg_num=>tempmartix,pressed=>pressed);
    --���ѡ���޸ĵ�λ��
    u16:debounce port map(clk=>twentyHz,key=>btn1,output=>btn1pressed);
    u17:debounce port map(clk=>twentyHz,key=>btn2,output=>btn2pressed);
    u6:choosebit port map(clk=>fiveHz,btn1=>btn1,btn2=>btn2,start=>start,inputchoose=>tempchoose,init=>"11111110",outputchoose=>tempchoose);
    --��ѡ�е�λblingbling
    u19:inputbit port map(choose=>tempchoose,pressed=>pressed,input=>tempmartix,
                            q1=>q1,q2=>q2,q3=>q3,q4=>q4,q5=>q5,q6=>q6,q7=>q7,q8=>q8                                                             
                            );
    --���˸�����ܵĶ���������Ϊ��λ
    u7: bit_trans_mos port map(bitt=>q1,mos=>mq1);
    u8: bit_trans_mos port map(bitt=>q2,mos=>mq2);
    u9: bit_trans_mos port map(bitt=>q3,mos=>mq3);
    u10:bit_trans_mos port map(bitt=>q4,mos=>mq4);
    u11:bit_trans_mos port map(bitt=>q5,mos=>mq5);
    u12:bit_trans_mos port map(bitt=>q6,mos=>mq6);
    u13:bit_trans_mos port map(bitt=>q7,mos=>mq7);
    u14:bit_trans_mos port map(bitt=>q8,mos=>mq8);
    --��ʾ����
    u15:show_mos port map(blingblingclk=>oneHz,start=>start,clk=>tenThousandHz,
                          q0=>mq1,q1=>mq2,q2=>mq3,whichbling=>tempchoose,
                          q3=>mq4,q4=>mq5,q5=>mq6,q6=>mq7,q7=>mq8,
                          output=>output,which=>which);
end stl;
