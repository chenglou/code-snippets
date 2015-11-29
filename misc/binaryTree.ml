(* Fully persistent, Not tail-recurse *)
type 'a binaryTree = Empty | Leaf of 'a * ('a binaryTree) * ('a binaryTree);;

 let rec insert node t = match t with
| Empty -> Leaf (node, Empty, Empty)
| Leaf (x, y, z) ->
  if node < x then Leaf (x, insert node y, z)
  else Leaf (x, y, insert node z);;

let rec findMin t = match t with
| Empty -> None
| Leaf (x, Empty, _) -> Some x
| Leaf (x, y, _) -> findMin y;;

let rec findMax t = match t with
| Empty -> None
| Leaf (x, _, Empty) -> Some x
| Leaf (x, _, z) -> findMax z;;

let rec delete node t = match t with
| Empty -> Empty
| Leaf (x, y, z) ->
  if node = x then match findMin z with
    | None -> y
    | Some min -> Leaf (min, y, delete min z)
  else if node < x then Leaf (x, delete node y, z)
  else Leaf (x, y, delete node z);;

let rec count t = match t with
| Empty -> 0
| Leaf (x, y, z) -> 1 + count y + count z;;

(* tests *)

let a = Leaf (5, Leaf (3, Empty, Empty), Leaf (7, Empty, Empty));;
let b = Leaf (5, Leaf (3, Empty, Leaf (4, Empty, Empty)), Leaf (7, Empty, Empty));;
let repeat = Leaf (5, Leaf (3, Empty, Empty), Leaf (7, Leaf (5, Empty, Empty), Empty));;
let single = Leaf (1, Empty, Empty);;

assert (insert 4 a = b);;
assert (insert 5 a = repeat);;
assert (insert 1 Empty = single);;

assert (findMin single = Some 1);;
assert (findMin a = Some 3);;
assert (findMin (insert 1 a) = Some 1);;

assert (findMax single = Some 1);;
assert (findMax a = Some 7);;
assert (findMax (insert 9 a) = Some 9);;

assert (delete 4 a = a);;
assert (delete 5 a = Leaf (7, Leaf (3, Empty, Empty), Empty));;
assert (delete 3 a = Leaf (5, Empty, Leaf (7, Empty, Empty)));;
assert (delete 7 a = Leaf (5, Leaf (3, Empty, Empty), Empty));;
assert (delete 4 b = a);;
assert (delete 5 repeat = a);;
assert (delete 5 (delete 7 a) = Leaf (3, Empty, Empty));;

assert (count a = 3);;
assert (count b = 4);;
assert (count single = 1);;
