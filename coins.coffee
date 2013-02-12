"""
Given a total amount and a few types of coin, find the change
"""

getChange = (goalAmount, changeArray) ->
	remainingChange = goalAmount
	finalChangeCombination = []
	finalChangeCombination[i] = 0 for i in [0...changeArray.length]
	currentCoinIndex = 0

	changeArray.sort((a, b) -> b - a)

	computeCombination = ->
		while currentCoinIndex < changeArray.length
			finalChangeCombination[currentCoinIndex] = parseInt(remainingChange / changeArray[currentCoinIndex])
			remainingChange -= changeArray[currentCoinIndex] * finalChangeCombination[currentCoinIndex]		
			currentCoinIndex++

	computeCombination()

	currentCoinIndex = changeArray.length - 1

	while remainingChange isnt 0 and currentCoinIndex >= 0
		currentCoinIndex -= 1
		remainingChange = goalAmount
		if finalChangeCombination[currentCoinIndex] is 0
			continue
		else
			finalChangeCombination[currentCoinIndex] = finalChangeCombination[currentCoinIndex] - 1

		for i in [0..currentCoinIndex]
			remainingChange -= finalChangeCombination[i] * changeArray[i]

		currentCoinIndex = i + 1
		computeCombination()

	return finalChangeCombination


console.log getChange(8109, [30, 8, 6, 5, 2])
console.log getChange(6, [4, 3, 1]) # Not optimal.