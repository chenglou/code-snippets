(defn in? [coll a] (contains? (set coll) a))

(defn get-froms [g to]
  (remove nil? (map (fn [each-tos from] (if (in? each-tos to) from))
                    (vals g)
                    (keys g))))

(defn flip-edges [g]
  (let [froms (keys g)]
    (zipmap froms (map #(get-froms g %) froms))))

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
