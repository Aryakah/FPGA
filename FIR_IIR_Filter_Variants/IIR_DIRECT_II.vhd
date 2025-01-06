
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

use IEEE.NUMERIC_STD.ALL;

entity IIR_DIRECT_II is
    Port ( Clock 		: in  STD_LOGIC;
           PInput 	: in  SIGNED (13 downto 0);
           POutput 	: out SIGNED (14 downto 0));
end IIR_DIRECT_II;

architecture Behavioral of IIR_DIRECT_II is


Constant 	b0		: Signed (17 downto 0) := to_signed (89,18);
Constant 	b1		: Signed (17 downto 0) := to_signed (-23,18);
Constant 	b2		: Signed (17 downto 0) := to_signed (119,18);
Constant 	b3		: Signed (17 downto 0) := to_signed (-23,18);
Constant 	b4		: Signed (17 downto 0) := to_signed (89,18);
Constant 	a1		: Signed (17 downto 0) := to_signed (103460,18);
Constant 	a2		: Signed (17 downto 0) := to_signed (-124840,18);
Constant 	a3		: Signed (17 downto 0) := to_signed (67924,18);
Constant 	a4		: Signed (17 downto 0) := to_signed (-14027,18);



Signal 	SInput 	: Signed (13 downto 0) := (others => '0');
Signal 	SOutput	: Signed (14 downto 0) := (others => '0');
Signal 	z1	      : Signed (21 downto 0) := (others => '0');
Signal 	z2	      : Signed (21 downto 0) := (others => '0');
Signal 	z3	      : Signed (21 downto 0) := (others => '0');
Signal 	z4	      : Signed (21 downto 0) := (others => '0');

Signal 	nInput      : Signed (28 downto 0) := (others => '0');



Signal 	Sum1	      : Signed (39 downto 0) := (others => '0');
Signal 	Sum2	      : Signed (39 downto 0) := (others => '0');




begin

nInput	<= SInput * to_signed (16383,15);
Sum1 		<= z1 * a1 + z2 * a2 + z3 * a3 + z4 * a4 + (nInput (27 downto 0) & '0');
Sum2		<= (Sum1 (36 downto 15)) * b0 + z1 * b1 + z2 * b2 + z3 * b3 + z4 * b4;
SOutput	<= (Sum2 (29 downto 15));
POutput	<= Soutput;


process (clock)
begin

if rising_edge (clock) then

SInput	<= PInput;
z1		<= (Sum1 (36 downto 15));
z2		<= z1;
z3		<= z2;
z4		<= z3;

end if;
end process;

end Behavioral;

