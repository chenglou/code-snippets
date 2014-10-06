(defn interleave2 [[x & xs :as X] [y & ys :as Y] f]
  (cond
    (nil? x) Y
    (nil? y) X
    :else (if (f x y)
            (cons x (interleave2 xs Y f))
            (cons y (interleave2 X ys f)))))

(defn merge-sort [arr]
  (if (<= (count arr) 1)
    arr
    (let [[left right] (split-at (/ (count arr) 2) arr)]
      (interleave2 (merge-sort left) (merge-sort right) #(< %1 %2)))))

;----------
(assert (= (merge-sort []) []))
(assert (= (merge-sort [2 1]) [1 2]))
(assert (= (merge-sort [1 3 2]) [1 2 3]))
(assert (= (merge-sort [5 3 1]) [1 3 5]))
(assert (= (merge-sort [1 1 1]) [1 1 1]))
