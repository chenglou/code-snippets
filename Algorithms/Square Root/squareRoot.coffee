ERROR_MARGIN = Math.pow(10, -10)
squareRoot = (number) ->
	if number < 0 then return
	guess = 1
	loop
		goalRoot = number / guess
		# Using the correct math definition of error margin.
		if Math.abs(goalRoot - guess) < ERROR_MARGIN / 2
			return guess
		else guess = (goalRoot + guess) / 2

module.exports = squareRoot