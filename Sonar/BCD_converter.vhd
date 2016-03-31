----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Bradley Chippi
-- 
-- Create Date:    20:43:43 03/29/2016 
-- Design Name: 
-- Module Name:    BCD_converter - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity BCD_converter is
    Port ( Distance_input : in  STD_LOGIC_VECTOR (8 downto 0);
           hundreds : out  STD_LOGIC_VECTOR (3 downto 0);
           tens : out  STD_LOGIC_VECTOR (3 downto 0);
           unit : out  STD_LOGIC_VECTOR (3 downto 0));
end BCD_converter;

architecture Behavioral of BCD_converter is

begin
process(Distance_input)
	variable i : integer:=0;
	variable bcd : std_logic_vector(20 downto 0);
	begin
-- Initialization phase: the space for the BCD representation is reserved
	bcd := (others => '0');
	bcd(8 downto 0) := Distance_input;
-- "Double-Dabble Algorithm" is used to convert the Distance in binary into BCD
for i in 0 to 8 loop
	-- Left shift one bit
	bcd(19 downto 0) := bcd (18 downto 0) & '0';
	-- Check Phase
	if(i < 8 and bcd(12 downto 9) > "0100") then
		bcd(12 downto 9) := bcd(12 downto 9) + "0011";
	end if;
			if(i < 8 and bcd(16 downto 13) > "0100") then
			bcd(16 downto 13) := bcd(16 downto 13) + "0011";
	end if;
	
	end loop;
	-- The three BCD numbers are put in output
	hundreds <= bcd(16 downto 13);
	unit <= bcd(12 downto 9);
	
end process;


end Behavioral;

