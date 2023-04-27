# single-cycle-calculator-VHDL

Calculator that can add/sub & print.

Successfully implemented on Zybo Z7 board. 

Specification:
The calculator should have 9 input ports (think the inputs as “buttons” or “switches”) in total, with the option of an additional “reset” input. You
should implement the 8-bit ISA you designed in the first lab on the board. The 8-bit instruction words should be mapped to 8 of the 9 inputs, and you should use one of the inputs for clock signal. You can choose to include an optional “RESET” input to your calculator entity. Remember that your ISA is required to have a display instruction. For that instruction, the content should be displayed on screen. Note: the display instruction is the ONLY operation that outputs anything on the screen. No hacking printout from your calculator internal is allowed. All numbers are displayed in decimal format with 4-digit, even though the operands are read from the input ports as binary numbers. For example, if the content to display is “0101”, the 4-digit display should read as “[empty] [empty] [empty] 5”. You should adapt your implementation of the ALU from the previous lab in this work. You can make necessary and reasonable changes to your code. The subtract operation might produce negative results, and you should display the result as negative. For example, if the two inputs are “0010” and “1111”, when the “add” function is invoked, the display should read “[empty] [empty]17”. For the same inputs, when the “sub” function is invoked, the display should read “[empty] – 1 3”

![image](https://user-images.githubusercontent.com/61514629/234934886-4eb988c7-0cb5-437e-93ce-11dade9592db.png)
