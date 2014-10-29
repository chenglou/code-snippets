(defn flip-edges [g]
  (reduce (fn [acc [node tos]]
            (reduce #(assoc %1 %2 (conj (%1 %2) node))
                    acc
                    tos))
          (zipmap (keys g) (repeat []))
          g))

; -----------
(def a {:a [:a]})

(def b {:a [:c]
        :b [:c]
        :c []})

(def c {:a [:c :b]
        :b [:d :c]
        :c [:d]
        :d []})

(assert (= {} (flip-edges {})))

(assert (= a (flip-edges a)))

(assert (= {:c [:a :b]
            :b []
            :a []}
           (flip-edges b)))

; dest nodes order actually not ordered; works here by coincidence/convenience
(assert (= c (flip-edges (flip-edges c))))
