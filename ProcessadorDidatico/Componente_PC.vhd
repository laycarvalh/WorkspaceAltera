LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY Componente_PC is
	PORT(
		PC : IN std_logic_vector(15 downto 0);
		O : OUT std_logic_vector(15 downto 0);
		wr, rst, clk : in STD_LOGIC 
	);
END Componente_PC;

ARCHITECTURE arq OF Componente_PC is
BEGIN
	PROCESS(wr,rst,clk)
	BEGIN
		if rst = '1' then
         O <= (others => '0');
      elsif clk'event and clk = '0' then
         if wr = '1' then
            O <= PC; 
         end if;
      end if;
	END PROCESS;
END arq;