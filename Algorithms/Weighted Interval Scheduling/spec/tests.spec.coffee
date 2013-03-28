intervalSchedule = require '../intervalSchedule'
recursivelySchedule = intervalSchedule.recursivelySchedule
iterativelySchedule = intervalSchedule.iterativelySchedule

describe "Achieve maximum active duration", ->
    tasks = [
        null
        {duration: 2, previousNonOverlappingTask: 0}
        {duration: 4, previousNonOverlappingTask: 0}
        {duration: 4, previousNonOverlappingTask: 1}
        {duration: 7, previousNonOverlappingTask: 0}
        {duration: 2, previousNonOverlappingTask: 3}
        {duration: 1, previousNonOverlappingTask: 3}
    ]
    tasks2 = [
        null
        {duration: 2, previousNonOverlappingTask: 0}
        {duration: 5, previousNonOverlappingTask: 0}
        {duration: 4, previousNonOverlappingTask: 0}
    ]
    it "should be able to do it recursively", ->
        expect(recursivelySchedule 3, tasks).toBe 6
        expect(recursivelySchedule 6, tasks).toBe 8
        expect(recursivelySchedule 3, tasks2).toBe 5
    it "should be able to do it iteratively", ->
        expect(iterativelySchedule 3, tasks).toBe 6
        expect(iterativelySchedule 6, tasks).toBe 8
        expect(iterativelySchedule 3, tasks2).toBe 5

