# trace file for ADCC

f = open('tbADCC.txt','w')
f.seek(0)
f.truncate()

import binary
import random

for i in range(256):
	bin = binary.toubin(i,8)
	
	f.write(bin + "\n")
f.close()