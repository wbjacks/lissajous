library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity datacontroller is
	port( clk50		: in  std_logic;
			serialD0	: in  std_logic;
			serialD1	: in  std_logic;
			inewclk	: in	std_logic;
			ia2dcdiv	: in	integer;
			iCS		: out std_logic;
			idata0	: out	unsigned(11 downto 0);
			idata1	: out	unsigned(11 downto 0)
		);
end datacontroller ; 

architecture behavioral of datacontroller  is
	type state_type is (idle,readD0,readD1);
	signal state 		: state_type := readD0;
	signal dCount		: integer := 0;
	
begin
	state_logic: process(clk50)
		begin
			if rising_edge(clk50) then
				
				case state is
					
					when idle =>
						iCS <= '1';
						if ((ia2dcdiv = 5) and (inewclk = '1')) then
							if (dCount = 15) then
								dCount <= 0;
								state <= readD0;
							else
								dCount <= dCount + 1;
								state <= idle;
							end if;
						else
							state <= idle;
						end if;
						
					when readD0 =>
						iCS <= '0';
						if ((ia2dcdiv = 5) and (inewclk = '1')) then
							if (dCount < 4) then
								dCount <= dCount + 1;
								state <= readD0;
							elsif ((dCount > 3) and (dCount < 16)) then
								dCount <= dCount + 1;
								idata0(15 - dCount) <= serialD0;
								state <= readD0;
							else
								dCount <= 0;
								state <= readD1;
							end if;
						else
							state <= readD0;
						end if;
							
					when readD1 =>
						iCS <= '1';
						if ((ia2dcdiv = 5) and (inewclk = '1')) then
							if (dCount < 4) then
								dCount <= dCount + 1;
								state <= readD1;
							elsif ((dCount > 3) and (dCount < 16)) then
								dCount <= dCount + 1;
								idata1(15 - dCount) <= serialD1;
								state <= readD1;
							else
								dCount <= 0;
								state <= idle;
							end if;
						else
							state <= readD1;
						end if;
							
				end case;
			end if;
		end process state_logic;

end behavioral;