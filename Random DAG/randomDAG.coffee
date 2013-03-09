RANDOM_PERCENTAGE_THRESHOLD = 0.3
NUMBER_OF_VERTICES = 4
randomDAG = ->
	for i in [1...NUMBER_OF_VERTICES]
		output = i
		hasEdge = no
		for j in [i + 1..NUMBER_OF_VERTICES]
			if Math.random() < RANDOM_PERCENTAGE_THRESHOLD
				output += ' ' + j
				hasEdge = yes
		console.log output if hasEdge

module.exports = randomDAG
