# create trace file for tbGCD2
f = open('tbGCD2.txt','w')
f.seek(0)
f.truncate()

fdebug = open('tbGCD2Debug.txt','w')
fdebug.seek(0)
fdebug.truncate()

import binary
import random
from fractions import gcd

for i in range(50):
	for j in range(5):
		a = random.randint(0,((2**16)-1))
		b = random.randint(0,((2**16)-1))
		g = gcd(a,b)
		gbin = binary.toubin(g,16)
		abin = binary.toubin(a,16)
		bbin = binary.toubin(b,16)

		fdebug.write(str(a) + " " + str(b) + " " + str(g) + "\n")
		f.write(abin + " " + bbin + " " + gbin + "\n")
f.close()
fdebug.close()
