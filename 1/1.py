
fin = open('beautiful_stringstxt.txt', 'r')
fout = open('output.txt', 'w')

numberOfCases = int(fin.readline().strip())

lineCount = 1
for line in fin:
	lettersFrequency = [0] * 26
	totalValue = 0
	
	for i in line:
		asciiValue = ord(i)
		realValue = 0
		if (asciiValue >= 65 and asciiValue <= 90):
			realValue = asciiValue - 65
		elif (asciiValue >= 97 and asciiValue <= 122):
			realValue = asciiValue - 97
		else:
			continue


		lettersFrequency[realValue] = lettersFrequency[realValue] + 1

	lettersFrequency.sort()
	for j in range(25, -1, -1):
		totalValue += lettersFrequency[j] * (j + 1)

	fout.write("Case #%d: %d" %(lineCount, totalValue))
	if lineCount != numberOfCases:
		fout.write('\n')
	
	lineCount += 1
	
fin.close()
fout.close()