library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity toplevel is
	port( clk50		: in  std_logic;
			D0			: in  std_logic;
			D1			: in 	std_logic;
			CS			: out std_logic;
			Sclk		: out std_logic;
			hsync		: out std_logic;
			vsync		: out std_logic;
			red		: out std_logic_vector (2 downto 0);
			green		: out std_logic_vector (2 downto 0);
			blue		: out std_logic_vector (1 downto 0)
		);
end toplevel; 

architecture structural of toplevel is
	
	component datacontroller is
		port( clk50 	: IN 	std_logic;
				serialD0 : IN 	std_logic;
				serialD1 : IN 	std_logic;
				isclk		: OUT	std_logic;
				iCS 		: OUT std_logic;
				memaddr	: OUT	std_logic_vector(15 downto 0);
				color 	: OUT std_logic_vector(0 downto 0)
			);
	end component;
	
	component VGAcontroller is
		port( clk50 	: IN 	std_logic;
				ivgaGreen: IN	std_logic;
				ihsync 	: OUT std_logic;
				ivsync 	: OUT std_logic;
				ired 		: OUT std_logic_vector(2 downto 0);
				igreen 	: OUT std_logic_vector(2 downto 0);
				iblue 	: OUT std_logic_vector(1 downto 0);
				memaddr	: OUT	std_logic_vector(15 downto 0);
				set0		: OUT std_logic_vector(0 downto 0)
			);
	end component;
	
	component VRAM is
		port( clka 		: IN 	STD_LOGIC;
				rsta 		: IN 	STD_LOGIC;
				wea 		: IN 	STD_LOGIC_VECTOR(0 DOWNTO 0);
				addra 	: IN 	STD_LOGIC_VECTOR(15 DOWNTO 0);
				dina 		: IN 	STD_LOGIC_VECTOR(0 DOWNTO 0);
				douta 	: OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
				clkb 		: IN 	STD_LOGIC;
				rstb 		: IN 	STD_LOGIC;
				web 		: IN 	STD_LOGIC_VECTOR(0 DOWNTO 0);
				addrb 	: IN 	STD_LOGIC_VECTOR(15 DOWNTO 0);
				dinb 		: IN 	STD_LOGIC_VECTOR(0 DOWNTO 0);
				doutb 	: OUT STD_LOGIC_VECTOR(0 DOWNTO 0)
			);
	end component;
	
	signal tophsync	: std_logic;
	signal topvsync	: std_logic;
	signal topred		: std_logic_vector(2 downto 0);
	signal topgreen	: std_logic_vector(2 downto 0);
	signal topblue		: std_logic_vector(1 downto 0);
	
	signal reset		: std_logic;
	signal WEA			: std_logic_vector(0 downto 0);
	signal WEB			: std_logic_vector(0 downto 0);
	signal Bzero		: std_logic_vector(0 downto 0);
	signal A_addr		: std_logic_vector(15 downto 0);
	signal B_addr		: std_logic_vector(15 downto 0);
	signal colorGreen	: std_logic_vector(0 downto 0);
	signal vgaGreen	: std_logic_vector(0 downto 0);
	
begin
	
	Bzero <= "0";
	WEA <= "1";

	U0: datacontroller
	port map( 	clk50		=> clk50,
					serialD0 => D0,
					serialD1 => D1,
					isclk		=> Sclk,
					iCS 		=> CS,
					memaddr	=> A_addr,
					color		=> colorGreen
				);
	
	U1: VGAcontroller
	port map(	clk50 => clk50,
					ivgaGreen => vgaGreen(0),
					ihsync => hsync,
					ivsync => vsync,
					ired => red,
					igreen => green,
					iblue => blue,
					memaddr => B_addr,
					set0 => WEB
				);
	
	U2: VRAM
	port map(	clka => clk50,
					rsta => reset,
					wea => WEA,
					addra => A_addr,
					dina => colorGreen,
					douta => open,
					clkb => clk50,
					rstb => reset,
					web => WEB,
					addrb => B_addr,
					dinb => Bzero,
					doutb => vgaGreen
				);
	
end structural;