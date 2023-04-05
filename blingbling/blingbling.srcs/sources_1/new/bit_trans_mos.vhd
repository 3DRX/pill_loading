----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2023/04/04 13:48:46
-- Design Name: 
-- Module Name: bit_trans_mos - stl
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

entity bit_trans_mos is port ( 
    bitt:in std_logic_vector(3 downto 0);
    mos:out std_logic_vector(7 downto 0)
);
end bit_trans_mos;

architecture stl of bit_trans_mos is

begin
    mos<= "11000000" when (bitt="0000") else --0
          "11111001" when (bitt="0001") else --1
          "10100100" when (bitt="0010") else --2
          "10110000" when (bitt="0011") else --3
          "10011001" when (bitt="0100") else --4
          "10010010" when (bitt="0101") else --5
          "10000010" when (bitt="0110") else --6
          "11111000" when (bitt="0111") else --7
          "10000000" when (bitt="1000") else --8
          "10010000" when (bitt="1001") else --9
          "10001000" when (bitt="1010") else --A
          "10000011" when (bitt="1011") else --B
          "11000110" when (bitt="1100") else --C
          "10100001" when (bitt="1101") else --D
          "11111111" ;  --È«ºÚ
end stl;
