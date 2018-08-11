# create trace file for tbDivider

f = open('tbDivider.txt','w')
f.seek(0)
f.truncate()

fdebug = open('tbDividerDebug.txt','w')
fdebug.seek(0)
fdebug.truncate()

import binary
import random

for i in range(50):
	for j in range(5):
		a = random.randint(0,((2**16)-1))
		b = random.randint(0,((2**16)-1))
		q = int(a/b)
		r = a%b
		qbin = binary.toubin(q,16)
		rbin = binary.toubin(r,16)
		abin = binary.toubin(a,16)
		bbin = binary.toubin(b,16)	
		
		fdebug.write(str(a) + " " + str(b) + " " + str(q) + " " + str(r) + "\n")
		f.write(abin + " " + bbin + " " + qbin + " " + rbin + "\n")
f.close()
fdebug.close()
