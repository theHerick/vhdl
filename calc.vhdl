library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity calc is
    port (
        clk : in std_logic;
        n1, n2 : in std_logic_vector(7 downto 0);
        n3 : in std_logic_vector(1 downto 0);
        r : out std_logic_vector(7 downto 0)
    );
end calc;

architecture arc of calc is
begin
    process (clk)
    begin
        if rising_edge(clk) then   -- só faz a operação no 'tic' do clock
        case n3 is -- caixa de multiseleção
            when "01" =>
            r <= std_logic_vector(unsigned(n1) + unsigned(n2));
            when "10" =>
            r <= std_logic_vector(unsigned(n1) - unsigned(n2));
            when "11" =>
            r <= std_logic_vector(resize(unsigned(n1) * unsigned(n2), 8));
            end case;
        end if;
    end process;
end architecture arc;
