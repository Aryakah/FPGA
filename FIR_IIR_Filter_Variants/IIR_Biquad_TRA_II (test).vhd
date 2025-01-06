
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

use IEEE.NUMERIC_STD.ALL;



entity IIR_Biquad_TRA_II is
    Port ( Clock 		: in  STD_LOGIC;
           PInput 	: in  SIGNED(13 downto 0);
           POutput	: out SIGNED(14 downto 0));
end IIR_Biquad_TRA_II;

architecture Behavioral of IIR_Biquad_TRA_II is


Constant 	b10		: Signed (11 downto 0) := to_signed (1024,12);
Constant 	b11		: Signed (11 downto 0) := to_signed (1000,12);
Constant 	b12		: Signed (11 downto 0) := to_signed (1024,12);
Constant 	a10		: Signed (11 downto 0) := to_signed (-1024,12);
Constant 	a11		: Signed (11 downto 0) := to_signed (1032,12);
Constant 	a12		: Signed (11 downto 0) := to_signed (-575,12);

Constant 	b20		: Signed (11 downto 0) := to_signed (1024,12);
Constant 	b21		: Signed (11 downto 0) := to_signed (1820,12);
Constant 	b22		: Signed (11 downto 0) := to_signed (1024,12);
Constant 	a20		: Signed (11 downto 0) := to_signed (-1024,12);
Constant 	a21		: Signed (11 downto 0) := to_signed (749,12);
Constant 	a22		: Signed (11 downto 0) := to_signed (-170,12);


Constant 	s1		: Signed (11 downto 0) := to_signed (190,12);
Constant 	s2		: Signed (11 downto 0) := to_signed (118,12);

Signal 	z1	      : Signed (26 downto 0) := (others => '0');
Signal 	z2	      : Signed (26 downto 0) := (others => '0');
Signal 	z3	      : Signed (26 downto 0) := (others => '0');
Signal 	z4	      : Signed (26 downto 0) := (others => '0');

Signal 	SInput 	: Signed (25 downto 0) := (others => '0');
Signal 	SInput_S 	: Signed (13 downto 0) := (others => '0');
Signal 	SInput_S2 	: Signed (26 downto 0) := (others => '0');
Signal 	SInput_S3 	: Signed (13 downto 0) := (others => '0');
Signal 	SOutput	: Signed (14 downto 0) := (others => '0');


Signal 	Sum1	      : Signed (26 downto 0) := (others => '0');
Signal 	Sum2	      : Signed (26 downto 0) := (others => '0');

Signal 	Sum1_S	: Signed (14 downto 0) := (others => '0');

begin

Sum1		<= SInput_S * b10 + z1;
Sum1_S	<= Sum1 (24 downto 10);
SInput_S2   <= Sum1_S * s2;
SInput_S3   <= SInput_S2 (23 downto 10);

Sum2 		<= SInput_S3 * b20 + z3;
SOutput	<= Sum2 (24 downto 10);
POutput	<= SOutput;

process (clock)
begin
if rising_edge (clock) then

SInput	<= PInput * s1;
SInput_S	<= SInput (23 downto 10);

z2		<= SInput_S * b12 + Sum1_S * a12;
z1		<= SInput_S * b11 + Sum1_S * a11 + z2;

z4		<= SInput_S3 * b22 + SOutput * a22;
z3		<= SInput_S3 * b21 + SOutput * a21 + z4;




end if;
end process;





end Behavioral;

