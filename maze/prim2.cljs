; uses the generic prim min spanning tree algorithm rather than implicitly doing
; it as in the case of prim.cljs and prim.js

; this is a modified version of Algorithms/minimum_spanning_tree.cljs
(defn in-vec? [v x] (some #(= x %) v))

(defn reachable-edges [E R R']
  (for [r R
        r' R'
        :let [pair (sort [r r'])]
        :when (in-vec? E pair)]
    pair))

(defn mst' [E R R' accum]
  (if (empty? R')
    accum
    (let [[n1 n2 :as e_min] (rand-nth (reachable-edges E R R'))]
      (recur E
             (conj R n1 n2)
             (disj R' n1 n2)
             (conj accum e_min)))))

(defn mst [E]
  (let [nodes (set (apply concat E))
        n1 (first nodes)]
     (time (mst' E #{n1} (disj nodes n1) []))))

(defn empty-maze [w h]
  (for [n (range h)
        m (range w)
        t [0 1]
        :when (and (not (and (= t 1)
                             (= n (dec h))))
                   (not (and (= t 0)
                             (= m (dec w)))))]
    (if (= 0 t)
      [[n m] [n (inc m)]]
      [[n m] [(inc n) m]])))

(defn draw-vec [sol w h]
  (concat (repeat w "__")
          ["\n"]
          (map (fn [n]
                 (concat ["|"]
                         (map #(let [down-line (if (in-vec? sol [[n %] [(inc n) %]]) " " "_")]
                                 (str down-line (if (in-vec? sol [[n %] [n (inc %)]]) down-line "|")))
                              (range 0 w))
                         ["\n"]))
               (range 0 h))))

(defn draw [sol w h]
  (->> (draw-vec sol w h)
       (map (partial apply str))
       (apply str)))

(defn draw-maze [w h]
  (println (draw (mst (empty-maze w h)) w h)))

(draw-maze 10 7)
