
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

USE ieee.numeric_std.ALL;
USE ieee.std_logic_textio.all;
USE std.textio.all;
 
ENTITY IIR_TRA_II_PIPED_tb IS
END IIR_TRA_II_PIPED_tb;
 
ARCHITECTURE behavior OF IIR_TRA_II_PIPED_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT IIR_TRA_II_PIPELINED
    PORT(
         Clock 	: IN  std_logic;
         PInput   : IN  SIGNED (13 downto 0);
         POutput  : OUT SIGNED (14 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Clock 	: std_logic := '0';
   signal PInput  : SIGNED (13 downto 0) := (others => '0');

 	--Outputs
   signal POutput : SIGNED (14 downto 0);

   -- Clock period definitions
   constant Clock_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: IIR_TRA_II_PIPELINED PORT MAP (
          Clock => Clock,
          PInput => PInput,
          POutput => POutput
        );

   -- Clock process definitions
   Clock_process :process
   begin
		Clock <= '0';
		wait for Clock_period/2;
		Clock <= '1';
		wait for Clock_period/2;
   end process;
 


Read_Output_Vector: process(Clock)
	
		
		
	begin
	
		if rising_edge(Clock) then
		
			PInput <= to_signed (8191,14);
			
		end if;
	end process;
	
	


 
write_Output_Vector: process(Clock)
	
		file 		output_text	: text open write_mode is "C:\Users\Admin\Desktop\Examples\Output_IIR_Transpoed_PIPED_II_HDL.txt";
		variable LO1			: line;
		
	begin
	
		if rising_edge(Clock) then
		
			write(LO1, to_integer(POutput));
			writeline(output_text , LO1);
			
		end if;
	end process;

END;
