library ieee;
use ieee.std_logic_1164.all;

entity TenBitCounter is
	port(clock:in std_logic; c9: out std_logic);
end entity;

architecture dataflowTBC of TenBitCounter is
	component flipflopReset
		port(d,ck,reset: in std_logic; q,qBar: out std_logic);
	end component;
	signal q,qBar: std_logic_vector(9 downto 0);
	signal reset: std_logic;
	begin
		reset <= '0';
		flipflopRst0: flipflopReset port map (qBar(0),clock,reset,q(0),qBar(0));
		flipflopRst1: flipflopReset port map (qBar(1),qBar(0),reset,q(1),qBar(1));
		flipflopRst2: flipflopReset port map (qBar(2),qBar(1),reset,q(2),qBar(2));
		flipflopRst3: flipflopReset port map (qBar(3),qBar(2),reset,q(3),qBar(3));
		flipflopRst4: flipflopReset port map (qBar(4),qBar(3),reset,q(4),qBar(4));
		flipflopRst5: flipflopReset port map (qBar(5),qBar(4),reset,q(5),qBar(5));
		flipflopRst6: flipflopReset port map (qBar(6),qBar(5),reset,q(6),qBar(6));
		flipflopRst7: flipflopReset port map (qBar(7),qBar(6),reset,q(7),qBar(7));
		flipflopRst8: flipflopReset port map (qBar(8),qBar(7),reset,q(8),qBar(8));
		flipflopRst9: flipflopReset port map (qBar(9),qBar(8),reset,q(9),qBar(9));
		c9 <= q(9);
end architecture;