longestCommonSequence = (input1, input2) ->
	output = []
	index2 = 0
	for i in [0...input1.length]
		j = index2
		for j in [index2...input2.length]
			if input1[i] is input2[j]
				output.push input1[i]
				i++
				index2 = j + 1
	return output

module.exports = longestCommonSequence
