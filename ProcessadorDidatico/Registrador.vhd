library ieee;
use ieee.std_logic_1164.all;

entity Registrador is
    port
    (
        ck, rst: in std_logic;
        A: in  std_logic_vector(15 downto 0);
        O: out std_logic_vector(15 downto 0)
    );
end Registrador;

architecture regn of Registrador is
begin
    process(ck, rst)
    begin
        if rst = '1' then
            O <= (others => '0');
        elsif ck'event and ck = '0' then
            O <= A; 
        end if;
    end process;
end regn;
