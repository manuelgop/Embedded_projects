----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:47:47 01/19/2016 
-- Design Name: 
-- Module Name:    Carry - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Carry is
    Port ( A : in  STD_LOGIC;
           B : in  STD_LOGIC;
           C : in  STD_LOGIC;
           D : in  STD_LOGIC;
           C0 : out  STD_LOGIC);
end Carry;

architecture Behavioral of Carry is
	--Embedded signals
	signal AB_emb, CD_emb : STD_LOGIC;
begin

	--Concurrent Boolean equation
	AB_emb <= A and B;
	CD_emb <= C and D;
	C0 <= AB_emb or CD_emb;


end Behavioral;

