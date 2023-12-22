library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Controller is
    Port ( clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           rconst : out std_logic_vector(3 downto 0);
           final_round : out STD_LOGIC;
           done : out STD_LOGIC);
end Controller;


architecture Behavioral of Controller is

component reg is 
    generic(size : positive);
    Port ( clk : in STD_LOGIC;
           d : in STD_LOGIC_VECTOR (size - 1 downto 0);
           q : out STD_LOGIC_VECTOR (size - 1 downto 0));
end component;

component counter is 
    Port ( input : in STD_LOGIC_VECTOR (3 downto 0);
           output : out STD_LOGIC_VECTOR (3 downto 0));
end component;

signal reg_input, reg_output, feedback : std_logic_vector(3 downto 0);
begin
    reg_input <=  x"0" when rst = '0' else feedback;
    uut : reg generic map(size => 4) port map(clk => clk, d => reg_input, q => reg_output);
    uut2 : counter port map( input => reg_output, output => feedback);
    
    rconst <= reg_output;
    final_round <= '1' when reg_output = "1001" else '0';
    done  <= '1' when reg_output = "1010" else '0';
end Behavioral;