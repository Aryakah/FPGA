
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


use IEEE.NUMERIC_STD.ALL;



entity IIR_Direct_I is
    Port ( Clock 		: in  STD_LOGIC;
           PInput 	: in  SIGNED (13 downto 0);
           POutput 	: Out SIGNED (14 downto 0));
end IIR_Direct_I;

architecture Behavioral of IIR_Direct_I is

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
Signal 	z1	      : Signed (13 downto 0) := (others => '0');
Signal 	z2	      : Signed (13 downto 0) := (others => '0');
Signal 	z3	      : Signed (13 downto 0) := (others => '0');
Signal 	z4	      : Signed (13 downto 0) := (others => '0');
Signal 	z5	      : Signed (14 downto 0) := (others => '0');
Signal 	z6	      : Signed (14 downto 0) := (others => '0');
Signal 	z7	      : Signed (14 downto 0) := (others => '0');
Signal 	z8	      : Signed (14 downto 0) := (others => '0');


Signal 	z10	      : Signed (31 downto 0) := (others => '0');
Signal 	z11	      : Signed (31 downto 0) := (others => '0');
Signal 	z12	      : Signed (31 downto 0) := (others => '0');
Signal 	z13	      : Signed (31 downto 0) := (others => '0');
Signal 	z14	      : Signed (31 downto 0) := (others => '0');

Signal 	Sum1	      : Signed (32 downto 0) := (others => '0');




begin


SOutput 	<= Sum1(29 downto 15);
POutput	<= SOutput;
Sum1 		<= z10 + z11 + z12 + z13 + z14 + a1 * z5 + a2 * z6 + a3 * z7 + a4 * z8;


process (clock)
begin


if rising_edge (clock) then

SInput <= PInput;
z1	 <= SInput;
z2	 <= z1;
z3	 <= z2;
z4	 <= z3;
z5 	 <= SOutput;
z6 	 <= z5;
z7 	 <= z6;
z8 	 <= z7;

z10	 <= SInput * b0;
z11	 <= z1 * b1;
z12	 <= z2 * b2;
z13	 <= z3 * b3;
z14	 <= z4 * b4;


end if;
end process;



end Behavioral;

