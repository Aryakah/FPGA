
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

use IEEE.NUMERIC_STD.ALL;


entity FIR_DIR_PIPED2 is
    Port ( Clock 		: in   STD_LOGIC;
           POutput 	: out  SIGNED (13 downto 0));
end FIR_DIR_PIPED2;

architecture Behavioral of FIR_DIR_PIPED2 is

Constant k0 	: Signed (9 downto 0) := to_signed (62,10);
Constant k1 	: Signed (9 downto 0) := to_signed (174,10);
Constant k2 	: Signed (9 downto 0) := to_signed (174,10);
Constant k3 	: Signed (9 downto 0) := to_signed (62,10);

Constant SInput   : Signed (13 downto 0) := to_signed (7373,14);

Signal z1 		: Signed (13 downto 0) := (others => '0');
Signal z11 		: Signed (13 downto 0) := (others => '0');
Signal z2 		: Signed (13 downto 0) := (others => '0');
Signal z22 		: Signed (13 downto 0) := (others => '0');
Signal z3 		: Signed (13 downto 0) := (others => '0');
Signal z33 		: Signed (13 downto 0) := (others => '0');
Signal z4 		: Signed (23 downto 0) := (others => '0');
Signal z5 		: Signed (23 downto 0) := (others => '0');
Signal z6 		: Signed (23 downto 0) := (others => '0');

Signal Sum1       : Signed (23 downto 0) := (others => '0');
Signal Sum2       : Signed (23 downto 0) := (others => '0');
Signal SOutput    : Signed (13 downto 0) := (others => '0');


begin

POutput <= SOutput;

Process (clock) 
begin
if rising_edge (clock) then

z1  <= SInput;
z11 <= z1;
z2  <= z11;
z22 <= z2;
z3  <= z22;
z33 <= z3;

z4  <= Sinput * k0;
z5  <= z11 * k1 + z4;
z6  <= z22 * k2 + z5;

Sum1 <= z33 * k3 + z6;
Sum2 <= Sum1;
SOutput <= (Sum2 (22 downto 9));

end if;
end process;


end Behavioral;

