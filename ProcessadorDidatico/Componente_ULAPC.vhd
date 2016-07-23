library ieee;
use ieee.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_signed.all;

entity Componente_ULAPC is 
port( 
	PC: in std_logic_vector(15 downto 0);
   O: out std_logic_vector(15 downto 0)
	);
end Componente_ULAPC;

Architecture arq of Componente_ULAPC is
Begin
	O <= PC + "0000000000000001";
end arq; 
