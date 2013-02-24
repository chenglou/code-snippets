minimumNumber = (input) ->
	# For input of length n, 0 <= the minimum element <= n
	minimumNumberTracker = []

	# Include mininumTracker[inputLength]
	for i in [0..input.length]
		minimumNumberTracker[i] = false
	
	for item in input
		if 0 <= item <= input.length then minimumNumberTracker[item] = true

	for item, i in minimumNumberTracker
		if !item then return i
	
	

module.exports = minimumNumber