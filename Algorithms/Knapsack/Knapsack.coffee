# Knapsack

# Given a set of items, each with a mass and a value, the item to include in the
# sack to maximize value while staying under a given mass limit

knapsack = (weightArray, valueArray, maxWeight) ->
  # 2 dimensional array to track info. Row = # item, col = current weight
  tracker = [[]]
  for i in [0..maxWeight]
    # fill the first row with 0 for '0th' item. It's a cushion so that we can
    # avoid undefined values later on when checking for 'previous row'
    tracker[0].push 0

  for j in [1..weightArray.length]
    # cushion for first column (0th weight)
    tracker[j] = [0]

  for i in [0...weightArray.length]
    for j in [0..maxWeight]
      if weightArray[i] > j
        tracker[i + 1][j] = tracker[i][j]
      else
        tracker[i + 1][j] = Math.max(
          valueArray[i] + tracker[i][j - weightArray[i]], tracker[i][j])

  return tracker[tracker.length - 1][tracker[0].length - 1]

module.exports = knapsack
