run: calculator
	ghdl -r tb
calculator:
	ghdl -a --ieee=standard reg_file.vhdl
	ghdl -a --ieee=standard ALU.vhdl
	ghdl -a --ieee=standard calculator.vhdl
	ghdl -a --ieee=standard tb.vhdl
	ghdl -e --ieee=standard tb