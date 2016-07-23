library ieee;
use ieee.std_logic_1164.all;

entity ComponenteMUX4_1 is 
port( 
	A,B, C, D: in std_logic_vector(15 downto 0);
     S: in std_logic_vector(1 downto 0);
     O: out std_logic_vector(15 downto 0)
	  );

end ComponenteMUX4_1;

Architecture arq of ComponenteMUX4_1 is
Begin

	Process(S,A,B, C, D)
	variable temp : std_logic_vector(15 downto 0);            
	Begin
		if S="00" then
			temp:=A;
		elsif S="01" then                   
			temp:=B;
		elsif S="10" then                   
			temp:=C;
		elsif S="11" then                   
			temp:=D;
		end if;                                 

	O<=temp;                        
	end Process;
end arq; 
