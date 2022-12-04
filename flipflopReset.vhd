library ieee;
use ieee.std_logic_1164.all;

entity flipflopReset is
	port(d,ck,reset: in std_logic; q,qbar: out std_logic);
end flipflopReset;

architecture dataflowFFR of flipflopReset is
	begin
		process(d,ck,reset)
			begin
				if reset = '1'then
					q <= '0';
					qBar <= '1';
				elsif ck'event and ck = '1' then
					q <= d;
					qbar <= not d;
				end if;
		end process;
end dataflowFFR;