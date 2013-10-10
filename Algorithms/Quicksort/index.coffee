# Quicksort

quicksort = (array) ->
  return [] if array.length is 0

  pivotIndex = Math.floor Math.random() * array.length
  pivot = array[pivotIndex]
  # swap pivot to the first position to get it out of the way
  [array[0], array[pivotIndex]] = [array[pivotIndex], array[0]]
  smallerArray = []
  biggerArray = []

  for i in [1...array.length]
    if array[i] < pivot then smallerArray.push array[i]
    else biggerArray.push array[i]

  return quicksort(smallerArray).concat [pivot], quicksort biggerArray

module.exports = quicksort
