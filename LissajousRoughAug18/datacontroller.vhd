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
			data0		: out	unsigned(11 downto 0);
			data1		: out	unsigned(11 downto 0);
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
	
	a2dclockdiv: process(clk50)
		begin
			if rising_edge(clk50) then
				if (a2dclkdiv = 5) then
					newclk <= not(newclk);
					a2dclkdiv <= 0;
				else
					a2dclkdiv <= a2dclkdiv + 1;
				end if;
			end if;
		end process a2dclockdiv;

	state_logic: process(clk50)
		begin
			if rising_edge(clk50) then
				color <= "0";
				case state is
					
					when idle =>
						iCS <= '1';
						if ((a2dclkdiv = 5) and (newclk = '1')) then
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
						
					when readADC =>
						iCS <= '0';
						if ((a2dclkdiv = 5) and (newclk = '1')) then
							if (dCount < 4) then
								dCount <= dCount + 1;
								state <= readADC;
							elsif ((dCount > 3) and (dCount < 16)) then
								dCount <= dCount + 1;
								data0(15 - dCount) <= serialD0;
								id0(15 - dCount) <= serialD0;
								data1(15 - dCount) <= serialD1;
								id1(15 - dCount) <= serialD1;
								state <= readADC;
							else
								dCount <= 0;
								state <= computeAddrP1;
							end if;
						else
							state <= readADC;
						end if;
						
					when computeAddrP1 =>
						color <= "1";
						xint <= to_integer(id0 - 931);
						yint <= to_integer(id1 - 931);
						state <= computeAddrP2;
					
					
					when computeAddrP2 =>
						color <= "1";
						memaddr <= std_logic_vector(
								to_unsigned(((xint/8)+((yint/8)*240)),16));
						state <= idle;
							
				end case;
			end if;
		end process state_logic;

end behavioral;