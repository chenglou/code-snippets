; abc -> [abc bca cab]
(defn drop-take [coll a b] (->> coll (drop a) (take b)))

(defn cycle-list-1 [s]
  (let [size (count s)]
    (->> (cycle s)
         repeat
         (map #(drop-take %2 %1 size) (range size)))))

(defn cycle-list-2 [s]
  (let [size (count s)]
    (->> (cycle s)
         (iterate rest)
         (take size)
         (map #(take size %)))))

(defn cycle-list-3 [s]
  (let [size (count s)
        ss (cycle s)]
    (for [i (range size)]
      (drop-take ss i size))))

(defn cycle-list-4 [s]
  (let [size (count s)]
    (->> (cycle s)
         (partition-all size 1)
         (take size))))

;-----------
(assert (= []
           (cycle-list-1 [])
           (cycle-list-2 [])
           (cycle-list-3 [])
           (cycle-list-4 [])))

(assert (= [[1]]
           (cycle-list-1 [1])
           (cycle-list-2 [1])
           (cycle-list-3 [1])))

(assert (= [[1 2 3] [2 3 1] [3 1 2]]
           (cycle-list-1 [1 2 3])
           (cycle-list-2 [1 2 3])
           (cycle-list-3 [1 2 3])))
