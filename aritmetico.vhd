library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity aritmetico is
    generic (width: integer:= 8);
    port (
        inpt0: in signed(width-1 downto 0);
        inpt1: in signed(width-1 downto 0);
        ctrl: in std_logic_vector(1 downto 0);
        outp: out signed(width-1 downto 0)
    );
end;

architecture arch of aritmetico is
begin
    process(inpt0, inpt1, ctrl)
    begin
    	if ctrl="00" then
    		outp <= inpt0 + inpt1;
    	elsif ctrl="01" then
    		outp <= inpt0 - inpt1;
    	elsif ctrl="10" then
    		outp <= inpt0 + 1;
    	else
    		outp <= inpt0 - 1;
    	end if;
    end process;
end;
