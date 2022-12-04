library ieee;
use ieee.std_logic_1164.all;

entity seg7 is
	port(bcd: in std_logic_vector(3 downto 0); leds: out std_logic_vector(1 to 7));
end seg7;

architecture dataflowS7 of seg7 is
	begin	
		leds(1) <= bcd(3) or bcd(1) or (bcd(2) xnor bcd(0));
		leds(2) <= (not bcd(2)) or (bcd(1) xnor bcd(0));
		leds(3) <= (not bcd(1)) or bcd(0) or bcd(2);
		leds(4) <= bcd(3) or ((not bcd(2)) and bcd(1)) or (bcd(1) and (not bcd(0))) or ((not bcd(2)) and (not bcd(0)));
		leds(5) <= ((not bcd(2)) and (not bcd(0))) or (bcd(1) and (not bcd(0)));
		leds(6) <= bcd(3) or (bcd(2) and ((not bcd(1)) or (not bcd(0)))) or ((not bcd(1)) and (not bcd(0)));
		leds(7) <= bcd(3) or (bcd(2) xor bcd(1)) or (bcd(2) and (not bcd(0)));
end dataflowS7;