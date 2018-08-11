# trace file for gcd8

f = open('tbGCD8.txt','w')
f.seek(0)
f.truncate()

fdebug = open('tbGCD8Debug.txt','w')
fdebug.seek(0)
fdebug.truncate()

import binary
import random
from fractions import gcd
a = [1,2,3,4,5,6,7,8]
abin = [" "]*8

for i in range(50):
	for j in range(8):
		a[j] = random.randint(0,((2**16)-1))
	g = a[0]
	for j in range(8):
		g = gcd(g,a[j])
	for j in range(8):
		abin[j] = binary.toubin(a[j],16)
	gbin = binary.toubin(g,16)

	f.write(abin[0] +  " " + abin[1] +  " " + abin[2] +  " " + abin[3] +  " " + abin[4] +  " " + abin[5] +  " " + abin[6] +  " " + abin[7] +  " " + gbin + "\n")
	fdebug.write(str(a[0]) + " " + a[1] + " " + a[2] + " " + a[3] + " " + a[4] + " " + a[5] + " " + a[6] + " " + a[7] + " " + g + "\n")
f.close()
fdebug.close()

