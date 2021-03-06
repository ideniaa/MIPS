--ChengZhi Zhao
--Idenia Ayala
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity data_memory is
	port(address :in std_logic_vector(31 downto 0);
	writeData :in std_logic_vector(31 downto 0);
	memR, memW, clk :in std_logic;
	readData :out std_logic_vector(31 downto 0));
end data_memory;

architecture behavior of data_memory is
type memory is array (0 to 15) of std_logic_vector(31 downto 0);
signal ram : memory := ( 		
		x"00000000", -- initialize data memory
		x"00000000",
		x"00000000",
		x"00000000",
		x"00000000",
		x"00000000",
		x"00000000",
		x"00000000",
		x"00000000",
		x"00000000",
		x"00000000",
		x"00000000",
		x"00000000",
		x"00000000",
		x"00000000",
		x"00000000"
	);

begin
	readData <= ram(to_integer(address(6 downto 2) when memR = '1' else x"00000000";

	memProcess : process(clk, address, writeData)
	begin
		if (clk'event  and clk = '0') then
			if (memW = '1') then
				ram(to_integer(address(6 downto 2))) <= writeData;
			end if;
		end if;
	end process memProcess;
end behavior;
