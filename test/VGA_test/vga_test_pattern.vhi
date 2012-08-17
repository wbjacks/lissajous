
-- VHDL Instantiation Created from source file vga_test_pattern.vhd -- 00:07:45 08/17/2012
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT vga_test_pattern
	PORT(
		row : IN std_logic_vector(9 downto 0);
		column : IN std_logic_vector(9 downto 0);          
		color : OUT std_logic_vector(7 downto 0)
		);
	END COMPONENT;

	Inst_vga_test_pattern: vga_test_pattern PORT MAP(
		row => ,
		column => ,
		color => 
	);


