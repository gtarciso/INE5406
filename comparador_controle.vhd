library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity comparador_controle is
  generic(width : integer:=8);
  port(
    inpt0: in std_logic_vector(width-1 downto 0);
    inpt1: in std_logic_vector(width-1 downto 0);
    op: in std_logic;
    oupt: out std_logic_vector(width-1 downto 0)
  );
end entity;

architecture comp of comparador_controle is
begin
  oupt <= inpt0 when 
          op = '0' and signed(inpt0) > signed(inpt1) else
          inpt0 when
          op = '1' and signed(inpt0) < signed(inpt1) else
          inpt1;
end architecture;
