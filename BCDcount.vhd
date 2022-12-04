library ieee;
use ieee.std_logic_1164.all;

entity BCDcount is
	port(Clock, Clear, E:in std_logic; BCD1, BCD0: buffer std_logic_vector(3 downto 0));
end BCDcount;

architecture dataflowBCD of BCDcount is
	component flipflopReset
		port(d,ck,reset: in std_logic; q,qBar: out std_logic);
	end component;
	signal qBar00,qBar01,qBar02,qBar03,qBar10,qBar11,qBar12,qBar13,enable: std_logic;
	signal reset0,reset1: std_logic;
	begin
		reset0 <= Clock and (Clear or (BCD0(3) and BCD0(1)));
		reset1 <= Clock and (Clear or (BCD1(3) and BCD1(1)));
		enable <= E and Clock;
		flipflopRst0: flipflopReset port map (qBar00,enable,reset0,BCD0(0),qBar00);
		flipflopRst1: flipflopReset port map (qBar01,qBar00,reset0,BCD0(1),qBar01);
		flipflopRst2: flipflopReset port map (qBar02,qBar01,reset0,BCD0(2),qBar02);
		flipflopRst3: flipflopReset port map (qBar03,qBar02,reset0,BCD0(3),qBar03);
		flipflopRst4: flipflopReset port map (qBar10,reset0,reset1,BCD1(0),qBar10);
		flipflopRst5: flipflopReset port map (qBar11,qBar10,reset1,BCD1(1),qBar11);
		flipflopRst6: flipflopReset port map (qBar12,qBar11,reset1,BCD1(2),qBar12);
		flipflopRst7: flipflopReset port map (qBar13,qBar12,reset1,BCD1(3),qBar13);
end dataflowBCD;