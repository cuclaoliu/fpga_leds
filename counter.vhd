library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity counter is
	generic
	(
		WIDTH : natural := 6
	);
	port
	(
		clk,clrn  : in std_logic;
		q		  : out std_logic_vector(WIDTH-1 downto 0)
	);

end entity;

architecture rtl of counter is
	signal   cnt		   : std_logic_vector(WIDTH-1 downto 0);
	constant	MAX_VALUE  : std_logic_vector(WIDTH-1 downto 0) := (others=>'1');
begin

	process (clk,clrn)
	begin
		if clrn = '0' then
			cnt <= (others=>'0');
		elsif (rising_edge(clk)) then
			if cnt < MAX_VALUE then
				cnt <= cnt + 1;
			else
				cnt <= (others=>'0');
			end if;
		end if;
	end process;
	q <= cnt;

end rtl;
