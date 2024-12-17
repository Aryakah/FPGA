--
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

use IEEE.NUMERIC_STD.ALL;



entity FIR_DIR_Pipelined1 is
    Port ( Clock     : in  STD_LOGIC;
           POutput   : out  SIGNED (13 downto 0));
end FIR_DIR_Pipelined1;

architecture Behavioral of FIR_DIR_Pipelined1 is


Constant k0 	: Signed (9 downto 0) := to_signed (62,10);
Constant k1 	: Signed (9 downto 0) := to_signed (174,10);
Constant k2 	: Signed (9 downto 0) := to_signed (174,10);
Constant k3 	: Signed (9 downto 0) := to_signed (62,10);

Constant SInput   : Signed (13 downto 0) := to_signed (7373,14);

Signal z1 		: Signed (13 downto 0) := (others => '0');
Signal z2 		: Signed (13 downto 0) := (others => '0');
Signal z3 		: Signed (13 downto 0) := (others => '0');

Signal z11 		: Signed (23 downto 0) := (others => '0');
Signal z12 		: Signed (23 downto 0) := (others => '0');
Signal z13 		: Signed (23 downto 0) := (others => '0');
Signal z14 		: Signed (23 downto 0) := (others => '0');




Signal Sum1       : Signed (23 downto 0) := (others => '0');
Signal Sum2       : Signed (23 downto 0) := (others => '0');
Signal Sum3       : Signed (23 downto 0) := (others => '0');

Signal SOutput    : Signed (13 downto 0) := (others => '0');




begin

POutput <= SOutput;

process (clock)
begin

if rising_edge (clock) then

z1 <= SInput;
z2 <= z1;
z3 <= z2;

z11 <= SInput * k0;
z12 <= SInput * k1;
z13 <= SInput * k2;
z14 <= SInput * k3;


Sum1 <= z11 + z12;
Sum2 <= z13 + z14;
Sum3 <= Sum1 + Sum2;

SOutput <= (Sum3 (22 downto 9));

end if;
end process;

end Behavioral;

