//This test will check the case where one operand is flipped from all 1s to 0s.
//This test shows that this is not performing a nand operation. 0 and 0 will be
//false
lbi	r1, 0x0000
lbi	r2, 0x0000
andn	r3, r2, r1
