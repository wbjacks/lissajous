------------------------------------------------------------------------------------------
-- Data Controller
-- Will Jackson and Patrick Yukman
-- ENGS 31: Digital Electronics
-- Tuesday, August 28, 2012
--
-- Controls input from Analog-to-Digital Converter into the memory block
------------------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity datacontroller is
	port( clk50		: in  std_logic;
			serialD0	: in  std_logic;
			serialD1	: in  std_logic;
			isclk		: out std_logic;
			iCS		: out std_logic;
			memaddr	: out std_logic_vector(15 downto 0);
			color		: out std_logic_vector(0 downto 0)
		);
end datacontroller ; 

architecture behavioral of datacontroller  is
	type state_type is (idle,readADC,computeAddrP1,computeAddrP2);
	signal state 		: state_type := idle;
	signal dCount		: integer;
	signal newclk		: std_logic;
	signal a2dclkdiv	: integer;
	signal id0			: unsigned(11 downto 0);
	signal id1			: unsigned(11 downto 0);
	signal xint			: integer;
	signal yint			: integer;
	
begin
	
	isclk <= newclk;
	
	-- Clock divide to sync with A->D
	a2dclockdiv: process(clk50)
		begin
			if rising_edge(clk50) then
				if (a2dclkdiv = 3) then
					newclk <= not(newclk);
					a2dclkdiv <= 0;
				else
					a2dclkdiv <= a2dclkdiv + 1;
				end if;
			end if;
		end process a2dclockdiv;

	-- State updater for data controller
	state_logic: process(clk50)
		begin
			if rising_edge(clk50) then
				color <= "0";
				case state is
					
					-- Idle state: Wait for input
					when idle =>
						iCS <= '1';
						if ((a2dclkdiv = 3) and (newclk = '1')) then
							if (dCount = 15) then
								dCount <= 0;
								state <= readADC;
							else
								dCount <= dCount + 1;
								state <= idle;
							end if;
						else
							state <= idle;
						end if;
						
					-- Read: Take input from A->D, store in id signals
					when readADC =>
						iCS <= '0';
						if ((a2dclkdiv = 3) and (newclk = '1')) then
							if (dCount < 4) then
								dCount <= dCount + 1;
								state <= readADC;
							elsif ((dCount > 3) and (dCount < 16)) then
								dCount <= dCount + 1;
								id0(15 - dCount) <= serialD0;
								id1(15 - dCount) <= serialD1;
								state <= readADC;
							else
								dCount <= 0;
								state <= computeAddrP1;
							end if;
						else
							state <= readADC;
						end if;
						
					-- Compute: Caculate location in memory and store
					when computeAddrP1 =>
						color <= "1";
						xint <= to_integer(id0-639);
						yint <= to_integer(id1-639);
						state <= computeAddrP2;
					
					when computeAddrP2 =>
						color <= "1";
						memaddr <= std_logic_vector(
								to_unsigned(((yint/8))+
								(57600-((xint/8)*239)),16));
						state <= idle;
							
				end case;
			end if;
		end process state_logic;

end behavioral;
