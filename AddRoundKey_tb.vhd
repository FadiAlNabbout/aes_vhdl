----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/06/2023 11:05:32 AM
-- Design Name: 
-- Module Name: AddRoundKey_tb - Behavioral
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

entity AddRoundKey_tb is
end AddRoundKey_tb;

architecture Behavioral of AddRoundKey_tb is
component AddRoundKey is port(
input, key : in std_logic_vector(127 downto 0);
output : out std_logic_vector(127 downto 0));
end component;
signal input, key, output : std_logic_vector(127 downto 0);
begin
uut : AddRoundKey port map( input => input, key => key, output => output);
stim : process
begin
    input <= X"6BC1BEE22E409F96E93D7E117393172A";
    key <=  X"2B7E151628AED2A6ABF7158809CF4F3C";
    wait for 10 ns;
    assert (output = X"40BFABF406EE4D3042CA6B997A5C5816")
    report "test failed for input combination " severity error;

    end process;

end Behavioral;
