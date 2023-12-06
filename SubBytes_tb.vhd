----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/06/2023 12:18:24 PM
-- Design Name: 
-- Module Name: SubBytes_tb - Behavioral
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


entity SubBytes_tb is
end SubBytes_tb;

architecture Behavioral of SubBytes_tb is
component SubBytes is port(
input2 : in std_logic_vector(127 downto 0);
output2 : out std_logic_vector(127 downto 0));
end component;
signal input2, output2 : std_logic_vector(127 downto 0);
begin
uut : SubBytes port map( input2 => input2, output2 => output2);
stim : process
begin
    input2 <= X"40BFABF406EE4D3042CA6B997A5C5816";
    wait for 10 ns;
--    assert (output = X"40BFABF406EE4D3042CA6B997A5C5816")
--    report "test failed for input combination " severity error;

    end process;

end Behavioral;
