# Binary Search

    binarySearch = (item, array) ->
        low = 0
        high = array.length - 1
        while low <= high
            middleItemIndex = Math.floor((low + high) / 2)
            middleItem = array[middleItemIndex]
            if item is middleItem
                return middleItemIndex
            else if item < middleItem
                high = middleItemIndex - 1
            else
                low = middleItemIndex + 1
        return -1

    module.exports = binarySearch
