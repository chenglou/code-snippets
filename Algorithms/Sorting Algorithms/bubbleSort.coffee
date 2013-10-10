# Bubble Sort

bubbleSort = (array) ->
  swapped = yes
  until not swapped
    swapped = no
    for i in [0...array.length - 1]
      if array[i] > array[i + 1]
        swapped = yes
        [array[i], array[i + 1]] = [array[i + 1], array[i]]

  return array

module.exports = bubbleSort
