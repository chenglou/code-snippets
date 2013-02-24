# For input of length n, 0 <= the minimum element <= n
minimumNumber = (input) ->
	minimumNumberTracker = []

	# Include mininumTracker[inputLength], thus length + 1 elements
	minimumNumberTracker = new Array(input.length + 1)

	for item in input
		if 0 <= item <= input.length then minimumNumberTracker[item] = true

	for item, i in minimumNumberTracker
		if !item then return i

module.exports = minimumNumber