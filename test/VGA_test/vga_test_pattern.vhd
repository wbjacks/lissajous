----------------------------------------------------------------------------------
-- Engineer:		J. Graham Keggi
-- 
-- Create Date:	15:10:36 07/12/2010 
-- Module Name:	vga_test_pattern - Behavioral
-- Target Device:	Spartan3E-500 Nexys2
--
-- Description:	Reads in current pixel X and Y as 2 10-bit vectors and supplys
--						an 8-bit color code consistent with the VGA test pattern
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity vga_test_pattern is
	port(row,column			: in std_logic_vector(9 downto 0);
		  color					: out std_logic_vector(7 downto 0));
end vga_test_pattern;

architecture Behavioral of vga_test_pattern is
	
	-- Predefined 8-bit colors that nearly match real test pattern colors
	constant RED		: std_logic_vector(7 downto 0) := "11100000";
	constant GREEN		: std_logic_vector(7 downto 0) := "00011100";
	constant BLUE		: std_logic_vector(7 downto 0) := "00000011";
	constant CYAN		: std_logic_vector(7 downto 0) := "00011111";
	constant YELLOW	: std_logic_vector(7 downto 0) := "11111100";
	constant PURPLE	: std_logic_vector(7 downto 0) := "11100011";
	constant WHITE		: std_logic_vector(7 downto 0) := "11011011";
	constant BLACK		: std_logic_vector(7 downto 0) := "00000000";
	constant GRAY0		: std_logic_vector(7 downto 0) := "01001001";
	constant GRAY1		: std_logic_vector(7 downto 0) := "10010010";
	constant DARK_BLU	: std_logic_vector(7 downto 0) := "00001010";
	constant DARK_PUR	: std_logic_vector(7 downto 0) := "01000010";

begin

	-- set the colors based on the current pixel
	process(row,column)
	begin
		-- large vertical color bands, evenly spaced horizontally, 320px vertically
		-- Gray, yellow, cyan, green, purple, red, blue
		if (column >= 0) and (column < 92) and (row >= 0) and (row < 320) then
			color <= GRAY1;
		elsif (column >= 92) and (column < 184) and (row >= 0) and (row < 320) then
			color <= YELLOW;
		elsif (column >= 184) and (column < 276) and (row >= 0) and (row < 320) then
			color <= CYAN;
		elsif (column >= 276) and (column < 368) and (row >= 0) and (row < 320) then
			color <= GREEN;
		elsif (column >= 368) and (column < 460) and (row >= 0) and (row < 320) then
			color <= PURPLE;
		elsif (column >= 460) and (column < 552) and (row >= 0) and (row < 320) then
			color <= RED;
		elsif (column >= 552) and (column <= 640) and (row >= 0) and (row < 320) then
			color <= BLUE;
			
		-- small colored rectangles from 320->360 pixels, evenly spaced horizontally
		-- blue, black, purple, black, cyan, black, gray
		elsif (column >= 0) and (column < 92) and (row >= 320) and (row < 360) then
			color <= BLUE;
		elsif (column >= 92) and (column < 184) and (row >= 320) and (row < 360) then
			color <= BLACK;
		elsif (column >= 184) and (column < 276) and (row >= 320) and (row < 360) then
			color <= PURPLE;
		elsif (column >= 276) and (column < 368) and (row >= 320) and (row < 360) then
			color <= BLACK;
		elsif (column >= 368) and (column < 460) and (row >= 320) and (row < 360) then
			color <= CYAN;
		elsif (column >= 460) and (column < 552) and (row >= 320) and (row < 360) then
			color <= BLACK;
		elsif (column >= 552) and (column <= 640) and (row >= 320) and (row < 360) then
			color <= GRAY1;
			
		-- bottom large blocks
		elsif (column >= 0) and (column < 114) and (row >= 360) and (row <= 480) then
			color <= DARK_BLU;
		elsif (column >=114) and (column < 228) and (row >= 360) and (row <= 480) then
			color <= WHITE;
		elsif (column >= 228) and (column < 342) and (row >= 360) and (row <= 480) then
			color <= DARK_PUR;
		elsif (column >= 342) and (column < 460) and (row >= 360) and (row <= 480) then
			color <= GRAY0;
		elsif (column >= 460) and (column < 491) and (row >= 360) and (row <= 480) then
			color <= BLACK;
		elsif (column >= 491) and (column < 521) and (row >= 360) and (row <= 480) then
			color <= GRAY0;
		elsif (column >= 521) and (column < 552) and (row >= 360) and (row <= 480) then
			color <= GRAY1;
		elsif (column >= 552) and (column <= 640) and (row >= 360) and (row <= 480) then
			color <= GRAY0;
			
		-- black for any gaps, shouldn't be any
		else
			color <= BLACK;
		end if;
	end process;

end Behavioral;

