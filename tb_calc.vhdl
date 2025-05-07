library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_calc is
end tb_calc;

architecture arc of tb_calc is
    signal clk : std_logic := '0'; -- sinal de clock inicializado
    signal n1, n2 : std_logic_vector(7 downto 0);
    signal n3 : std_logic_vector(1 downto 0);
    signal r : std_logic_vector(7 downto 0);
begin
    uut: entity work.calc
        port map (
            clk => clk,
            n1 => n1,
            n2 => n2,
            n3 => n3,
            r => r
        );
    clk_process : process
    begin 
        while true loop
            clk <= '0';
            wait for 5 ns;
            clk <= '1';
            wait for 5 ns;
        end loop;
    end process;

    stim_proc: process
    begin 
         
        wait until rising_edge(clk); -- espera bater o clock para mudar o sinal
        --soma
        n1 <= "00000011"; -- 3
        n2 <= "00000101"; -- 5
        n3 <= "01";

        wait until rising_edge(clk);

        --subtração
        n1 <= "00000101"; -- 5
        n2 <= "00000011"; -- 3
        n3 <= "10";

        wait until rising_edge(clk);

        --multiplicação
        n1 <= "00000010"; -- 2
        n2 <= "00000101"; -- 5
        n3 <= "11";

        wait until rising_edge(clk);
    
        wait;
    end process;
end architecture arc;
