//Verify the PC uses all 11 bits of the immeadite when it jumps. 
//Final PC ?= 0x00f
NOP
NOP
NOP
NOP
NOP
NOP	// PC = 0x00c at this point 
JAL	0x7ff //PC +2 + -1 = 0x00d
