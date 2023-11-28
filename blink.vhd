library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity blink is
	port (
		clk : in STD_LOGIC;
		rst : in STD_LOGIC;
		leds : out STD_LOGIC_VECTOR (2 downto 0)
	);
end entity blink;

architecture a of blink is
	signal leds_reg : STD_LOGIC_VECTOR (2 downto 0) := "110";
	signal cont: INTEGER range 1 to 5_000_000 := 1;
begin
	process(clk, rst)
	begin
		if rst = '0' then
			leds_reg <= "110";
		elsif rising_edge(clk) then
			-- leds_reg <= leds_reg(1 downto 0) & leds_reg(2);
			if cont = 5_000_000 then
				cont <= 1;
				leds_reg <= leds_reg(1 downto 0) & leds_reg(2);
			else
				cont <= cont + 1;
			end if;
		end if;
	end process;
	leds <= leds_reg;
end architecture a;