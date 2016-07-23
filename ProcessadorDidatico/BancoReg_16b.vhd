LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY BancoReg_16b IS
	PORT(
	clock, reset : IN STD_LOGIC;
	-- Clock e o reset asíncrono
	Address_RI : IN STD_LOGIC_VECTOR(3 DOWNTO 0); -- Endereço registrador Ri
	Address_RJ : IN STD_LOGIC_VECTOR(3 DOWNTO 0); -- Endereço registrador Rj
	Address_WR : IN STD_LOGIC_VECTOR(3 DOWNTO 0); -- Endereço de escrita
	Data_To_BReg : IN STD_LOGIC_VECTOR(15 DOWNTO 0); -- Dado a ser escrito
	Write_In_BancoReg : IN STD_LOGIC; -- Habilitação de escrita em BancoReg
	Register_RI : OUT STD_LOGIC_VECTOR(15 DOWNTO 0); -- Registrador Ri
	Register_RJ : OUT STD_LOGIC_VECTOR(15 DOWNTO 0) -- Registrador RJ…..
	);
END BancoReg_16b;

ARCHITECTURE REGISTER_FILE OF BancoReg_16b IS
-- Definição do tipo BANKREG .
TYPE BANKREG is array(0 to 15) of STD_LOGIC_VECTOR(15 DOWNTO 0); -- Tipo array de vetores
-- Instanciação do banco de registradores
SIGNAL bank_register : BANKREG;-- Banco de registradores
-- Instanciação dos registradores Ri e Rj
SIGNAL RI_Register : STD_LOGIC_VECTOR(15 DOWNTO 0); -- Registrador Ri
SIGNAL RJ_Register : STD_LOGIC_VECTOR(15 DOWNTO 0); -- Registrador Rj
BEGIN
	PROCESS (clock, reset)
	BEGIN -- Leitura do banco de registradores
		IF reset = '1' THEN 	-- Reset assincrono de Ri e RJ.
			RI_Register(15 DOWNTO 0) <= "0000000000000000";-- A princípio bastava resetar este aqui, mas receptei todos
			Register_RJ(15 DOWNTO 0) <= "0000000000000000";
			bank_register(0)(15 DOWNTO 0) <= "0000000000000000";-- A princípio bastava resetar este, mas receptei todos
			bank_register(1)(15 DOWNTO 0) <= "0000000000000000";
			bank_register(2)(15 DOWNTO 0) <= "0000000000000000";
			bank_register(3)(15 DOWNTO 0) <= "0000000000000000";
			bank_register(4)(15 DOWNTO 0) <= "0000000000000000";
			bank_register(6)(15 DOWNTO 0) <= "0000000000000000";
			bank_register(7)(15 DOWNTO 0) <= "0000000000000000";
			bank_register(8)(15 DOWNTO 0) <= "0000000000000000";
			bank_register(9)(15 DOWNTO 0) <= "0000000000000000";
			bank_register(10)(15 DOWNTO 0) <= "0000000000000000";
			bank_register(11)(15 DOWNTO 0) <= "0000000000000000";
			bank_register(12)(15 DOWNTO 0) <= "0000000000000000";
			bank_register(13)(15 DOWNTO 0) <= "0000000000000000";
			bank_register(14)(15 DOWNTO 0) <= "0000000000000000";
			bank_register(15)(15 DOWNTO 0) <= "0000000000000000";
		ELSIF (clock'EVENT AND clock = '1') THEN-- Se Reset = '0' e clock sobe então
			RI_Register(15 DOWNTO 0) <= bank_register(conv_integer(Address_RI(3 DOWNTO 0)))(15 DOWNTO 0);
			RJ_Register(15 DOWNTO 0) <= bank_register(conv_integer(Address_RJ(3 DOWNTO 0)))(15 DOWNTO 0);
		ELSE
			RI_Register(15 DOWNTO 0) <= RI_Register(15 DOWNTO 0);
			RJ_Register(15 DOWNTO 0) <= RJ_Register(15 DOWNTO 0);
		END IF;
		-- Escrita no banco
		IF (Write_In_BancoReg = '1') THEN
			IF (clock'EVENT AND clock = '1') THEN
				IF (Address_WR(3 DOWNTO 0)) = "0000" THEN
					bank_register(0)(15 DOWNTO 0) <= "00000000000000000000000000000000";
				ELSE
				bank_register(conv_integer(Address_WR(3 DOWNTO 0)))(15 DOWNTO 0) <= Data_To_BReg(15 DOWNTO 0);
				END IF;
			END IF;
		END IF;
		Register_RI(15 DOWNTO 0) <= RI_Register (15 DOWNTO 0);
		Register_RJ(15 DOWNTO 0) <= RJ_Register (15 DOWNTO 0);
	END PROCESS;
END REGISTER_FILE;
