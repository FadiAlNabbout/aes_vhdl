----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/06/2023 10:21:25 AM
-- Design Name: 
-- Module Name: MixColumns - Behavioral
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

entity MixColumns is
    Port ( input4 : in STD_LOGIC_VECTOR (127 downto 0);
           output4 : out STD_LOGIC_VECTOR (127 downto 0));
end MixColumns;

architecture Behavioral of MixColumns is

component LUT_mul2 is port(
byte_in : in STD_LOGIC_VECTOR (7 downto 0);
byte_out : out STD_LOGIC_VECTOR (7 downto 0));
end component;

component LUT_mul3 is port(
byte_in : in STD_LOGIC_VECTOR (7 downto 0);
byte_out : out STD_LOGIC_VECTOR (7 downto 0));
end component;

-- Original signals
signal res_2_00: std_logic_vector(7 downto 0);
signal res_3_00: std_logic_vector(7 downto 0);

-- Duplicated signals
signal res_2_01: std_logic_vector(7 downto 0);
signal res_2_02: std_logic_vector(7 downto 0);
signal res_2_03: std_logic_vector(7 downto 0);
signal res_2_04: std_logic_vector(7 downto 0);
signal res_2_05: std_logic_vector(7 downto 0);
signal res_2_06: std_logic_vector(7 downto 0);
signal res_2_07: std_logic_vector(7 downto 0);
signal res_2_08: std_logic_vector(7 downto 0);
signal res_2_09: std_logic_vector(7 downto 0);
signal res_2_10: std_logic_vector(7 downto 0);
signal res_2_11: std_logic_vector(7 downto 0);
signal res_2_12: std_logic_vector(7 downto 0);
signal res_2_13: std_logic_vector(7 downto 0);
signal res_2_14: std_logic_vector(7 downto 0);
signal res_2_15: std_logic_vector(7 downto 0);

signal res_3_01: std_logic_vector(7 downto 0);
signal res_3_02: std_logic_vector(7 downto 0);
signal res_3_03: std_logic_vector(7 downto 0);
signal res_3_04: std_logic_vector(7 downto 0);
signal res_3_05: std_logic_vector(7 downto 0);
signal res_3_06: std_logic_vector(7 downto 0);
signal res_3_07: std_logic_vector(7 downto 0);
signal res_3_08: std_logic_vector(7 downto 0);
signal res_3_09: std_logic_vector(7 downto 0);
signal res_3_10: std_logic_vector(7 downto 0);
signal res_3_11: std_logic_vector(7 downto 0);
signal res_3_12: std_logic_vector(7 downto 0);
signal res_3_13: std_logic_vector(7 downto 0);
signal res_3_14: std_logic_vector(7 downto 0);
signal res_3_15: std_logic_vector(7 downto 0);


begin

-- calculate the value for b00
uut : LUT_mul2 port map( byte_in => input4(127 downto 120), byte_out => res_2_00);
uut2 :LUT_mul3 port map( byte_in => input4(119 downto 112), byte_out => res_3_00);
output4(127 downto 120) <= res_2_00 xor res_3_00 xor input4(111 downto 104) xor input4(103 downto 96); 

-- calculate the value for b10
uut3 : LUT_mul2 port map( byte_in => input4(119 downto 112), byte_out => res_2_01);
uut4 : LUT_mul3 port map( byte_in => input4(111 downto 104), byte_out => res_3_01);
output4(119 downto 112) <= res_2_01 xor res_3_01 xor input4(127 downto 120) xor input4(103 downto 96); 

-- calculate the value for b20
uut5 : LUT_mul2 port map( byte_in => input4(111 downto 104), byte_out => res_2_02);
uut6 : LUT_mul3 port map( byte_in => input4(103 downto 96), byte_out => res_3_02);
output4(111 downto 104) <= res_2_02 xor res_3_02 xor input4(127 downto 120) xor input4(119 downto 112); 

-- calculate the value for b30
uut7 : LUT_mul2 port map( byte_in => input4(103 downto 96), byte_out => res_2_03);
uut8 : LUT_mul3 port map( byte_in => input4(127 downto 120), byte_out => res_3_03);
output4(103 downto 96) <= res_2_03 xor res_3_03 xor input4(119 downto 112) xor input4(111 downto 104); 

