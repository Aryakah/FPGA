
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

USE ieee.numeric_std.ALL;
use ieee.std_logic_textio.all;
use std.textio.all;

ENTITY FIR_DIR_PIPELINED_tb IS
END FIR_DIR_PIPELINED_tb;
 
ARCHITECTURE behavior OF FIR_DIR_PIPELINED_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT FIR_DIR_Pipelined1
    PORT(
         Clock 		: IN  std_logic;
         POutput        : OUT  SIGNED(13 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Clock 	: std_logic := '0';

 	--Outputs
   signal POutput : SIGNED(13 downto 0);

   -- Clock period definitions
   constant Clock_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: FIR_DIR_Pipelined1 PORT MAP (
          Clock => Clock,
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
   
   write_Output_Vector: process(Clock)
	
		file 		output_text	: text open write_mode is "C:\Users\Admin\Desktop\Examples\Output_PIPELINED2_DIR_HDL.txt";
		variable LO1			: line;
		
	begin
	
		if rising_edge(Clock) then
		
			write(LO1, to_integer(POutput));
			writeline(output_text , LO1);
			
		end if;
	end process;
   
   
 END;
