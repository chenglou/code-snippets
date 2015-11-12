; given a sequence of nums, find an increasing subsequence
; [1 2 1 3 7 4 9 5] -> [1 2 3 7 9]

; naive stateful solution
(defn find-inc-subseq [v]
  (loop [s v
         small (/ -1.0 0.0)
         accum []]
    (if (seq s)
      (let [[head & tail] s]
        (if (<= small head)
          (recur tail head (conj accum head))
          (recur tail small accum)))
      accum)))

; high-order funcs, less performant asympotically but hey...
(defn compact [v] (map first (partition-by identity v)))
(def zip (partial map vector))
(defn fil [[a b]] (>= a b))
(defn incr [v] (map first (filter fil (zip v (rest v)))))
(incr [5 4 6])
(defn find-inc-subseq [v]
  (map first (filter (fn [[a b]] (>= a b)) (map vector v (sort v)))))
(find-inc-subseq [1 2 1 3 7 4 9 5])
(find-inc-subseq [1 1 1])
(find-inc-subseq [])
(find-inc-subseq [9 8 8])

(defn segmentize [cmp coll]
  (let [switch (reductions = true (map cmp coll (rest coll)))]
    (map (partial map first) (partition-by second (map list coll switch)))))
(defn find-inc-subseq [v] (map first (segmentize >= v)))

(reductions = true [false true false false true false true])
[1    2     1     3    7     4     9    5]
[true false false true false false true true]

