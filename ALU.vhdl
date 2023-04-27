library ieee;
use ieee.std_logic_1164.all;
entity ALU is
    port(a, b : in std_logic_vector(7 downto 0);
        op : in std_logic; --0 for addition, 1 for substraction
        sum : out std_logic_vector(7 downto 0));
end entity ALU;

architecture structural of ALU is
component adder is
    port(a, b : in std_logic_vector(7 downto 0);
         sum : out std_logic_vector(7 downto 0));
end component adder;

signal b_sel, inv_b, neg_b : std_logic_vector(7 downto 0);
begin
adder0: adder port map(a, b_sel, sum); -- for addition/subtraction
adderneg: adder port map(inv_b, "00000001", neg_b); -- for subtraction/addition with negatives

inv_b <= not(b);
with op select b_sel <= -- makes b negative if subtraction
    b when '0',
    neg_b when others;

end architecture structural;
--Adder--
library ieee;
use ieee.std_logic_1164.all;
entity adder is
    port(a, b : in std_logic_vector(7 downto 0);
         sum : out std_logic_vector(7 downto 0));
end entity adder;

architecture structural of adder is
component full_adder is
    port(a, b, c : in std_logic;
        sum, co : out std_logic);
end component full_adder;

signal carry : std_logic_vector(6 downto 0);
begin
    digit0: full_adder port map(a(0), b(0),'0', sum(0), carry(0));
    digit1: full_adder port map(a(1), b(1), carry(0), sum(1), carry(1));
    digit2: full_adder port map(a(2), b(2), carry(1), sum(2), carry(2));
    digit3: full_adder port map(a(3), b(3), carry(2), sum(3), carry(3));
    digit4: full_adder port map(a(4), b(4), carry(3), sum(4), carry(4));
    digit5: full_adder port map(a(5), b(5), carry(4), sum(5), carry(5));
    digit6: full_adder port map(a(6), b(6), carry(5), sum(6), carry(6));
    digit7: full_adder port map(a(7), b(7), carry(6), sum(7), open);
end architecture structural;

--Full Adder--
library ieee;
use ieee.std_logic_1164.all;
entity full_adder is
    port(a, b, c : in std_logic;
        sum, co : out std_logic);
end entity full_adder;

architecture data of full_adder is
begin
    sum <= a xor b xor c;
    co <= ((a and b) or (b and c) or (a and c));
end architecture data;