//This just shows the functionality of the andn. 
//After inversion, op1 = 0xa0a1 and op2=0xfffe
//Result should be 0xa0a0
lbi	r1, 0xa0a1
lbi	r2, 0x0001
andn	r3, r1, r2
