
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

use IEEE.NUMERIC_STD.ALL;



entity FIR_Symmetric is
    Port ( Clock 		: in  STD_LOGIC;
           POutput 	: out  SIGNED (13 downto 0));
end FIR_Symmetric;

architecture Behavioral of FIR_Symmetric is

Constant k0 	: Signed (9 downto 0) := to_signed (62,10);
Constant k1 	: Signed (9 downto 0) := to_signed (174,10);


Constant SInput   : Signed (13 downto 0) := to_signed (7373,14);

Signal z1 		: Signed (13 downto 0) := (others => '0');
Signal z2 		: Signed (13 downto 0) := (others => '0');
Signal z3 		: Signed (13 downto 0) := (others => '0');

Signal Sum1       : Signed (14 downto 0) := (others => '0');
Signal Sum2       : Signed (14 downto 0) := (others => '0');
Signal Sum3       : Signed (24 downto 0) := (others => '0');
Signal P1         : Signed (24 downto 0) := (others => '0');
Signal P2         : Signed (24 downto 0) := (others => '0');
Signal SOutput    : Signed (13 downto 0) := (others => '0');


begin



POutput <= SOutput;

Process (clock) 
begin
if rising_edge (clock) then

z1 <= SInput;
z2 <= z1;
z3 <= z2;


Sum1 <= SInput + resize(z3,15);
Sum2 <= z1 + resize(z2,15);
P1   <= Sum1 * k0;
P2   <= Sum2 * K1;
Sum3 <= P1 + P2;
SOutput <= (Sum3 (22 downto 9));

end if;

end process;

end Behavioral;

