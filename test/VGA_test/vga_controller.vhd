library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity vga_controller is
	port( 	clk50		: in  std_logic;
			col			: in  std_logic_vector(7 downto 0);
			vgaRed		: out std_logic_vector(2 downto 0);
			vgaGreen	: out std_logic_vector(2 downto 0);
			vgaBlue		: out std_logic_vector(1 downto 0);
			pixel_x		: out std_logic_vector(9 downto 0);
			pixel_y		: out std_logic_vector(9 downto 0);
			Hsync		: out std_logic;
			Vsync		: out std_logic

		);
end vga_controller;

architecture Behavioral of vga_controller is
	signal clk_count	: integer;
	signal slow_clk		: std_logic;
	signal x			: integer;
	signal y			: integer;
	signal vdown		: std_logic;
	signal hdown		: std_logic;
	
	constant h_fp		: integer	:= 1;
	constant v_fp		: integer	:= 2;

begin

	ClockDiv: process(clk50)
	begin
		if (rising_edge(clk50)) then
			if (clk_count = 1) then
				slow_clk <= '1';
				clk_count <= 0;
			
			else
				clk_count <= 1;
			
			end if;
		end if;
	end process ClockDiv;
		
	
	VGAControl: process (clk50)
	begin
		if (rising_edge(clk50) AND slow_clk = '1') then
			-- Counters
			if (x = 799) then
				x <= 0;
				y <= y + 1;
				
			elsif (x = h_fp + 640) then
				x <= x + 1;
				
			else
				x <= x + 1;
				
			end if;
	
			-- Values
			if (x > h_fp AND x < (h_fp + 640)) then
				vgaRed <= col(7 downto 5);
				vgaGreen <= col(4 downto 2);
				vgaBlue <= col(1 downto 0);
	
			end if;
			pixel_x <= std_logic_vector(x);
			pixel_y <= std_logic_vector(y);
			
		end if;
	end process VGAControl;
	
	Hsync <=	'0' when (x >= h_fp + 640) else
				'1';
	Vsync <=	'0' when (y >= v_fp + 480) else
				'1';
				
end Behavioral; 