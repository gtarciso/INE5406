library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity graycode_dist is
generic(width: integer);
port(
    inpt0: in std_logic_vector(width-1 downto 0);
    inpt1: in std_logic_vector(width-1 downto 0);
    outp: out std_logic_vector(width-1 downto 0)
);
end entity;

architecture dist of graycode_dist is
signal aux0: std_logic_vector(width-1 downto 0);
signal aux1: std_logic_vector(width-1 downto 0);
signal zero: std_logic_vector(width-1 downto 0);
signal max: std_logic_vector(width-1 downto 0);
begin

    zero <= (others => '0');
    max <= (others => '1');
    
    aux0(width-1) <= inpt0(width-1);
    gtb0: for i in width-2 downto 0 generate
        aux0(i) <= inpt0(i) xor aux0(i+1);
    end generate;
    
    aux1(width-1) <= inpt1(width-1);
    gbt1: for i in width-2 downto 0 generate
        aux1(i) <= inpt1(i) xor aux1(i+1);
    end generate;
    
    outp <= std_logic_vector(unsigned(aux0) - unsigned(aux1)) when aux0 > aux1 else
            std_logic_vector(unsigned(aux1) - unsigned(aux0)) when aux0 < aux1 else
            zero;
    
end architecture;