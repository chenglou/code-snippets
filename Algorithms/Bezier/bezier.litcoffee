# Quadratic and Cubic Bezier curves

We first define two points, the starting and the ending. **The values are
portions of the overall size**, not actual pixel values.

    CANVAS_WIDTH = CANVAS_HEIGHT = 1024
    MAX_RECURSION_DEPTH = 300

    pt1 = x: 0 * CANVAS_WIDTH, y: 0.5 * CANVAS_HEIGHT
    pt2 = x: 1 * CANVAS_WIDTH, y: 0.5 * CANVAS_HEIGHT

Here's the third point, an an optional 4th one for quadratic curve. The latter's
x coodrinates is always bgger than the former.

    pt3 = x: 0.35 * CANVAS_WIDTH, y: 0.0 * CANVAS_HEIGHT
    pt4 = x: 0.75 * CANVAS_WIDTH, y: 0.2 * CANVAS_HEIGHT

Then there's the proportion factor

    t = 0.9
    minimumDotsDistance = Math.pow(t, MAX_RECURSION_DEPTH)

    window.onload = ->
        context = document.getElementById("sheet").getContext "2d"
        context.fillStyle = "black"
        context.beginPath()

Draw the first two control points. It's too long to write `fillRect x, y, 1, 1`
each time. Here's an alias.

        pt = (x, y) -> context.fillRect x, y, 1, 1

        pt pt1.x, pt1.y
        pt pt2.x, pt2.y

Here's the recursive function to draw points. The exercice here is **not to use
the built-in bezier function (obviously)**, and not to use lineTo. Just dots
after dots.

We first set the line through which the point passes. This line cuts the line
formed by pt1 and pt2 at proportion t, and also cuts pt2 - pt3 at the same
proportion. Then, this new line itself is cut at proportion t. The point on that
cutting place is the one we want to draw.

Parameter order: start, middle, finish.

        drawQuadraticBezier = (pt1, pt2, pt3) ->
            distanceX = Math.abs pt1.x - pt2.x
            distanceY = Math.abs pt1.y - pt2.y
            localMinimumDotsDistance = Math.max(1, minimumDotsDistance)
            if distanceX < localMinimumDotsDistance and distanceY < localMinimumDotsDistance
                return
            cuttingPlace1 =
                x: pt1.x + (pt2.x - pt1.x) * t
                y: pt1.y + (pt2.y - pt1.y) * t
            cuttingPlace2 =
                x: pt2.x + (pt3.x - pt2.x) * t
                y: pt2.y + (pt3.y - pt2.y) * t
            pointToDraw =
                x: cuttingPlace1.x + (cuttingPlace2.x - cuttingPlace1.x) * t
                y: cuttingPlace1.y + (cuttingPlace2.y - cuttingPlace1.y) * t

            pt pointToDraw.x, pointToDraw.y
            drawQuadraticBezier pt1, cuttingPlace1, pointToDraw
            drawQuadraticBezier pointToDraw, cuttingPlace2, pt3

Same principe, but with two intermediate control points instead of one.

        drawCubicBezier = (pt1, pt2, pt3, pt4) ->
            distanceX = Math.abs pt1.x - pt2.x
            distanceY = Math.abs pt1.y - pt2.y
            localMinimumDotsDistance = Math.max(1, minimumDotsDistance)
            if distanceX < localMinimumDotsDistance and distanceY < localMinimumDotsDistance
                return
            cuttingPlace1 =
                x: pt1.x + (pt2.x - pt1.x) * t
                y: pt1.y + (pt2.y - pt1.y) * t
            cuttingPlace2 =
                x: pt2.x + (pt3.x - pt2.x) * t
                y: pt2.y + (pt3.y - pt2.y) * t
            cuttingPlace3 =
                x: pt3.x + (pt4.x - pt3.x) * t
                y: pt3.y + (pt4.y - pt3.y) * t
            recutting12 =
                x: cuttingPlace1.x + (cuttingPlace2.x - cuttingPlace1.x) * t
                y: cuttingPlace1.y + (cuttingPlace2.y - cuttingPlace1.y) * t
            recutting23 =
                x: cuttingPlace2.x + (cuttingPlace3.x - cuttingPlace2.x) * t
                y: cuttingPlace2.y + (cuttingPlace3.y - cuttingPlace2.y) * t
            pointToDraw =
                x: recutting12.x + (recutting23.x - recutting12.x) * t
                y: recutting12.y + (recutting23.y - recutting12.y) * t

            pt pointToDraw.x, pointToDraw.y
            drawCubicBezier pt1, cuttingPlace1, recutting12, pointToDraw
            drawCubicBezier pointToDraw, recutting23, cuttingPlace3, pt4

Notice the parameter order.

        drawQuadraticBezier pt1, pt3, pt2
        drawCubicBezier pt1, pt3, pt4, pt2

