library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity testbench is
end entity;

architecture testbench_arch of testbench is
constant count : positive := 100 ;
signal c9,Reset,w,Pushn,LEDn: std_logic;
signal Digit0, Digit1: std_logic_vector(3 downto 0);
begin
	dut : entity work.reactionTime(structure) port map(c9,Reset,w,Pushn,LEDn,Digit1,Digit0);
	process
		begin
		for i in 0 to count loop
			if i = 0 then
				c9 <= '0';
				Pushn <= '0';
				w <= '0';
				reset <= '1';
			end if;
			if i > 1 then
				reset <= '0';
				Pushn <= '1';
			end if;
			if (i = 5) or (i = 6) then
				w <= '1';
			else
				w <= '0';
			end if;
			if i >= 36 then
				Pushn <= '0';
			end if;
			wait for 5ms;
			c9 <= not c9;
		end loop;
		wait;
	end process;
end architecture;