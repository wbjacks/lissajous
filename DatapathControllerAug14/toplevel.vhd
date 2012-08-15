library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity toplevel is
	port( clk50		: in  std_logic;
			D0			: in  std_logic;
			D1			: in 	std_logic;
			CS			: out std_logic;
			Sclk		: out std_logic
		);
end toplevel; 

architecture structural of toplevel is
	
	component datacontroller is
		port( clk50 	: IN std_logic;
				serialD0 : IN std_logic;
				serialD1 : IN std_logic;
				inewclk	: IN std_logic;
				ia2dcdiv	: IN integer;
				iCS 		: OUT std_logic;
				idata0	: OUT	unsigned(11 downto 0);
				idata1	: OUT unsigned(11 downto 0)
			);
	end component;

	signal a2dclkdiv	: integer := 0;
	signal data0		: unsigned(11 downto 0) := "000000000000";
	signal data1		: unsigned(11 downto 0) := "000000000000";
	signal newclk		: std_logic := '0';
	
begin
	
	Sclk <= newclk;

	U0: datacontroller
	 port map( 	clk50		=> clk50,
					serialD0 => D0,
					serialD1 => D1,
					inewclk	=> newclk,
					ia2dcdiv	=> a2dclkdiv,
					iCS 		=> CS,
					idata0	=>	data0,
					idata1	=> data1
				);
	
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
	
end structural;