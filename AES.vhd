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
    Port ( clk: in std_logic;
           rst: in std_logic;
           input : in STD_LOGIC_VECTOR (127 downto 0);
           output : out STD_LOGIC_VECTOR (127 downto 0);
           final : out std_logic;
           done : out std_logic;
           counter: out std_logic_vector(3 downto 0));
end AES;

architecture Behavioral of AES is

signal reg_input : std_logic_vector(127 downto 0);
signal reg_output : std_logic_vector(127 downto 0);
signal subbox_input : std_logic_vector(127 downto 0);
signal subbox_output : std_logic_vector(127 downto 0);
signal shiftrows_output : std_logic_vector(127 downto 0);
signal mixcol_output : std_logic_vector(127 downto 0);
signal feedback : std_logic_vector(127 downto 0);
signal round_key : std_logic_vector(127 downto 0);
signal round_const : std_logic_vector(3 downto 0);
signal sel : std_logic;

component AddRoundKey is port(
input : in std_logic_vector(127 downto 0);
key : in std_logic_vector(127 downto 0);
output : out std_logic_vector(127 downto 0));
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

component Controller is
    Port ( clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           rconst : out STD_LOGIC_VECTOR (3 downto 0);
           final_round : out STD_LOGIC;
           done : out STD_LOGIC);
end component;

component reg is 
    generic(size : positive);
    Port ( clk : in STD_LOGIC;
           d : in STD_LOGIC_VECTOR (size - 1 downto 0);
           q : out STD_LOGIC_VECTOR (size - 1 downto 0));
end component;

component KeySchedule is
Port ( clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           round_const : in STD_LOGIC_VECTOR(3 downto 0);
           round_key : out STD_LOGIC_VECTOR(127 downto 0));
end component;

begin
reg_input <= input when rst = '0' else feedback;

uut : reg generic map(size => 128) port map(clk => clk, d => reg_input, q => reg_output);
 uut2: AddRoundkey port map(input => reg_output, key => round_key, output => subbox_input);
 uut3: SubBytes port map(input2 => subbox_input, output2 => subbox_output);
 uut4: ShiftRows port map(input3 => subbox_output, output3 => shiftrows_output);
 uut5: MixColumns port map(input4 => shiftrows_output, output4 => mixcol_output);

feedback <= mixcol_output when sel ='0' else shiftrows_output;
output <= mixcol_output;
final <= sel;
counter <= round_const;

uut6: Controller port map
    (clk => clk, rst => rst, rconst => round_const, final_round => sel, done => done);

uut7 : KeySchedule port map
    (clk => clk, rst => rst, round_const => round_const, round_key => round_key);	

end Behavioral;
