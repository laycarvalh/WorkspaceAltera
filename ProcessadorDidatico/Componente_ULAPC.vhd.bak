library ieee;
use ieee.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_signed.all;

entity Componente_ULA is 
port( 
	A,B: in std_logic_vector(15 downto 0);
   ULA_OP: in std_logic_vector(2 downto 0);
   O: out std_logic_vector(15 downto 0)
	);

end Componente_ULA;

Architecture arq of Componente_ULA is
Begin
	O <= A + B when ULA_OP = "000" else
		A - B when ULA_OP = "001" else	
		A and B when ULA_OP = "010" else
		A or B when ULA_OP = "011" else
		not A when ULA_OP = "100" else
		A when ULA_OP = "101";
end arq; 
