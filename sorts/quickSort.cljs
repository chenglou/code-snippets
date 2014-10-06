(defn quick-sort [arr]
  (if (<= (count arr) 1)
    arr
    (let [p (rand-nth arr)
          small (filter #(< % p) arr)
          eq (filter #(= % p) arr)
          big (filter #(> % p) arr)]
      (concat (quick-sort small) eq (quick-sort big)))))

;----------
(assert (= (quick-sort []) []))
(assert (= (quick-sort [2 1]) [1 2]))
(assert (= (quick-sort [1 3 2]) [1 2 3]))
(assert (= (quick-sort [5 3 1]) [1 3 5]))
(assert (= (quick-sort [1 1 1]) [1 1 1]))
