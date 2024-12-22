
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

use IEEE.NUMERIC_STD.ALL;


entity IIR_TRA_I is
    Port ( Clock 		: in  STD_LOGIC;
           PInput		: in  SIGNED (13 downto 0);
           POutput 	: out SIGNED (14 downto 0));
end IIR_TRA_I;

architecture Behavioral of IIR_TRA_I is




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
Signal 	z1	      : Signed (37 downto 0) := (others => '0');
Signal 	z2	      : Signed (37 downto 0) := (others => '0');
Signal 	z3	      : Signed (37 downto 0) := (others => '0');
Signal 	z4	      : Signed (37 downto 0) := (others => '0');
Signal 	z5	      : Signed (37 downto 0) := (others => '0');
Signal 	z6	      : Signed (37 downto 0) := (others => '0');
Signal 	z7	      : Signed (37 downto 0) := (others => '0');
Signal 	z8	      : Signed (37 downto 0) := (others => '0');

Signal 	nInput      : Signed (25 downto 0) := (others => '0');



Signal 	Sum1	      : Signed (37 downto 0) := (others => '0');
Signal 	Sum_s	      : Signed (19 downto 0) := (others => '0');
Signal 	Sum2	      : Signed (37 downto 0) := (others => '0');



begin
nInput	<= SInput * to_signed (2047,12);
sum_s		<= Sum1(34 downto 15);
Sum1 		<= z1 + (nInput (24 downto 0) & '0');
Sum2		<= sum_s * b0 + z5;
SOutput	<= (Sum2 (26 downto 12));
POutput	<= Soutput;

process (clock)
begin
if rising_edge (clock) then

SInput	<= PInput;
z4		<= Sum_s * a4; 
z3		<= Sum_s * a3 + z4; 
z2		<= Sum_s * a2 + z3; 
z1		<= Sum_s * a1 + z2; 


z8		<= Sum_s * b4;
z7		<= Sum_s * b3 + z8;
z6		<= Sum_s * b2 + z7;
z5		<= Sum_s * b1 + z6;

end if;
end process;


end Behavioral;

