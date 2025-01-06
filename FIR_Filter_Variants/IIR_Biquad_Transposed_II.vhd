

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


entity IIR_Biquad_Transposed_II is
    
    generic (
     	b10		: Signed (11 downto 0) := to_signed (1024,12);
     	b11		: Signed (11 downto 0) := to_signed (1000,12);
     	b12		: Signed (11 downto 0) := to_signed (1024,12);
     	a10		: Signed (11 downto 0) := to_signed (-1024,12);
 	    a11		: Signed (11 downto 0) := to_signed (1032,12);
 	    a12		: Signed (11 downto 0) := to_signed (-575,12)
 	    
    );

    Port ( 
    
           Clock   : in  STD_LOGIC;
           PInput  : in  Signed (13 downto 0);
           POutput : out Signed (14 downto 0));
end IIR_Biquad_Transposed_II;

architecture Behavioral of IIR_Biquad_Transposed_II is

Signal 	z1	        : Signed (26 downto 0) := (others => '0');
Signal 	z2	        : Signed (26 downto 0) := (others => '0');
Signal 	Sum1	    : Signed (26 downto 0) := (others => '0');
Signal 	Sum1_S	    : Signed (14 downto 0) := (others => '0');


begin

Sum1		<= PInput * b10 + z1;
Sum1_S	    <= Sum1 (24 downto 10);
POutput 	<= Sum1_S;


process (clock)
begin
if rising_edge (clock) then


z2		<= PInput * b12 + Sum1_S * a12;
z1		<= PInput * b11 + Sum1_S * a11 + z2;





end if;
end process;




end Behavioral;
