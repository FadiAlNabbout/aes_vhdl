----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/21/2023 01:25:43 PM
-- Design Name: 
-- Module Name: reg - Behavioral
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

entity reg is
    generic(size : positive);
    Port ( clk : in STD_LOGIC;
           d : in STD_LOGIC_VECTOR (size - 1 downto 0);
           q : out STD_LOGIC_VECTOR (size - 1 downto 0));
end reg;

architecture Behavioral of reg is
    signal current1, next1 : std_logic_vector(size - 1 downto 0);
begin
next1 <= d;
p1 : process(clk) is
begin
    if(clk'event and clk = '1') then
        current1 <= next1;
        end if;
    end process p1;

q <= current1;

end Behavioral;
