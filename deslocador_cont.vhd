library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity deslocador_cont is
  generic(width : integer:=8);
  port(
    inpt: in unsigned(width-1 downto 0);
    op: in unsigned(1 downto 0);
    oupt: out unsigned(width-1 downto 0)  
  );
end entity;

architecture deslocador of deslocador_cont is
  signal deslocamento: unsigned(width-1 downto 0);
  begin
    process(deslocamento, inpt, op)
    begin
      for i in to_integer(op) to width-1 loop
        deslocamento(i) <= inpt(i-to_integer(op));
      end loop;
      for i in 0 to (to_integer(op)-1) loop
        deslocamento(i) <= '0';
      end loop;
      oupt <= deslocamento;
    end process;
end architecture;
