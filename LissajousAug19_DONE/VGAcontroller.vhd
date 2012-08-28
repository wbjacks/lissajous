------------------------------------------------------------------------------------------
-- VGA Controller
-- Will Jackson and Patrick Yukman
-- ENGS 31: Digital Electronics
-- Tuesday, August 28, 2012
--
-- Controls output to a 640x480 VGA Monitor
------------------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity VGAcontroller is
	port (	clk50		: in  std_logic;
			ivgaGreen	: in  std_logic;
			ihsync		: out std_logic;
			ivsync		: out std_logic;
			ired		: out std_logic_vector (2 downto 0);
			igreen		: out std_logic_vector (2 downto 0);
			iblue		: out std_logic_vector (1 downto 0);
			memaddr		: out std_logic_vector (15 downto 0);
			set0		: out std_logic_vector (0 downto 0)

		);
end VGAcontroller;

architecture Behavioral of VGAcontroller is
	signal clkdivcount	: unsigned(0 downto 0);
	signal slowCE		: std_logic;
	signal hcount		: unsigned (9 downto 0);
	signal vcount		: unsigned (9 downto 0);
	signal colorin		: std_logic_vector(7 downto 0);
	signal x			: unsigned (9 downto 0);
	signal y			: unsigned (9 downto 0);
	signal frameCount	: unsigned (0 downto 0);
	constant CGREEN		: std_logic_vector(7 downto 0) := "00011100";
	constant WHITE		: std_logic_vector(7 downto 0) := "11011011";
	constant BLACK		: std_logic_vector(7 downto 0) := "00000000";

begin

-- Persistently set color
ired 	<= colorin (7 downto 5);
igreen	<= colorin (4 downto 2);
iblue	<= colorin (1 downto 0);

-- Sync with VGA
ClockDivider: process(clk50)
	begin
		if (rising_edge(clk50)) then
			clkdivcount <= clkdivcount+1;
		end if;
	end process ClockDivider;

slowCE <= '1' when clkdivcount = "1" else '0';
	
-- Counters for pixel writing cycle
HandVcount: process (clk50)
	begin
		if rising_edge(clk50) then
			if slowCE = '1' then
				if (hcount < 799) then
					hcount <= hcount+1;
				elsif (hcount = 799) then
					hcount <= "0000000000";
						if (vcount < 520) then 
							vcount <= vcount+1;
						else 
							vcount <="0000000000";
							frameCount <= frameCount+1;
						end if;
				end if;
			else 
				hcount <= hcount;
				vcount <= vcount;
			end if;
		end if;
	end process HandVcount;			

-- Sync pulses for VGA display
HandVsync: process(hcount,vcount)
	begin
		if (hcount > 655) and (hcount < 752) then
			ihsync <= '0';
		else 
			ihsync <= '1';
		end if;

		if (vcount > 518) and (vcount < 522) then
			ivsync <= '0';
		else 
			ivsync <= '1';
		end if;
end process HandVsync;

-- Grab write data from memory with magic algorithim
x <= ((hcount+1)/2)-1;
y <= ((vcount+1)/2)-1;
memaddr <= std_logic_vector((x-39)+(y*239));

-- Color screen
Pattern: process (x,y,frameCount,ivgaGreen)

	begin
		set0 <= "0";
		if (x < 40) or (x > 280) then
			colorin <= BLACK;
		elsif ((x = 160) or (y = 120)) and (y < 240) then
			colorin <= WHITE;
		else
			if (frameCount = 1) then
				set0 <= "1";
				colorin <= BLACK;
			else
				colorin <= "000" & ivgaGreen & ivgaGreen & ivgaGreen & "00";
			end if;
		end if;
	
	end process Pattern;

end Behavioral;
