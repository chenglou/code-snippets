coinsChange = (goalAmount, changeArray) ->
	if goalAmount < 0 then throw new Error("Total amount should be positive.")

	remainingChange = goalAmount
	finalChangeCombination = []

	# Default the change array elements to 0. While at it, check for invalid $0 change.
	for i in [0...changeArray.length]
		if changeArray[i] <= 0 then throw new Error("Invalid change coins found: " + changeArray[i])
		finalChangeCombination[i] = 0

	currentCoinIndex = 0

	changeArray.sort((a, b) -> b - a)

	computeCombination = ->
		while currentCoinIndex < changeArray.length
			finalChangeCombination[currentCoinIndex] = parseInt(remainingChange / changeArray[currentCoinIndex])
			remainingChange -= changeArray[currentCoinIndex] * finalChangeCombination[currentCoinIndex]		
			currentCoinIndex++

	# Do a greedy run to have a quick estimate of coins change using modulo.
	computeCombination()

	currentCoinIndex = changeArray.length - 1

	# Adjust.
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

module.exports = coinsChange