-- calculate the value for b01
uut9 : LUT_mul2 port map( byte_in => input4(95 downto 88), byte_out => res_2_04);
uut10 : LUT_mul3 port map( byte_in => input4(87 downto 80), byte_out => res_3_04);
output4(95 downto 88) <= res_2_04 xor res_3_04 xor input4(79 downto 72) xor input4(71 downto 64);

-- calculate the value for b11
uut11 : LUT_mul2 port map( byte_in => input4(87 downto 80), byte_out => res_2_05);
uut12 : LUT_mul3 port map( byte_in => input4(79 downto 72), byte_out => res_3_05);
output4(87 downto 80) <= res_2_05 xor res_3_05 xor input4(95 downto 88) xor input4(71 downto 64);

-- calculate the value for b21
uut13 : LUT_mul2 port map( byte_in => input4(79 downto 72), byte_out => res_2_06);
uut14 : LUT_mul3 port map( byte_in => input4(71 downto 64), byte_out => res_3_06);
output4(79 downto 72) <= res_2_06 xor res_3_06 xor input4(87 downto 80) xor input4(95 downto 88);

-- calculate the value for b31
uut15 : LUT_mul2 port map( byte_in => input4(71 downto 64), byte_out => res_2_07);
uut16 : LUT_mul3 port map( byte_in => input4(95 downto 88), byte_out => res_3_07);
output4(71 downto 64) <= res_2_07 xor res_3_07 xor input4(79 downto 72) xor input4(87 downto 80);

-- calculate the value for b02
uut17 : LUT_mul2 port map( byte_in => input4(63 downto 56), byte_out => res_2_08);
uut18 : LUT_mul3 port map( byte_in => input4(55 downto 48), byte_out => res_3_08);
output4(63 downto 56) <= res_2_08 xor res_3_08 xor input4(47 downto 40) xor input4(39 downto 32);

-- calculate the value for b12
uut19 : LUT_mul2 port map( byte_in => input4(55 downto 48), byte_out => res_2_09);
uut20 : LUT_mul3 port map( byte_in => input4(47 downto 40), byte_out => res_3_09);
output4(55 downto 48) <= res_2_09 xor res_3_09 xor input4(63 downto 56) xor input4(39 downto 32);

-- calculate the value for b22
uut21 : LUT_mul2 port map( byte_in => input4(47 downto 40), byte_out => res_2_10);
uut22 : LUT_mul3 port map( byte_in => input4(39 downto 32), byte_out => res_3_10);
output4(47 downto 40) <= res_2_10 xor res_3_10 xor input4(55 downto 48) xor input4(63 downto 56);

-- calculate the value for b32
uut23 : LUT_mul2 port map( byte_in => input4(39 downto 32), byte_out => res_2_11);
uut24 : LUT_mul3 port map( byte_in => input4(63 downto 56), byte_out => res_3_11);
output4(39 downto 32) <= res_2_11 xor res_3_11 xor input4(47 downto 40) xor input4(55 downto 48);

-- calculate the value for b03
uut25 : LUT_mul2 port map( byte_in => input4(31 downto 24), byte_out => res_2_12);
uut26 : LUT_mul3 port map( byte_in => input4(23 downto 16), byte_out => res_3_12);
output4(31 downto 24) <= res_2_12 xor res_3_12 xor input4(15 downto 8) xor input4(7 downto 0);

-- calculate the value for b13
uut27 : LUT_mul2 port map( byte_in => input4(23 downto 16), byte_out => res_2_13);
uut28 : LUT_mul3 port map( byte_in => input4(15 downto 8), byte_out => res_3_13);
output4(23 downto 16) <= res_2_13 xor res_3_13 xor input4(31 downto 24) xor input4(7 downto 0);

-- calculate the value for b23
uut29 : LUT_mul2 port map( byte_in => input4(15 downto 8), byte_out => res_2_14);
uut30 : LUT_mul3 port map( byte_in => input4(7 downto 0), byte_out => res_3_14);
output4(15 downto 8) <= res_2_14 xor res_3_14 xor input4(23 downto 16) xor input4(31 downto 24);

-- calculate the value for b33
uut31 : LUT_mul2 port map( byte_in => input4(7 downto 0), byte_out => res_2_15);
uut32 : LUT_mul3 port map( byte_in => input4(31 downto 24), byte_out => res_3_15);
output4(7 downto 0) <= res_2_15 xor res_3_15 xor input4(15 downto 8) xor input4(23 downto 16);

end Behavioral;
