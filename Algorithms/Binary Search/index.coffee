# Binary Search

iterativeBinarySearch = (item, array) ->
  low = 0
  high = array.length - 1
  while low <= high
    middleIndex = Math.floor((low + high) / 2)
    middle = array[middleIndex]
    if item is middle
      return middleIndex
    else if item < middle
      high = middleIndex - 1
    else
      low = middleIndex + 1
  return -1

_recursiveBinarySearch = (item, array, lowerIndex, upperIndex) ->
  arrayLength = upperIndex - lowerIndex + 1

  if arrayLength < 1 then return -1

  middleIndex = lowerIndex + Math.floor(arrayLength / 2)
  middle = array[middleIndex]

  if item is middle
    return middleIndex
  else if item < middle
    return _recursiveBinarySearch item, array, lowerIndex, middleIndex - 1
  else
    return _recursiveBinarySearch item, array, middleIndex + 1, upperIndex

recursiveBinarySearch = (item, array) ->
  _recursiveBinarySearch item, array, 0, array.length - 1

# who the hell came up with this concept
_continuationBinarySearch = (item, array, lowerIndex, upperIndex, cont) ->
  arrayLength = upperIndex - lowerIndex + 1

  if arrayLength < 1 then cont()
  else
    middleIndex = lowerIndex + Math.floor(arrayLength / 2)
    middle = array[middleIndex]

    if item is middle then middleIndex
    else
      _continuationBinarySearch item, array, lowerIndex, middleIndex - 1, ->
        _continuationBinarySearch item, array, middleIndex + 1, upperIndex, cont

continuationBinarySeach = (item, array) ->
  return _continuationBinarySearch item, array, 0, array.length - 1, -> -1


module.exports =
  iterativeBinarySearch: iterativeBinarySearch
  recursiveBinarySearch: recursiveBinarySearch
  continuationBinarySeach: continuationBinarySeach

