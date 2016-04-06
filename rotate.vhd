library ieee;
use ieee.std_logic_1164.all
use ieee.numeric_std.all

entity rotate is
  generic(width : integer:=8);
  port(
    inpt: in std_logic_vector(width-1 downto 0);
    ctrl: in std_logic;
    outp: out std_logic_vector(width-1 downto 0);  
  );
end entity;

architecture rotacionar of rotate is
signal deslocamento: std_logic_vector(width-1 downto 0);
begin
  deslocamento <= inpt(0) & inpt(width-1 downto 1) when ctrl = '1' else
                  inpt(width-2 downto 0) & inpt(width-1);
  outp <= deslocamento;
end architecture;
