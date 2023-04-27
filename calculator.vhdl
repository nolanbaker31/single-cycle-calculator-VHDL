library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity calculator is
  port(
    instr : in std_logic_vector(7 downto 0);
    clk : in std_logic
  );
end entity calculator;

architecture structural of calculator is
  component reg_file is
    port(
      clk, we       : in std_logic := '0';
      rs1, rs2, ws  : in std_logic_vector(1 downto 0);
      wd            : in std_logic_vector(7 downto 0);
      rd1, rd2      : out std_logic_vector(7 downto 0)
    );
  end component reg_file;

  component alu is
      port(
          a, b : in std_logic_vector(7 downto 0);
          op : in std_logic; --0 = addition, 1 is subtraction.
          sum : out std_logic_vector(7 downto 0)
        );
  end component alu;

  component clk_RisingEdge is
    port(
      clk : in std_logic;
      clk_top : out std_logic
    );
  end component clk_RisingEdge;

signal clk_top, WE, print, wd_sel : std_logic;
signal rs1, rs2, ws : std_logic_vector(1 downto 0);
signal wd, rd1, rd2, sign_ext_imm, ALU_out: std_logic_vector(7 downto 0);

begin
  instReg : reg_file port map(clk_top, we, rs1, rs2, ws, wd, rd1, rd2);
  iALU: ALU port map(rd1, rd2, instr(7), ALU_out);
  RE : clk_RisingEdge port map(clk, clk_top);

  -- assign control signals
  rs2 <= instr(1 downto 0);
  with print select rs1 <=
    instr(3 downto 2) when '0',
    instr(4 downto 3) when others;
  ws <= instr(5 downto 4);


  --mux for selecting ws
  wd_sel <= not(instr(7) and instr(6));
  with wd_sel select wd <=
    sign_ext_imm when '0',
    ALU_out when others;
  we <= instr(7) or instr(6);

  --sign extended immediate
  sign_ext_imm(3 downto 0) <= instr(3 downto 0);
  with instr(3) select sign_ext_imm(7 downto 4) <=
    "1111" when '1',
    "0000" when others;

  print <= not (instr(7) or instr(6) or instr(5));
  --print
  process(clk, print) is
    variable int_val : integer;
    begin
      if((clk'event and clk = '1') and (print = '1')) then
        report integer'image(to_integer(signed(rd1)));
      end if;
  end process;
end architecture structural;

-- rising edge of clk w/ slight delay
library ieee;
use ieee.std_logic_1164.all;

entity clk_RisingEdge is
  port(
    clk : in std_logic;
    clk_top : out std_logic
  );
end entity clk_RisingEdge;

architecture structural of clk_RisingEdge is
begin
  clk_top <= clk after 1 ps; --0 if skip 1, 0 if skip 2, 1 if no skip
end architecture structural;