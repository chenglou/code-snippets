# Weighted Interval Scheduling

# The goal is to maximize the active time.

# **Insight:** let p(n) be the nearest task before n that doesn't overlap it,

# * Task n either belong in the optimal solution or doesn't.

# * If task n belongs to the optimal solution, then tasks {1...p(n)} also belong;
# or else, we could have replaced that range with a better one, without
# overlapping n.

# * If n didn't belong, the optimal active time is equal to the one consisting of
# {1...n - 1}

# Basically, optimal(n) = max(n's duration + optimal(p(n)), optimal(n - 1))

recursivelySchedule = (taskNo, tasks, memoizer = {}) ->
  if taskNo is 0 then 0
  else if memoizer[taskNo]? then memoizer[taskNo]
  else
    memoizer[taskNo] = Math.max tasks[taskNo].duration +
      recursivelySchedule(tasks[taskNo].previousNonOverlappingTask, tasks,
        memoizer),
      recursivelySchedule taskNo - 1, tasks, memoizer

iterativelySchedule = (taskNo, tasks) ->
  tracker = [0]
  for i in [1..taskNo]
    tracker[i] = Math.max tasks[i].duration +
      tracker[tasks[i].previousNonOverlappingTask], tracker[i - 1]
  return tracker[tracker.length - 1]

module.exports =
  recursivelySchedule: recursivelySchedule
  iterativelySchedule: iterativelySchedule
