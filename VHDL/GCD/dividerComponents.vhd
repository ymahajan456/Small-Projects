--Divider components-------------------------------------------

--shiftCounter16------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

entity shiftCount16 is
   port (A: in std_logic_vector(4 downto 0);
				B: out std_logic_vector(4 downto 0));
end entity shiftCount16;

architecture Serial of shiftCount16 is
begin
  process(A)
    variable borrow: std_logic;
  begin 
    borrow := '1';
    for I in 0 to 4 loop
       B(I) <= A(I) xor borrow;
       borrow := borrow and (not A(I));
    end loop;
  end process; 
end Serial;

--shiftCounter8------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

entity shiftCount8 is
   port (A: in std_logic_vector(3 downto 0);
				B: out std_logic_vector(3 downto 0));
end entity shiftCount8;

architecture Serial of shiftCount8 is
begin
  process(A)
    variable borrow: std_logic;
  begin 
    borrow := '1';
    for I in 0 to 3 loop
       B(I) <= A(I) xor borrow;
       borrow := borrow and (not A(I));
    end loop;
  end process; 
end Serial;
---------------------------------------------------------------

-- left shifter 16 Bit ----------------------------------------

library ieee;
use ieee.std_logic_1164.all;

entity lshift16 is	
	port ( A : in std_logic_vector(15 downto 0);
				B : out std_logic_vector(15 downto 0));
end entity;

architecture structure of lshift16 is

	begin
	B(15 downto 1) <= A(14 downto 0);
	B(0) <= '0';
end architecture;
---------------------------------------------------------------

--16 Bit Sub---------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

entity sub16bit is
		port( A,B : in std_logic_vector(15 downto 0);
				 sub : out std_logic_vector(15 downto 0));
end entity;

architecture structure of sub16bit is

	component fullAdder is
		port (  A, B, Cin : in std_logic;
         sum, Cout : out std_logic);
	end component;

	signal Bcom,c : std_logic_vector(15 downto 0);
		
	begin	
		
		Bcom <= not (B);
		
		fad0  : fullAdder port map(A(0),Bcom(0),'1',sub(0),c(0));
		fad1  : fullAdder port map(A(1),Bcom(1),c(0),sub(1),c(1));
		fad2  : fullAdder port map(A(2),Bcom(2),c(1),sub(2),c(2));
		fad3  : fullAdder port map(A(3),Bcom(3),c(2),sub(3),c(3));
		fad4  : fullAdder port map(A(4),Bcom(4),c(3),sub(4),c(4));
		fad5  : fullAdder port map(A(5),Bcom(5),c(4),sub(5),c(5));
		fad6  : fullAdder port map(A(6),Bcom(6),c(5),sub(6),c(6));
		fad7  : fullAdder port map(A(7),Bcom(7),c(6),sub(7),c(7));
		fad8  : fullAdder port map(A(8),Bcom(8),c(7),sub(8),c(8));
		fad9  : fullAdder port map(A(9),Bcom(9),c(8),sub(9),c(9));
		fad10 : fullAdder port map(A(10),Bcom(10),c(9),sub(10),c(10));
		fad11 : fullAdder port map(A(11),Bcom(11),c(10),sub(11),c(11));
		fad12 : fullAdder port map(A(12),Bcom(12),c(11),sub(12),c(12));
		fad13 : fullAdder port map(A(13),Bcom(13),c(12),sub(13),c(13));
		fad14 : fullAdder port map(A(14),Bcom(14),c(13),sub(14),c(14));
		fad15 : fullAdder port map(A(15),Bcom(15),c(14),sub(15),c(15));
		
end architecture;
---------------------------------------------------------------

--Comparator---------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

entity cmp16 is	
	port (A,B : in std_logic_vector(15 downto 0);
			g,e,l: out std_logic);
end entity;

architecture structure of cmp16 is 

	component compBlock is
		port(gp,ep,lp : in std_logic;
				ak,bk : in std_logic;
			  g,e,l : out std_logic);
	end component;
	
	signal gTmp,eTmp,lTmp : std_logic_vector(14 downto 0);
	
	begin
	
		cmp15 : compBlock port map('0','1','0',A(15),B(15),gTmp(0),eTmp(0),lTmp(0));
		cmp14 : compBlock port map(gTmp(0),eTmp(0),lTmp(0),A(14),B(14),gTmp(1),eTmp(1),lTmp(1));
		cmp13 : compBlock port map(gTmp(1),eTmp(1),lTmp(1),A(13),B(13),gTmp(2),eTmp(2),lTmp(2));
		cmp12 : compBlock port map(gTmp(2),eTmp(2),lTmp(2),A(12),B(12),gTmp(3),eTmp(3),lTmp(3));
		cmp11 : compBlock port map(gTmp(3),eTmp(3),lTmp(3),A(11),B(11),gTmp(4),eTmp(4),lTmp(4));
		cmp10 : compBlock port map(gTmp(4),eTmp(4),lTmp(4),A(10),B(10),gTmp(5),eTmp(5),lTmp(5));
		cmp9  : compBlock port map(gTmp(5),eTmp(5),lTmp(5),A(9),B(9),gTmp(6),eTmp(6),lTmp(6));
		cmp8  : compBlock port map(gTmp(6),eTmp(6),lTmp(6),A(8),B(8),gTmp(7),eTmp(7),lTmp(7));
		cmp7  : compBlock port map(gTmp(7),eTmp(7),lTmp(7),A(7),B(7),gTmp(8),eTmp(8),lTmp(8));
		cmp6  : compBlock port map(gTmp(8),eTmp(8),lTmp(8),A(6),B(6),gTmp(9),eTmp(9),lTmp(9));
		cmp5  : compBlock port map(gTmp(9),eTmp(9),lTmp(9),A(5),B(5),gTmp(10),eTmp(10),lTmp(10));
		cmp4  : compBlock port map(gTmp(10),eTmp(10),lTmp(10),A(4),B(4),gTmp(11),eTmp(11),lTmp(11));
		cmp3  : compBlock port map(gTmp(11),eTmp(11),lTmp(11),A(3),B(3),gTmp(12),eTmp(12),lTmp(12));
		cmp2  : compBlock port map(gTmp(12),eTmp(12),lTmp(12),A(2),B(2),gTmp(13),eTmp(13),lTmp(13));
		cmp1  : compBlock port map(gTmp(13),eTmp(13),lTmp(13),A(1),B(1),gTmp(14),eTmp(14),lTmp(14));
		cmp0  : compBlock port map(gTmp(14),eTmp(14),lTmp(14),A(0),B(0),g,e,l);

end architecture;
---------------------------------------------------------------

-- Register----------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
entity DataRegister is
	generic (data_width:integer);
	port (Din: in std_logic_vector(data_width-1 downto 0);
	      Dout: out std_logic_vector(data_width-1 downto 0);
	      enable,clk: in std_logic);
end entity;
architecture Behave of DataRegister is
begin
    process(clk)
    begin
       if(clk'event and (clk  = '1')) then
           if(enable = '1') then
               Dout <= Din;
           end if;
       end if;
    end process;
end Behave;
---------------------------------------------------------------
