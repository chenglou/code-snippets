; Braid maze with Prim's algorithm
; http://weblog.jamisbuck.org/2011/1/10/maze-generation-prim-s-algorithm

; this is a literal port of the js version. Probably not idiomatic clojure but
; still interesting as a comparison

(defn is-visited [{:keys [u d l r]}] (or u d l r))

(defn find-visited-in-surrounding [maze x y]
  (let [[up-x up-y :as up] [x (dec y)]
        [down-x down-y :as down] [x (inc y)]
        [left-x left-y :as left] [(dec x) y]
        [right-x right-y :as right] [(inc x) y]]
    (cond-> []
            (is-visited (get-in maze [up-y up-x])) (conj up)
            (is-visited (get-in maze [down-y down-x])) (conj down)
            (is-visited (get-in maze [left-y left-x])) (conj left)
            (is-visited (get-in maze [right-y right-x])) (conj right))))

(defn find-frontiers [maze]
  (for [i (range (count maze))
        j (range (count (maze 0)))
        :let [cell (get-in maze [i j])]
        :when (and (not (is-visited cell))
                   (seq (find-visited-in-surrounding maze j i)))]
    [j i]))

(defn find-shared-wall [x1 y1 x2 y2]
  (cond
    (and (= x1 x2) (< y1 y2)) :d
    (= x1 x2) :u
    (and (= y1 y2) (< x1 x2)) :r
    :else :l))

(defn draw-vec [maze]
  (concat (repeat (count (maze 0)) "__")
          ["\n"]
          (map (fn [row]
                 (concat ["|"]
                         (map #(let [down-line (if (% :d) " " "_")]
                                 (str down-line (if (% :r) down-line "|")))
                              row)
                         ["\n"]))
               maze)))

(defn draw [maze]
  (->> maze
       draw-vec
       (map (partial apply str))
       (apply str)))

(defn empty-maze [w h]
  (->> {:u false :d false :l false :r false}
       (repeat w)
       vec
       (repeat h)
       vec))

(defn draw-maze [w h]
  (let [open-right (> 0.5 (rand))
        maze (atom (assoc-in (empty-maze w h) [0 0] {:u false :d (not open-right) :l false :r open-right}))
        frontiers (atom (find-frontiers @maze))
        opposite {:u :d, :d :u, :l :r, :r :l}]
    (while (pos? (count @frontiers))
      (let [[f0 f1] (rand-nth @frontiers)
            [a0 a1] (rand-nth (find-visited-in-surrounding @maze f0 f1))
            orientation (find-shared-wall f0 f1 a0 a1)]
        (swap! maze assoc-in [f1 f0 orientation] true)
        (swap! maze assoc-in [a1 a0 (opposite orientation)] true)
        (swap! frontiers (fn [_] (find-frontiers @maze)))))
  (println (draw @maze))))

(draw-maze 10 7)
