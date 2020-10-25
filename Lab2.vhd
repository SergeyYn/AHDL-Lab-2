library IEEE;
use IEEE.std_logic_1164.all;
entity Var6 is
	 port(
		 x1 : in STD_LOGIC;
		 x2 : in STD_LOGIC;
		 x3 : in STD_LOGIC;
		 y1 : out STD_LOGIC;
		 y2 : out STD_LOGIC
	     );
end Var6;			 

	
library IEEE;
use IEEE.std_logic_1164.all;
entity and3 is
	 port(
		 in1 : in STD_LOGIC;
		 in2 : in STD_LOGIC; 
		 in3 : in STD_LOGIC;
		 out1 : out STD_LOGIC
	     );
end and3;



//insert not1 entity here




//insert nor3 entity here

							   

//insert architectures here


//END INSERTIONS

architecture Var6 of Var6 is 


component and3 is
	port (in1:in STD_LOGIC;in2:in STD_LOGIC;in3:in STD_LOGIC;out1:out STD_LOGIC);
end component;

component nor3 is
	port (in1:in STD_LOGIC;in2:in STD_LOGIC;in3:in STD_LOGIC;out1:out STD_LOGIC);
end component;

component not1 is
	port (in1:in STD_LOGIC;out1:out STD_LOGIC);
end component;

signal s1,s2,s3,s4,s5,s6,s7:STD_LOGIC;

begin
	D1:not1 port map(X1,S1); 
	D2:and3 port map(S1,S1,X2,S4);	
	D3:not1 port map(X2,S2);
	D4:and3 port map(X1,S2,X3,S5);
	D5:not1 port map(X3,S3);
	D6:and3 port map(X1,X2,S3,S6);
	D7:nor3 port map(S4,S5,S6,S7); 
	D8:not1 port map(S7,Y1);
	D9:not1 port map(X1,Y2);																 
end Var6;


library IEEE;
use IEEE.std_logic_1164.all;

entity Var6_2 is
	generic(maxdelay:time:= 20ns);
	port (
		indata:in STD_LOGIC_VECTOR (2 downto 0);
		outdata: out STD_LOGIC_VECTOR (1 downto 0)
	);
end Var6_2;	

architecture Var6_2 of Var6_2 is
begin
	with indata select
	outdata<="01" after maxdelay when "000" ,
	"01" after maxdelay when "001" ,
	"11" after maxdelay when "010" ,
	"11" after maxdelay when "011" ,
	"00" after maxdelay when "100" ,
	"10" after maxdelay when "101" ,
	"10" after maxdelay when "110" ,
	"00" after maxdelay when others;
end architecture Var6_2;
