library ieee;
use ieee.std_logic_1164.all;

entity flipflop is
	port(d,c9: in std_logic; q: out std_logic);
end flipflop;

architecture dataflowFF of flipflop is
	begin
		process(d,c9)
			begin
				if c9'event and c9 = '1' then
					q <= d;
				end if;
		end process;
end dataflowFF;