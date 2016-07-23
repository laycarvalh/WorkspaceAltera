library ieee;
use ieee.std_logic_1164.all;

entity Componente_MUX3_1 is 
port( 
	A,B, C: in std_logic_vector(15 downto 0);
     S: in std_logic_vector(1 downto 0);
     O: out std_logic_vector(15 downto 0)
	  );

end Componente_MUX3_1;

Architecture arq of Componente_MUX3_1 is
Begin

	Process(S,A,B, C)
	variable temp : std_logic_vector(15 downto 0);            
	Begin
		if S="00" then
			temp:=A;
		elsif S="01" then                   
			temp:=B;
		elsif S="10" then                   
			temp:=C;
		end if;                                 

	O<=temp;                        
	end Process;
end arq; 
