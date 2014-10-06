; we're cheating with laziness here by assuming that `map` executes as far as
; `drop-while` go. Or else we'd get `visited` inconsistency for over-visiting.
; Then again, `visited` is already not referentially transparent, so we have
; bigger concerns than getting tricked by laziness anyways

(defn dfs-impl [g node visited]
  (cond
    (@visited node) []
    (= node :end) [:end]
    :else (do
            (swap! visited conj node)
            (let [tos (map #(dfs-impl g % visited) (g node))
                  valid-res (drop-while empty? tos)]
              (if (empty? valid-res)
                []
                (cons node (first valid-res)))))))

(defn dfs [g] (dfs-impl g :start (atom #{})))

;----------
(assert (= [:start :end] (dfs {:start [:end]
                               :end   []})))

(assert (= [:start :a :end] (dfs {:start [:a]
                                  :a     [:end]
                                  :end   []})))

(assert (= [:start :a :b :end] (dfs {:start [:a :b]
                                     :a     [:b :end]
                                     :b     [:a :end]
                                     :end   []})))
