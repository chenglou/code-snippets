# Minimum Item in Sorted Circular Array

# Assuming items are unique

_recMinInCircularSortedArray = (array, lowerIndex, upperIndex) ->
  arrayLength = upperIndex - lowerIndex + 1

  if arrayLength <= 2
    return Math.min array[lowerIndex], array[upperIndex]

  pivotIndex = Math.floor((lowerIndex + arrayLength) / 2)
  pivot = array[pivotIndex]
  lowerQuarterIndex = Math.floor((lowerIndex + arrayLength) / 4)
  upperQuarterIndex = Math.floor((lowerIndex + arrayLength) / 4 * 3)

  if array[lowerQuarterIndex] > pivot
    return _recMinInCircularSortedArray array, lowerQuarterIndex, pivotIndex

  if array[upperQuarterIndex] < pivot
    return _recMinInCircularSortedArray array, pivotIndex, upperQuarterIndex

  return Math.min(
    _recMinInCircularSortedArray(array, lowerIndex, lowerQuarterIndex),
    _recMinInCircularSortedArray(array, upperQuarterIndex, upperIndex))


minInCircularSortedArray = (array) ->
  _recMinInCircularSortedArray array, 0, array.length - 1

module.exports = minInCircularSortedArray
