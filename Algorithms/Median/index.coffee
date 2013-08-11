# Median Finding

# Lazy method: sort and find. O(nlogn).

# Better: divide and conquer. O(n).

select = (array, wantedIndex) ->
  splitter = array[Math.floor(Math.random() * array.length)]
  lowerHalf = []
  middleHalf = []
  upperHalf = []
  for item in array
    if item < splitter then lowerHalf.push item
    else if item > splitter then upperHalf.push item
    else middleHalf.push item
  if lowerHalf.length <= wantedIndex and lowerHalf.length + middleHalf.length > wantedIndex
    return splitter
  else if lowerHalf.length > wantedIndex
    select lowerHalf, wantedIndex
  else
    select upperHalf, wantedIndex - lowerHalf.length - middleHalf.length

median = (array) ->
  length = array.length
  if length is 0 then return undefined
  if length % 2 is 0
    ((select array, length / 2 - 1) + (select array, length / 2) ) / 2
  else select array, Math.floor(length / 2)

module.exports = median
