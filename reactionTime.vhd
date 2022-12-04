library ieee;
use ieee.std_logic_1164.all;

entity reactionTime is
	port(c9,Reset,w,Pushn: in std_logic; LEDn: out std_logic;
	--Digit0, Digit1: buffer std_logic_vector(1 to 7));
	BCD1, BCD0: buffer std_logic_vector(3 downto 0));
end reactionTime;

architecture structure of reactionTime is
	component BCDcount
		port(Clock, Clear, E:in std_logic; BCD1, BCD0: buffer std_logic_vector(3 downto 0));
	end component;
	component seg7
		port(bcd: in std_logic_vector(3 downto 0); leds: out std_logic_vector(1 to 7));
	end component;
	component flipflopReset
		port(d,ck,reset: in std_logic; q,qbar: out std_logic);
	end component;
	signal LED,ymux,din: std_logic;
	--signal BCD1,BCD0: std_logic_vector(3 downto 0);
	begin
		ymux <= (LED and (not w)) or (w);
		din <= Pushn and ymux;
		LEDn <= not LED;
		flipflop0: flipflopReset port map (din,c9,'0',LED);
		BCDcount0: BCDcount port map (c9,Reset,LED,BCD1,BCD0);
		--seg0: seg7 port map (BCD0,Digit0);
		--seg1: seg7 port map (BCD1,Digit1);
end structure;