//Test to ensure that negative sign extended value will be used
//properly. Ensure jump happened correctly. 
NOP
LBI	r3, 0x0020	//0x0020 = 32	
JALR	r3, 0xf0	//0xf0 == -16
NOP			//PC should be at 0x10
NOP
NOP
NOP
NOP
NOP
NOP
NOP
