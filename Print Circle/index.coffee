# Print a circle using '#' and '.'

printCircle = (r) ->
  # naive printing will result in an oval that's higher than large bc the line
  # height of console > letter width
  # basically, draw an oval that stretches horizontally to counterbalance. The
  # stretch factor is around 2

  # circle (oval, see above) in 1st quadrant, tangent to axis x and y for easier
  # manip
  # equation (x - r - 4)^2/(4 * r^2) + (y - r)^2/r^2 = 1
  for y in [r * 2..0]
    # isolate x
    intermediateStep = 2 * Math.sqrt(r * r - (y - r) * (y - r))
    possibleX = intermediateStep + r * 2
    possibleX2 = -intermediateStep + r * 2

    for x in [0..r * 4]
      if Math.floor(possibleX) is x or Math.ceil(possibleX2) is x
        process.stdout.write '#'
      else if Math.ceil(possibleX) is x or Math.floor(possibleX2) is x
        process.stdout.write '.'
      else
        process.stdout.write ' '

    process.stdout.write '\n'

# printCircle 0
# printCircle 1
# printCircle 2
# printCircle 6

module.exports = printCircle
