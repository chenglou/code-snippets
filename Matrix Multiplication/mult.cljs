(defn transpose [s] (apply (partial map vector) s))

(defn mult [a b]
  {:pre [(= (count (a 0)) (count b))]
   :post [(= (count %) (count a) (count (b 0)))]}

  (map (fn [ar] (map #(apply + (map * ar %)) (transpose b)))
       a))

(def a [[1 2]])
(def b [[3] [4]])
(def c [[1 2] [3 4]])
(def d [[1 2 3] [4 5 6]])
(def e [[1 2] [3 4] [5 6]])

(= (mult a b) [[11]])
(= (mult c c) [[7 10]
               [15 22]])
(= (mult d e) [[22 28]
               [49 64]])
(= (mult e d) [[9 12 15]
               [19 26 33]
               [29 40 51]])
(clojure.test/is (thrown? Error (mult a a)))
