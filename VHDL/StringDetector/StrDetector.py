# create files for scan chain and test bench of string detector

ftb = open ('tbStrDetector.txt', 'w')
ftb.seek (0)
ftb.truncate()

fdbug = open ('debug.txt', 'w')
fdbug.seek (0)
fdbug.truncate()

fsc = open ('scStrDetector.txt', 'w')
fsc.seek (0)
fsc.truncate()

import binary
import random

fsc.write("SDR 7 TDI(20) 1 TDO(0) MASK(1)" + "\n")
fsc.write("RUNTEST 1 MSEC"+ "\n") 

instr = "knife   bomb    gun terror  gun"

def char_to_vec(char):
	if char == " " :
		num = 27
	else :
		num = ord(char)-96
	return binary.toubin(num,5)

def char_to_scinH(char):
	if char == " " :
		num = 27+64
	else :
		num = (ord(char)-96)+(64)
	return binary.touhex(num,2)

def char_to_scinL(char):
	if char == " " :
		num = 27
	else :
		num = (ord(char)-96)
	return binary.touhex(num,2)

state = [0,0,0,0]

for i in range(len(instr)):
	xtb = char_to_vec(instr[i])
	xscH = char_to_scinH(instr[i])
	xscL = char_to_scinL(instr[i])
	out = [0,0,0,0,]
	
	if state[0] == 0 and instr[i] == 'b':
		state[0] = 1
	elif state[0] == 1 and instr[i] == 'o':
		state[0] = 2
	elif state[0] == 2 and instr[i] == 'm':
		state[0] = 3
	elif state[0] == 3 and instr[i] == 'b':
		state[0] = 1
		out[0] = 1	 

	if state[1] == 0 and instr[i] == 'g':
		state[1] = 1
	elif state[1] == 1 and instr[i] == 'u':
		state[1] = 2
	elif state[1] == 2 and instr[i] == 'n':
		state[1] = 0
		out[1] = 1	

	if state[2] == 0 and instr[i] == 'k':
		state[2] = 1
	elif state[2] == 1 and instr[i] == 'n':
		state[2] = 2
	elif state[2] == 2 and instr[i] == 'i':
		state[2] = 3
	elif state[2] == 3 and instr[i] == 'f':
		state[2] = 4
	elif state[2] == 4 and instr[i] == 'e':
		state[2] = 0
		out[2] = 1	

	if state[3] == 0 and instr[i] == 't':
		state[3] = 1
	elif state[3] == 1 and instr[i] == 'e':
		state[3] = 2
	elif state[3] == 2 and instr[i] == 'r':
		state[3] = 3
	elif state[3] == 3 and instr[i] == 'r':
		state[3] = 4
	elif state[3] == 4 and instr[i] == 'o':
		state[3] = 5
	elif state[3] == 5 and instr[i] == 'r':
		state[3] = 0
		out[3] = 1	

	y = (out[0] or out[1] or out[2] or out[3])

## file printing

	ftb.write(xtb + " " + str(y) + "\n")	
	
	fsc.write("SDR 7 TDI(" + xscL + ") 1 TDO(" + str(y) + ") MASK(1)" + "\n")
	fsc.write("RUNTEST 1 MSEC"+ "\n") 
	fsc.write("SDR 7 TDI(" + xscH + ") 1 TDO(" + str(y) + ") MASK(1)" + "\n")
	fsc.write("RUNTEST 1 MSEC"+ "\n") 

	fdbug.write(instr[i] + " " + str(state) + " " + str(y) + "\n")

ftb.close()
fsc.close()
fdbug.close() 

