# Longest Increasing Subsequence

# Find the longest subsequence of a sequence in which the subsequence elements
# are in non-decreasing order. The subsequence is not necessarily contiguous or
# unique.

longestIncreasingSubsequence = (array) ->
  if not array.length
    return 0

  # `lengthTracker` will have the same length than `array`. Each cell tracks the
  # max subsequence length at which the corresponding cell value in `array`
  # arrived at
  lengthTracker = []
  for i in [0...array.length]
    # init the length to 1, for the value `array[i]` itself as a subsequence
    lengthTracker[i] = 1

    for j in [0...i]
      if array[j] <= array[i] and lengthTracker[j] >= lengthTracker[i]
        lengthTracker[i] = lengthTracker[j] + 1

  # got all the lengths, check the longest one
  maxLength = 1
  for length in lengthTracker
    if length > maxLength then maxLength = length

  return maxLength

module.exports = longestIncreasingSubsequence
