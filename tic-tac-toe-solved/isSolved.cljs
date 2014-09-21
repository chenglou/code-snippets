(def sols [[[0 0] [0 1] [0 2]]
           [[1 0] [1 1] [1 2]]
           [[2 0] [2 1] [2 2]]
           [[0 0] [1 0] [2 0]]
           [[0 1] [1 1] [2 1]]
           [[0 2] [1 2] [2 2]]
           [[0 0] [1 1] [2 2]]
           [[0 2] [1 1] [2 0]]])

(def testa [[0 1 1]
            [0 1 0]
            [1 2 2]])

(def testa2 [[2 1 1]
             [2 1 0]
             [2 0 2]])

(def testa3 [[0 1 1]
             [0 1 0]
             [2 0 2]])

(def testa4 [[2 1 1]
             [1 1 2]
             [2 2 1]])

(defn _isSolved [b n]
  (some #(let [c0 (get-in b [((% 0) 0) ((% 0) 1)])
                c1 (get-in b [((% 1) 0) ((% 1) 1)])
                c2 (get-in b [((% 2) 0) ((% 2) 1)])]
           (= c0 c1 c2 n))
        sols))

(defn has0 [b] (some (fn [r] (some #(= % 0) r)) b))

(defn isSolved [b]
  (let [win1 (_isSolved b 1)
        win2 (_isSolved b 2)]
    (cond
      win1 1
      win2 2
      (has 0) -1
      :else 0)))

(isSolved testa) ;1
(isSolved testa2) ;2
(isSolved testa3) ;-1
(isSolved testa4) ;0
