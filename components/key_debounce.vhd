library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
entity key_debounce is
    port(
    clk,key: in std_logic;
    key_out: out std_logic
);
end key_debounce;
architecture behav of key_debounce is
    signal counter:integer range 0 to 50000000;
    signal df_1,df_2,df,rst_n:std_logic;
    constant timer:integer:=5000;
begin


    process(clk)
    begin
        if clk'event and clk='1' then
            df_1<=key;
            df_2<=df_1;
        end if;
        df<=df_1 xor df_2;
        rst_n<=df;
    end process;

    process(clk,rst_n)
    begin
        if rst_n='1' then
            counter<=0;
        elsif clk'event and clk='1' then
            counter<=counter+1;
            if counter=50000000 then  
                counter<=0;
            end if;
            if counter>=timer then
                key_out<=key;
            end if;
        end if;
    end process;
end behav;
