(defn bin-search-impl [arr item start end]
  (let [mid (.floor js/Math (/ (+ start end) 2))]
    (cond
      (< end start) -1
      (= item (arr mid)) mid
      (< item (arr mid)) (bin-search-impl arr item start (- mid 1))
      :else (bin-search-impl arr item (+ mid 1) end))))

(defn bin-search [arr item] (bin-search-impl arr item 0 (- (count arr) 1)))

;--------------
(assert (= (bin-search [1 3 5 7 9] 0) -1))
(assert (= (bin-search [1 3 5 7 9] 1) 0))
(assert (= (bin-search [1 3 5 7 9] 5) 2))
(assert (= (bin-search [1 3 5 7 9] 9) 4))
(assert (= (bin-search [1 3 5 7 9] 99) -1))
(assert (= (bin-search [] 1) -1))
