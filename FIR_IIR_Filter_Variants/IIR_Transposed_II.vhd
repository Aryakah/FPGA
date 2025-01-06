
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity IIR_Transposed_II is
    Port ( Clock 		: in   STD_LOGIC;
           PInput 	: in   SIGNED (13 downto 0);
           POutput 	: out  SIGNED (14 downto 0));
end IIR_Transposed_II;

architecture Behavioral of IIR_Transposed_II is

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
Signal 	z1	      : Signed (32 downto 0) := (others => '0');
Signal 	z2	      : Signed (32 downto 0) := (others => '0');
Signal 	z3	      : Signed (32 downto 0) := (others => '0');
Signal 	z4	      : Signed (32 downto 0) := (others => '0');
Signal 	Sum1	      : Signed (32 downto 0) := (others => '0');


begin

POutput	<= SOutput;
Sum1		<= SInput * b0 + z1;
SOutput	<= Sum1 (29 downto 15);

process (clock)
begin


if rising_edge (clock) then

SInput <= PInput;
z4 	 <= SInput * b4 + SOutput * a4;
z3 	 <= SInput * b3 + SOutput * a3 + z4;
z2 	 <= SInput * b2 + SOutput * a2 + z3;
z1 	 <= SInput * b1 + SOutput * a1 + z2;


end if;
end process;



end Behavioral;

