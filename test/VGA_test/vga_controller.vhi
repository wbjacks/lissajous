
-- VHDL Instantiation Created from source file vga_controller.vhd -- 23:45:33 08/16/2012
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT vga_controller
	PORT(
		clk50 : IN std_logic;
		col : IN std_logic_vector(7 downto 0);          
		vgaRed : OUT std_logic_vector(2 downto 0);
		vgaGreen : OUT std_logic_vector(2 downto 0);
		vgaBlue : OUT std_logic_vector(1 downto 0);
		pixel_x : OUT std_logic_vector(9 downto 0);
		pixel_y : OUT std_logic_vector(9 downto 0);
		Hsync : OUT std_logic;
		Vsync : OUT std_logic
		);
	END COMPONENT;

	Inst_vga_controller: vga_controller PORT MAP(
		clk50 => ,
		col => ,
		vgaRed => ,
		vgaGreen => ,
		vgaBlue => ,
		pixel_x => ,
		pixel_y => ,
		Hsync => ,
		Vsync => 
	);


