# Check Whether Array Circularly Sorted

_removeConseqDupes = (arr) ->
  lastItemVal = arr[0]
  arrToReturn = [lastItemVal]
  for i in [1...arr.length]
    continue if arr[i] is lastItemVal
    arrToReturn.push arr[i]
    lastItemVal = arr[i]

  return arrToReturn

checkCircularSortedArray = (arrayArg) ->
  return no if !arrayArg.length

  arr = _removeConseqDupes arrayArg
  # anything of length from 1 to 3 is obligatorily circularly sorted
  return yes if arr.length < 4

  # detect circularity means allowing one chance of fall during climb (or climb
  # during fall, if descending order). Call it 'broken'
  broken = no

  if arr[0] < arr[1] < arr[2] then initiallyAscending = yes
  else if arr[0] > arr[1] > arr[2] then initiallyAscending = no
  else initiallyAscending = arr[1] < arr[2] < arr[3]

  for i in [0...arr.length - 1]
    nowAscending = arr[i] < arr[i + 1]
    if nowAscending isnt initiallyAscending
      return no if broken
      broken = yes

  if broken
    # [2,1,2,1] taken care of here. [1,2,1,2] hackishly taken care of when first
    # assigning `initiallyAAscending`
    return no if not initiallyAscending and arr[arr.length - 1] < arr[0]

  return yes

module.exports = checkCircularSortedArray
