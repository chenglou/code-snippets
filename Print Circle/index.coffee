# Print a Circle Using '#' and '.'

# naive printing will result in an oval that's higher than large bc the line
# height of console > letter width
# basically, draw an oval that stretches horizontally to counterbalance. The
# stretch factor is around 2
STRETCH_FACTOR = 2

printCircle = (r) ->
  return if r is 0
  # circle (oval, see above) in 1st quadrant, tangent to axis x and y for easier
  # manip, equation:
  # (x - r - STRETCH_FACTOR)^2 / (STRETCH_FACTOR^2 * r^2) + (y - r)^2 / r^2 = 1
  for y in [r * 2..0]
    # isolate x
    intermediateStep = STRETCH_FACTOR * Math.sqrt(r * r - (y - r) * (y - r))
    xPos = intermediateStep + r * STRETCH_FACTOR
    xPos2 = -intermediateStep + r * STRETCH_FACTOR

    for x in [0..r * 2 * STRETCH_FACTOR]
      if Math.floor(xPos) is x or Math.ceil(xPos2) is x
        process.stdout.write '#'
      else if Math.ceil(xPos) is x or Math.floor(xPos2) is x
        process.stdout.write '.'
      else
        process.stdout.write ' '

    process.stdout.write '\n'

# printCircle 0
# printCircle 1
# printCircle 2
# printCircle 6

module.exports = printCircle
