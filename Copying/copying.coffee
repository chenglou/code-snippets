fs = require 'fs'

copying = ->
	input = fs.readFileSync('input.txt', 'utf8').split(' ')
	# Number of computers: n. Number of cables: k.
	n = parseInt(input[0])
	k = parseInt(input[1])
	# Total number of computers increase exponentially until number of cables fall short.
	# Step after which they fall short:
	s = Math.ceil(Math.log(k) / Math.log(2)) + 1
	# After that, linear growth. Add k cables each time until the total exceeds n
	# Number of steps needed:
	m = Math.ceil((n + 1 - Math.pow(2, s)) / k)
	# Total number of hours:
	output = m + s

	fs.writeFileSync('output.txt', output)

module.exports = copying