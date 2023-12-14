----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/06/2023 12:18:24 PM
-- Design Name: 
-- Module Name: ShiftRows_tb - Behavioral
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

entity ShiftRows_tb is
--  Port ( );
end ShiftRows_tb;

architecture Behavioral of ShiftRows_tb is
component ShiftRows is port(
input3 : in std_logic_vector(127 downto 0);
output3 : out std_logic_vector(127 downto 0));
end component;
signal input3, output3 : std_logic_vector(127 downto 0);
begin
uut : ShiftRows port map( input3 => input3, output3 => output3);
stim : process
begin
    input3 <= X"090862BF6F28E3042C747FEEDA4A6A47";
    wait for 10 ns;
--    assert (output = X"40BFABF406EE4D3042CA6B997A5C5816")
--    report "test failed for input combination " severity error;

    end process;



end Behavioral;
