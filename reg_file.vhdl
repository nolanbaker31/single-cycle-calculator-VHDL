library ieee;
use ieee.std_logic_1164.all;

entity reg_file is
  port(
    clk, we         : in std_logic := '0';
    rs1, rs2, ws    : in std_logic_vector(1 downto 0);
    wd              : in std_logic_vector(7 downto 0);
    rd1, rd2        : out std_logic_vector(7 downto 0)
  );
end reg_file;

architecture structural of reg_file is

    signal reg0 : std_logic_vector(7 downto 0) := (others => '0'); -- index "00"
    signal reg1 : std_logic_vector(7 downto 0) := (others => '0'); -- index "01"
    signal reg2 : std_logic_vector(7 downto 0) := (others => '0'); -- index "10"
    signal reg3 : std_logic_vector(7 downto 0) := (others => '0'); -- index "11"

    begin
    process(clk) is
    begin

      -- rd1 definition
      register1: case rs1 is
        when "00" => rd1 <= reg0;
        when "01" => rd1 <= reg1;
        when "10" => rd1 <= reg2;
        when "11" => rd1 <= reg3;
        when others => rd1 <= (others => 'X');
      end case register1;

      -- rd2 definition
      register2: case rs2 is
        when "00" => rd2 <= reg0;
        when "01" => rd2 <= reg1;
        when "10" => rd2 <= reg2;
        when "11" => rd2 <= reg3;
        when others => rd2 <= (others => 'X');
      end case register2;
    
    -- set destination register
    if ((clk and WE) ='1') then
        set_wd: case ws is
          when "00" => reg0 <= wd;
          when "01" => reg1 <= wd;
          when "10" => reg2 <= wd;
          when "11" => reg3 <= wd;
          when others => null;
        end case set_wd;
    end if;

    end process;
end structural;
