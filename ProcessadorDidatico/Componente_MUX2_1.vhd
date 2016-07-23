library ieee;
use ieee.std_logic_1164.all;

entity Componente_MUX2_1 is 
port( 
	A,B: in std_logic_vector(15 downto 0);
     S: in bit;
     O: out std_logic_vector(15 downto 0)
	  );

end Componente_MUX2_1;

Architecture arq of Componente_MUX2_1 is
Begin

	Process(S,A,B)
	variable temp : std_logic_vector(15 downto 0);            
	Begin
		if S='0' then
			temp:=A;

		elsif S='1' then                   
			temp:=B;
		end if;                                 

	O<=temp;                        
	end Process;
end arq; 
