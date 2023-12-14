----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/06/2023 12:18:24 PM
-- Design Name: 
-- Module Name: MixColumns_tb - Behavioral
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

entity MixColumns_tb is
--  Port ( );
end MixColumns_tb;

architecture Behavioral of MixColumns_tb is

component MixColumns is port(
input4 : in std_logic_vector(127 downto 0);
output4 : out std_logic_vector(127 downto 0));
end component;
signal input4, output4 : std_logic_vector(127 downto 0);
begin
uut : MixColumns port map( input4 => input4, output4 => output4);
stim : process
begin
    input4 <= X"09287F476F746ABF2C4A6204DA08E3EE";
    wait for 10 ns;
--    assert (output = X"40BFABF406EE4D3042CA6B997A5C5816")
--    report "test failed for input combination " severity error;

    end process;


end Behavioral;
