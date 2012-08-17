--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   01:19:42 08/17/2012
-- Design Name:   
-- Module Name:   C:/Users/Administrator/Documents/GitHub/lissajous/test/VGA_test/timing_test.vhd
-- Project Name:  VGA_test
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: vga_controller
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY timing_test IS
END timing_test;
 
ARCHITECTURE behavior OF timing_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT vga_controller
    PORT(
         clk50 : IN  std_logic;
         vgaRed : OUT  std_logic_vector(2 downto 0);
         vgaGreen : OUT  std_logic_vector(2 downto 0);
         vgaBlue : OUT  std_logic_vector(1 downto 0);
         Hsync : OUT  std_logic;
         Vsync : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk50 : std_logic := '0';

 	--Outputs
   signal vgaRed : std_logic_vector(2 downto 0);
   signal vgaGreen : std_logic_vector(2 downto 0);
   signal vgaBlue : std_logic_vector(1 downto 0);
   signal Hsync : std_logic;
   signal Vsync : std_logic;

   -- Clock period definitions
   constant clk50_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: vga_controller PORT MAP (
          clk50 => clk50,
          vgaRed => vgaRed,
          vgaGreen => vgaGreen,
          vgaBlue => vgaBlue,
          Hsync => Hsync,
          Vsync => Vsync
        );

   -- Clock process definitions
   clk50_process :process
   begin
		clk50 <= '0';
		wait for clk50_period/2;
		clk50 <= '1';
		wait for clk50_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for clk50_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
