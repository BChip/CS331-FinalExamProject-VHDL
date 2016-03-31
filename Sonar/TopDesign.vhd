----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Bradley Chippi
-- 
-- Create Date:    20:11:49 03/30/2016 
-- Design Name: 
-- Module Name:    TopDesign - Behavioral 
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity TopDesign is
    Port ( pulse_pin : in  STD_LOGIC;
           Trigger_pin : out  STD_LOGIC;
           clk : in  STD_LOGIC;
           topselDispA : out  STD_LOGIC;
           topselDispB : out  STD_LOGIC;
           topselDispC : out  STD_LOGIC;
           topselDispD : out  STD_LOGIC);
end TopDesign;

architecture Behavioral of TopDesign is
component range_sensor is
Port ( fpgaclk : in  STD_LOGIC;
           pulse : in  STD_LOGIC;
           triggerOut : out  STD_LOGIC;
           meters : out  STD_LOGIC_VECTOR (3 downto 0);
           decimeters : out  STD_LOGIC_VECTOR (3 downto 0);
           centimeters : out  STD_LOGIC_VECTOR (3 downto 0));
end component;

component lcd_controller
PORT(
    clk        : IN    STD_LOGIC;  --system clock
    lcd_data   : OUT   STD_LOGIC_VECTOR(7 DOWNTO 0)); --data signals for lcd
end component;

SIGNAL Ai : STD_LOGIC_VECTOR(3 downto 0);
SIGNAL Bi : STD_LOGIC_VECTOR(3 downto 0);
SIGNAL Ci : STD_LOGIC_VECTOR(3 downto 0);
SIGNAL Di : STD_LOGIC_VECTOR(3 downto 0);

SIGNAL sensor_meters : STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL sensor_decimeters : STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL sensor_centimeters : STD_LOGIC_VECTOR(3 downto 0);
begin

uut2: lcd_controller Port Map( --Work on this 
		lcd_data => Di & Ci & Bi  & Ai,
		clk => clk
	);

uut4 : range_sensor Port Map(
		fpgaclk => clk,
		triggerOut => Trigger_pin,
		pulse => pulse_pin,
		meters => sensor_meters,
		decimeters => sensor_decimeters,
		centimeters => sensor_centimeters
	);
	
Ai <= sensor_centimeters;
Bi <= sensor_decimeters;
Ci <= sensor_meters;
Di <= "0000";

end Behavioral;

