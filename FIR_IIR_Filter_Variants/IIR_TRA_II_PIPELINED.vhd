
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


use IEEE.NUMERIC_STD.ALL;



entity IIR_TRA_II_PIPELINED is
    Port ( Clock 		: in  STD_LOGIC;
           PInput 	: in  SIGNED (13 downto 0);
           POutput 	: out SIGNED (14 downto 0));
end IIR_TRA_II_PIPELINED;

architecture Behavioral of IIR_TRA_II_PIPELINED is



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

Signal 	z41	      : Signed (31 downto 0) := (others => '0');
Signal 	z31	      : Signed (31 downto 0) := (others => '0');
Signal 	z21	      : Signed (31 downto 0) := (others => '0');
Signal 	z11	      : Signed (31 downto 0) := (others => '0');
Signal 	z01	      : Signed (31 downto 0) := (others => '0');


begin

POutput	<= SOutput;
Sum1		<= z01 + z1;
SOutput	<= Sum1 (29 downto 15);


process (clock)
begin


if rising_edge (clock) then

SInput <= PInput;

z41	 <= SInput * b4;
z31	 <= SInput * b3;
z21	 <= SInput * b2;
z11	 <= SInput * b1;
z01	 <= SInput * b0;



z4 	 <= z41 + SOutput * a4;
z3 	 <= z31 + SOutput * a3 + z4;
z2 	 <= z21 + SOutput * a2 + z3;
z1 	 <= z11 + SOutput * a1 + z2;


end if;
end process;


end Behavioral;

