let rec binSearch' start stop item arr =
  if stop < start then None
  else
    let mid = (start + stop) / 2 in
    let candidate = arr.(mid) in
      if candidate = item then Some mid
      else if candidate < item then binSearch' (mid + 1) stop item arr
      else binSearch' mid stop item arr;;

let binSearch item arr = binSearch' 0 (Array.length arr - 1) item arr;;

assert (binSearch 1 [|-1; 0; 1; 2; 3|] = Some 2);;
assert (binSearch 5 [|-1; 0; 1; 2; 3|] = None);;
assert (binSearch 5 [||] = None);;
assert (binSearch 2 [|1|] = None);;
assert (binSearch 1 [|1|] = Some 0);;
assert (binSearch 2 [|1; 2|] = Some 1);;
