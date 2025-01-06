library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


entity IIR_Biquad_Transposed_II_Top is
    Port ( Clock   : in  STD_LOGIC;
           PInput  : in  Signed (13 downto 0);
           POutput : out Signed (14 downto 0));
end IIR_Biquad_Transposed_II_Top;

architecture Behavioral of IIR_Biquad_Transposed_II_Top is


Signal   	SInput_S 	    : Signed (13 downto 0) := (others => '0');
Signal 	    SInput  	    : Signed (25 downto 0) := (others => '0');
Signal 	    POutput_int	    : Signed (14 downto 0) := (others => '0');
Signal 	    SOutput1  	    : Signed (26 downto 0) := (others => '0');
Signal 	    SOutput1_s  	: Signed (13 downto 0) := (others => '0');
Constant 	s1		        : Signed (11 downto 0) := to_signed (190,12);
Constant 	s2		        : Signed (11 downto 0) := to_signed (118,12);


begin

IIR_Biquad_Transposed_II_inst1: entity work.IIR_Biquad_Transposed_II

    generic map(
    
        b10		=> to_signed (1024,12),
     	b11		=> to_signed (1000,12),
     	b12		=> to_signed (1024,12),
     	a10		=> to_signed (-1024,12),
 	    a11		=> to_signed (1032,12),
 	    a12		=> to_signed (-575,12)
 	    
    )
   port map (
      
      Clock                => Clock,              
      PInput(13 downto 0)  => SInput_S(13 downto 0),
      POutput(14 downto 0) => POutput_int(14 downto 0)
      
   );
  
  IIR_Biquad_Transposed_II_inst2: entity work.IIR_Biquad_Transposed_II

    generic map(
    
        b10		=> to_signed (1024,12),
     	b11		=> to_signed (1820,12),
     	b12		=> to_signed (1024,12),
     	a10		=> to_signed (-1024,12),
 	    a11		=> to_signed (749,12),
 	    a12		=> to_signed (-170,12)
 	    
    )
   port map (
      
      Clock                => Clock,              
      PInput(13 downto 0)  => SOutput1_s(13 downto 0),
      POutput(14 downto 0) => POutput(14 downto 0)
      
   ); 
   

SInput	    <= PInput * s1;
SInput_S	<= SInput (23 downto 10);
SOutput1    <= POutput_int * s2 ;
SOutput1_s  <= SOutput1 (23 downto 10);


end Behavioral;
