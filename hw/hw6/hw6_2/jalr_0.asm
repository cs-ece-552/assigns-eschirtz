//A simple example. Ensure the PC takes the value 0x08+0x0A=0x012
//to ensure the jump was successful
NOP
NOP
NOP
NOP
NOP
NOP
LBI	r3, 0x08 
JALR	r3, 0x0A //PC == 0x000d before jump. 
NOP		 //PC should be 0x012 after jump 
NOP
NOP
NOP
NOP
NOP
NOP
NOP
