----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/06/2023 10:21:25 AM
-- Design Name: 
-- Module Name: SubBytes - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity SubBytes is
    Port ( input2 : in STD_LOGIC_VECTOR (127 downto 0);
           output2 : out STD_LOGIC_VECTOR (127 downto 0));
end SubBytes;

architecture Behavioral of SubBytes is

component S_box is port(
byte_in : in std_logic_vector(7 downto 0);
byte_out : out std_logic_vector(7 downto 0));
end component;

begin
GEN_EXAMPLE1: for i in 0 to 15 generate

    uut : S_box port map( byte_in => input2((i * 8) + 7 downto (i * 8)), byte_out => output2((i * 8) + 7 downto (i * 8)));
    
end generate GEN_EXAMPLE1;

end Behavioral;
