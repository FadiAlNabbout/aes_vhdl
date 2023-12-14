----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/06/2023 10:21:25 AM
-- Design Name: 
-- Module Name: ShiftRows - Behavioral
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

entity ShiftRows is
    Port ( input3 : in STD_LOGIC_VECTOR (127 downto 0);
           output3 : out STD_LOGIC_VECTOR (127 downto 0));
end ShiftRows;

architecture Behavioral of ShiftRows is

begin
--process
  --  begin
--        -- First column (no shift)
        output3(7 downto 0) <= input3(39 downto 32);
        output3(15 downto 8) <= input3(79 downto 72);
        output3(23 downto 16) <= input3(119 downto 112);
        output3(31 downto 24) <= input3(31 downto 24);
        

        -- Second column (shift left by 1 position)
        output3(39 downto 32) <= input3(71 downto 64);
        output3(47 downto 40) <= input3(111 downto 104);
        output3(55 downto 48) <= input3(23 downto 16);
        output3(63 downto 56) <= input3(63 downto 56);

        -- Third column (shift left by 2 positions)
        output3(71 downto 64) <= input3(103 downto 96);
        output3(79 downto 72) <= input3(15 downto 8);
        output3(87 downto 80) <= input3(55 downto 48);
        output3(95 downto 88) <= input3(95 downto 88);

        -- Fourth column (shift left by 3 positions)
        output3(103 downto 96) <= input3(7 downto 0);
        output3(111 downto 104) <= input3(47 downto 40);
        output3(119 downto 112) <= input3(87 downto 80);
        output3(127 downto 120) <= input3(127 downto 120);
--    --end process;



end Behavioral;
