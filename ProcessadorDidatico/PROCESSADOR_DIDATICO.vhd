library ieee;
use ieee.std_logic_1164.all;

entity PROCESSADOR_DIDATICO is 
port( 
		A: in std_logic_vector(15 downto 0);
      S: in STD_LOGIC;
      O: out std_logic_vector(15 downto 0)
	  );

end PROCESSADOR_DIDATICO;

Architecture arq of PROCESSADOR_DIDATICO is

component Componente_PC
  port (
		PC : IN std_logic_vector(15 downto 0);
		O : OUT std_logic_vector(15 downto 0);
		wr, rst, clk : in STD_LOGIC 
		);
end component;

component Componente_ULAPC 
 port( 
		PC: in std_logic_vector(15 downto 0);
		O: out std_logic_vector(15 downto 0)
		);
end component;

signal sig_saidapc, sig_pcmaisum: std_logic_vector(15 downto 0);
signal sinal_rst, sinal_clk : STD_LOGIC;

Begin
	sig_pcmaisum <= A;
	G1 : Componente_PC port map (sig_pcmaisum, sig_saidapc, S, sinal_rst, sinal_clk);
	G2 : Componente_ULAPC port map (sig_saidapc, sig_pcmaisum);
	
end arq; 
