
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

use IEEE.NUMERIC_STD.ALL;



entity FIR_TRA1 is
    Port ( Clock 		: in  STD_LOGIC;
           POutput      : OUT  Signed (13 downto 0));
end FIR_TRA1;

architecture Behavioral of FIR_TRA1 is

Constant k0 	: Signed (9 downto 0) := to_signed (62,10);
Constant k1 	: Signed (9 downto 0) := to_signed (174,10);
Constant k2 	: Signed (9 downto 0) := to_signed (174,10);
Constant k3 	: Signed (9 downto 0) := to_signed (62,10);

Constant SInput   : Signed (13 downto 0) := to_signed (7373,14);

Signal z1 		: Signed (23 downto 0) := (others => '0');
Signal z2 		: Signed (23 downto 0) := (others => '0');
Signal z3 		: Signed (23 downto 0) := (others => '0');

Signal Sum1       : Signed (23 downto 0) := (others => '0');

Signal SOutput    : Signed (13 downto 0) := (others => '0');


begin


POutput <= SOutput;


Process (clock) 
begin
if rising_edge (clock) then

z1 <= k3 * SInput;
z2 <= z1 + k2 * SInput;
z3 <= z2 + k1 * SInput;

Sum1 <= z3 + k0 * SInput;

SOutput <= (Sum1 (22 downto 9));

end if;

end process;




end Behavioral;

