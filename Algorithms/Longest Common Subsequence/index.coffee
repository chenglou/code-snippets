# Longest Common Subsequence of Two Sequences

# Find the longest subsequence common to two sequences.

longestCommonSubsequence = (array1, array2) ->
  return 0 if array1.length is 0 or array2.length is 0

  # create a grid to keep track of the longest common subsequence at the step
  # (i, j). It's a 2 dimensional array of (i + 1, j + 1), where the first row
  # and column are just 0s to avoid errors when checking `i - 1` or `j - 1`
  # later when we need to
  tracker = [[]];
  for i in [0..array1.length]
    tracker[0].push 0

  for j in [1..array2.length]
    tracker[j] = [0]

  for i in [0...array2.length]
    for j in [0...array1.length]
      # init tracker cell in the current row. Remember: row and column 0 are
      # cushion rows
      tracker[i + 1][j + 1] = 0

      # if the current compared letters are the same, the longest subssequence
      # is the length of the subsequence with these two letters removed, + 1. As
      # if we're trying to find the subsequence if the two sequences were cut
      # off before the current two letters.
      if array1[j] is array2[i]
        tracker[i + 1][j + 1] = 1 + tracker[i][j]
      # if not, pretend to remove sequence 1's current letter, or sequence 2
      # current letter. The current length is the bigger of these two
      else
        tracker[i + 1][j + 1] = Math.max tracker[i][j + 1], tracker[i + 1][j]

  return tracker[tracker.length - 1][tracker[0].length - 1]

module.exports = longestCommonSubsequence
