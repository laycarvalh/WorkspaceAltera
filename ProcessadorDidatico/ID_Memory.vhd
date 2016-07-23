LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY ID_Memory IS
	PORT(
	clock : IN STD_LOGIC; 	-- Clock
	Address_Mem : IN STD_LOGIC_VECTOR(15 DOWNTO 0); -- Endereço de
	In_Data : IN STD_LOGIC_VECTOR(15 DOWNTO 0); -- Endereço registrador Rj
	Write_In_Mem : IN STD_LOGIC; -- Habilitação de escrita em BancoReg
	Out_Data : OUT STD_LOGIC_VECTOR(15 DOWNTO 0) -- Registrador RJ
	);
END ID_Memory;

ARCHITECTURE Instruction_And_Data_Memory OF ID_Memory IS
BEGIN
	-- Utilizando o component altsyncram (Memoria Ram Sincrona da Altera)
	-- para implementar a memória do processador didático 
	memory: altsyncram -- Mapeamento dos genéricos, configurando a ram.
	GENERIC MAP (
		operation_mode => "SINGLE_PORT",
		-- Única porta de Leitura/Escrita.
		width_a => 16,
		-- Largura da palavra (número de bits).
		widthad_a => 10,
		-- Largura do endereço (número de bits).
		lpm_type => "altsyncram",
		-- Tipo do módulo da biblioteca parametrizada.
		outdata_reg_a => "UNREGISTERED",
		init_file => "programa.mif",
		-- Arquivo de inicialização da memoria.
		intended_device_family => "Cyclone"
		-- Família de FPGA para melhor síntese.
	)
	-- Mapeamento das portas, entradas e saÃdas.
	PORT MAP (
		wren_a => Write_In_Mem,
		-- Habilitar escrita. Leitura = '0' e Escrita = '1'.
		clock0 => clock,
		-- Memoria sincrona a subida do clock.
		address_a => Address_Mem(16 DOWNTO 0),
		-- Endereço de Leitura/Escrita
		data_a => In_Data(15 DOWNTO 0),
		-- Dado de entrada na memoria para escrita.
		q_a => Out_Data (15 DOWNTO 0)
		-- MDR, valor do endere¡o de memoria.
	);
END Instruction_And_Data_Memory;