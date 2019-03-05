//Show that andn'ing with 0x0000 will result in the same value repeating
//op1 = 0xbeef, op2=0xffff. Result = 0xbeef 
lbi	r1, 0xbeef
lbi	r2, 0x0000
andn	r3, r1, r2
