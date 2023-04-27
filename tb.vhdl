--file to test all instructions
library ieee;
use ieee.std_logic_1164.all;
use std.textio.all;

entity tb is
end entity tb;

architecture structural of tb is
component calculator is
  port(
    instr : in std_logic_vector(7 downto 0); --opcodes: 01->add, 10->sub, 11->li, 000->print
    clk : in std_logic
  );
end component calculator;

signal instr : std_logic_vector(7 downto 0);
signal clk : std_logic;

begin
    testbench : calculator port map(instr, clk);
    process
    begin
        clk <= '0';
        instr <= "11000011"; --li reg0 3
        wait for 1 ns;
        clk <= '1';
        wait for 1 ns;
        clk <= '0';
        instr <= "00000000"; --print reg0
        wait for 1 ns;
        clk <= '1';
        wait for 1 ns;
        clk <= '0';
        instr <= "11100101"; --li reg2 5
        wait for 1 ns;
        clk <= '1';
        wait for 1 ns;
        clk <= '0';
        instr <= "00010000"; --print reg2
        wait for 1 ns;
        clk <= '1';
        wait for 1 ns;
        clk <= '0';
        instr <= "00001000"; --print reg1
        wait for 1 ns;
        clk <= '1';
        wait for 1 ns;
        clk <= '0';
        instr <= "11111111"; --li reg3 -1 (twos comp)
        wait for 1 ns;
        clk <= '1';
        wait for 1 ns;
        clk <= '0';
        instr <= "00011000"; --print reg3
        wait for 1 ns;
        clk <= '1';
        wait for 1 ns;
        clk <= '0';
        instr <= "01010010"; --addw reg1, reg0, reg2 (3 + 5)
        wait for 1 ns;
        clk <= '1';
        wait for 1 ns;
        clk <= '0';
        instr <= "00001000"; --print reg1
        wait for 1 ns;
        clk <= '1';
        wait for 1 ns;
        clk <= '0';
        instr <= "01010011"; --addw reg1, reg0, reg3
        wait for 1 ns;
        clk <= '1';
        wait for 1 ns;
        clk <= '0';
        instr <= "00001000"; --print reg1
        wait for 1 ns;
        clk <= '1';
        wait for 1 ns;
        clk <= '0';
        instr <= "10011000"; --subw reg1, reg2, reg0
        wait for 1 ns;
        clk <= '1';
        wait for 1 ns;
        clk <= '0';
        instr <= "00001000"; --print reg1
        wait for 1 ns;
        clk <= '1';
        wait for 1 ns;
        clk <= '0';
        instr <= "10011111"; --subw reg1, reg3, reg3 (-1 -(-1) = 0)
        wait for 1 ns;
        clk <= '1';
        wait for 1 ns;
        clk <= '0';
        instr <= "00001000"; --print reg1
        wait for 1 ns;
        clk <= '1';
        wait for 1 ns;
        clk <= '0';
        instr <= "10001110"; --subw reg0, reg3, reg2
        wait for 1 ns;
        clk <= '1';
        wait for 1 ns;
        clk <= '0';
        instr <= "00000000"; --print reg1
        wait for 1 ns;
        clk <= '1';
        wait for 1 ns;
        clk <= '0';
      wait;
    end process;
end architecture structural;
