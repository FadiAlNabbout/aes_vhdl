library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


entity KeySchedule is
    Port ( clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           round_const : in STD_LOGIC_VECTOR(3 downto 0);
           round_key : out STD_LOGIC_VECTOR(127 downto 0));
end KeySchedule;



architecture Behavioral of KeySchedule is

component reg is 
    generic(size : positive);
    Port ( clk : in STD_LOGIC;
           d : in STD_LOGIC_VECTOR (size - 1 downto 0);
           q : out STD_LOGIC_VECTOR (size - 1 downto 0));
end component;


    type KeyArray is array (0 to 10) of STD_LOGIC_VECTOR(127 downto 0);
    signal keys : KeyArray := (
        -- Define your 10 keys here
        x"2b7e151628aed2a6abf7158809cf4f3c",
        x"a0fafe1788542cb123a339392a6c7605",
        x"f2c295f27a96b9435935807a7359f67f",
        x"3d80477d4716fe3e1e237e446d7a883b",
        x"ef44a541a8525b7fb671253bdb0bad00",
        x"d4d1c6f87c839d87caf2b8bc11f915bc",
        x"6d88a37a110b3efddbf98641ca0093fd",
        x"4e54f70e5f5fc9f384a64fb24ea6dc4f",
        x"ead27321b58dbad2312bf5607f8d292f",
        x"ac7766f319fadc2128d12941575c006e",
        x"d014f9a8c9ee2589e13f0cc8b6630ca6"
    );
begin
    process(clk)
    begin
        if rising_edge(clk) then
            round_key <= keys(TO_INTEGER(unsigned(round_const)));
        end if;
    end process;
end Behavioral;
