(defn remove-at [coll i] (concat (take i coll) (drop (+ i 1) coll)))

(defn permute [s]
  (if (empty? s)
    [""]
    (apply concat (map-indexed
                    #(map (partial cons %2) (permute (remove-at s %1)))
                    s))))

(defn permute-word [s] (into #{} (map clojure.string/join (permute s))))

;----------
(assert (= (permute-word "") #{""}))
(assert (= (permute-word "a") #{"a"}))
(assert (= (permute-word "car") #{"cra" "acr" "arc" "rca" "car" "rac"}))
(assert (= (permute-word "caar") #{"aarc" "arca" "arac" "aacr" "cara" "caar"
                                   "craa" "raac" "acra" "rcaa" "acar" "raca"}))
