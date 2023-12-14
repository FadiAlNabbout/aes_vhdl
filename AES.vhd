----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/14/2023 01:50:03 PM
-- Design Name: 
-- Module Name: AES - Behavioral
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
use IEEE.std_logic_arith.ALL;
use IEEE.std_logic_unsigned.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity AES is
    Port ( input : in STD_LOGIC_VECTOR (127 downto 0);
           output : out STD_LOGIC_VECTOR (127 downto 0));
end AES;

architecture Behavioral of AES is

component AddRoundKey is port(
input1 : in std_logic_vector(127 downto 0);
output1 : out std_logic_vector(127 downto 0));
end component;

component SubBytes is port(
input2 : in std_logic_vector(127 downto 0);
output2 : out std_logic_vector(127 downto 0));
end component;

component ShiftRows is port(
input3 : in std_logic_vector(127 downto 0);
output3 : out std_logic_vector(127 downto 0));
end component;

component MixColumns is port(
input4 : in std_logic_vector(127 downto 0);
output4 : out std_logic_vector(127 downto 0));
end component;
begin

uut: AddRoundkey port map(input1 => input, output1 => output);

end Behavioral;
