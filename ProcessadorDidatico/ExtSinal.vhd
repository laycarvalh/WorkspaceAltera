library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity ExtSinal is 
    port(
	    dataIn  :in  std_logic_vector(10 downto 0);
		dataOut :out std_logic_vector(15 downto 0)
    );
end entity;

architecture behavior of ExtSinal is 

	begin
        process(dataIn) begin 
		    if( dataIn(10)='1') then
			    dataOut(10 downto 0)  <= dataIn(10 downto 0);
				dataOut(15 downto 11) <= "11111";
			else 
			    dataOut(10 downto 0)  <= dataIn(10 downto 0);
				dataOut(15 downto 11) <= "00000";
			end if;
		end process;
end architecture;