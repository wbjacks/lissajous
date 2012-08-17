library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;


entity vga_controller is
	port( 	clk50		: in  std_logic;
			vgaRed		: out std_logic_vector(2 downto 0);
			vgaGreen	: out std_logic_vector(2 downto 0);
			vgaBlue		: out std_logic_vector(1 downto 0);
			Hsync		: out std_logic;
			Vsync		: out std_logic

		);
end vga_controller;

architecture Structural of vga_controller is
	component vga_test_pattern
		port(
			row : IN std_logic_vector(9 downto 0);
			column : IN std_logic_vector(9 downto 0);          
			color : OUT std_logic_vector(7 downto 0)
		
			);
	end component;

	signal clk_count	: integer	:= 0;
	signal slow_clk		: std_logic	:= '0';
	signal x			: integer	:= 0;
	signal y			: integer	:= 0;
	signal pixel_x		: std_logic_vector(9 downto 0);
	signal pixel_y		: std_logic_vector(9 downto 0);
	signal col			: std_logic_vector(7 downto 0);
	
	constant h_fp		: integer	:= 15;
	constant v_fp		: integer	:= 2;

begin
	Inst_vga_test_pattern: vga_test_pattern
		port map(
			row => pixel_x,
			column => pixel_y,
			color => col
		);

	ClockDiv: process(clk50)
	begin
		if (rising_edge(clk50)) then
			slow_clk <= '0';
			if (clk_count = 1) then
				slow_clk <= '1';
				clk_count <= 0;
			
			else
				clk_count <= clk_count + 1;
			
			end if;
		end if;
	end process ClockDiv;
		
	
	VGAControl: process (clk50)
	begin
		if (rising_edge(clk50) AND risingslow_clk = '1') then
			-- Counters
			if (x = 800) then
				x <= 0;
				y <= y + 1;
				
			elsif (y = 521) then
				x <= 0;
				y <= 0;

			else
				x <= x + 1;

			end if;
	
		-- Color assign
			if (x < 640 AND y < 480) then
				vgaRed <= col(7 downto 5);
				vgaGreen <= col(4 downto 2);
				vgaBlue <= col(1 downto 0);
				
			else
				vgaRed <= "000";
				vgaGreen <= "000";
				vgaBlue <= "00";
	
			end if;
			
		end if;
	end process VGAControl;
	
	pixel_x <= std_logic_vector(to_unsigned(x, 10));
	pixel_y <= std_logic_vector(to_unsigned(y, 10));
	Hsync <=	'0' when (x > 703 AND x < 800) else
				'1';
	Vsync <=	'0' when (y > 517 AND y < 521) else
				'1';
				
end Structural; 