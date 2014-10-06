function quickSort(arr) {
  quickSortImpl(arr, 0, arr.length - 1);
}

function quickSortImpl(arr, i, k) {
  if (i < k) {
    var p = partition(arr, i, k);
    quickSortImpl(arr, i, p - 1);
    quickSortImpl(arr, p + 1, k);
  }
}

function choosePivotIndex(arr, left, right) {
  return Math.floor(Math.random() * (right - left + 1)) + left;
}

function swap(arr, a, b) {
  var temp = arr[a];
  arr[a] = arr[b];
  arr[b] = temp;
}

function partition(arr, left, right) {
  var pivotIndex = choosePivotIndex(arr, left, right);
  var pivotValue = arr[pivotIndex];
  swap(arr, pivotIndex, right);

  var storeIndex = left;
  for (var i = left; i < right; i++) {
    if (arr[i] < pivotValue) {
      swap(arr, i, storeIndex);
      storeIndex++;
    }
  }
  swap(arr, storeIndex, right);

  return storeIndex;
}

var a = [];
var b = [2, 1];
var c = [1, 3, 2];
var d = [5, 3, 1];
var e = [1, 1, 1];

quickSort(a);
console.log(a);

quickSort(b);
console.log(b);

quickSort(c);
console.log(c);

quickSort(d);
console.log(d);

quickSort(e);
console.log(e);
