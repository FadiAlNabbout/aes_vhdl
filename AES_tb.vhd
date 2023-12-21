----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/14/2023 01:51:18 PM
-- Design Name: 
-- Module Name: AES_tb - Behavioral
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

entity AES_tb is 
end AES_tb;

architecture Behavioral of AES_tb is

component AES
		port(
			clk        : in  std_logic;
			rst        : in  std_logic;
			input  : in  std_logic_vector(127 downto 0);
			output : out std_logic_vector(127 downto 0);
			done       : out std_logic;
			final       : out std_logic;
			counter       : out std_logic_vector(3 downto 0));
					
	end component AES;	
	-- Input signals
	signal clk : std_logic := '0';
	signal rst : std_logic := '0';
	signal input : std_logic_vector(127 downto 0);
	
	-- Output signals
	signal done : std_logic;
	signal output : std_logic_vector(127 downto 0);	
	signal final: std_logic;
	signal counter: std_logic_vector(3 downto 0);
	
	-- Clock period definition
	constant clk_period : time := 10 ns;
	
begin
	enc_inst : AES
		port map(
		clk    => clk, rst    => rst, input  => input, output => output, done   => done, final => final, counter => counter);	
	-- clock process definitions
	clk_process : process is
	begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
	end process clk_process;
	
	-- Simulation process
	sim_proc : process is
	begin
		-- Some test vectors taken from pages 215, and 216 of the main AES specification		
		--p = 3243f6a8885a308d313198a2e0370734
		--k = 2b7e151628aed2a6abf7158809cf4f3c		
		--c = 3925841d02dc09fbdc118597196a0b32
		-- Initialize Inputs
		input <= x"6BC1BEE22E409F96E93D7E117393172A";
		rst <= '0';
		-- Hold reset state for one cycle		
    	wait for clk_period * 1;
    	rst <= '1';
		wait until done = '1';
		wait for clk_period/2;
		if (output = x"85539F4136AD7E3A35407A244C60C16D") then
			report "---------- Passed ----------";
		else
			report "---------- Failed ----------";
		end if;
		report "---------- Output must be: -------";
		report "85539F4136AD7E3A35407A244C60C16D";
		--------------------------------------------
		-- Initialize Inputs
		--p = 00000000000000000000000000000000
		--k = 00000000000000000000000000000000
		--c = 66E94BD4EF8A2C3B884CFA59CA342B2E		
--		plaintext <= x"00000000000000000000000000000000";
--		key <= x"00000000000000000000000000000000";
--		rst <= '0';
--		-- Hold reset state for one cycle		
--		wait for clk_period * 1;
--		rst <= '1';
--		wait until done = '1';
--		wait for clk_period/2;			
--		if (ciphertext = x"2e2b34ca59fa4c883b2c8aefd44be966") then
--			report "---------- Passed ----------";
--		else
--			report "---------- Failed ----------";
--		end if;
--		report "---------- Output must be: -------";
--		report "2e2b34ca59fa4c883b2c8aefd44be966";
    end process sim_proc;
end Behavioral;
