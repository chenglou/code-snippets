; Prim's algorithm.

; let E, list of edges in graph
;     R, set of visited nodes. Has one random initial node
;     R', set of unvisited nodes

; greedily find minimum weight edge e_min=(n1, n2) such that n1 E R and n2 E R'
; move n2 from R' to R
; keep e_min. Repeat til every node is reached

(defn reachable-edges [E R R']
  (for [r R
        r' R'
        :let [pair (sort [r r'])]
        :when (contains? E pair)]
    pair))

(defn mst' [E R R' accum]
  (if (empty? R')
    accum
    (let [[n1 n2 :as e_min] (apply min-key E (reachable-edges E R R'))]
        (recur E
               (conj R n1 n2)
               (disj R' n1 n2)
               (conj accum e_min)))))

(defn mst [E]
  (let [nodes (set (mapcat first E))
        n1 (first nodes)]
    (mst' E #{n1} (disj nodes n1) [])))

; -----------
(def a {[:a :b] 1})

(def b {[:a :b] 1
        [:a :c] 9
        [:b :c] 2})

(def c {[:a :b] 1
        [:a :d] 4
        [:a :e] 3
        [:b :d] 4
        [:b :e] 2
        [:c :e] 4
        [:c :f] 5
        [:d :e] 4
        [:e :f] 7})

(assert (= (mst a) [[:a :b]]))
(assert (= (mst b) [[:b :c] [:a :b]]))
(assert (= (mst c) [[:b :e] [:a :b] [:a :d] [:c :e] [:c :f]]))
