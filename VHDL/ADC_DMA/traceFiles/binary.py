# python function for binary operations
import math

# conversion ffunctions
def toubin(num, length, pre='', spacer=0):
	if num >= math.pow(2,length):
		num = num % (2**length)
	return '{0}{{:{1}>{2}}}'.format(pre, spacer, length).format(bin(num)[2:])

def touhex(num, length, pre='', spacer=0):
	if num >= math.pow(16,length):
		num = num % (16**length)
	return '{0}{{:{1}>{2}}}'.format(pre, spacer, length).format(hex(num)[2:])

def tosbin(num, length, pre='', spacer=0):
	if num < 0 :
		num = (2**length) + num
		return '{0}{{:{1}>{2}}}'.format(pre, spacer, length).format(bin(num)[2:]) 	
	if num >= math.pow(2,length-1):
		num = num % (2**(length-1))
	return '{0}{{:{1}>{2}}}'.format(pre, spacer, length).format(bin(num)[2:])

def touhex1(num, length, pre='', spacer=0):
	if num >= math.pow(16,length):
		num = num % (16**length)
	return (hex(num)[2:])

