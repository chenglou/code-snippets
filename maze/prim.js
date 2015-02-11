// Braid maze with Prim's algorithm
// http://weblog.jamisbuck.org/2011/1/10/maze-generation-prim-s-algorithm

function isVisited(cell) {
  return cell.u || cell.d || cell.l || cell.r;
}

function findVisitedInSurrounding(maze, x, y) {
  var upX = x;
  var upY = y - 1;
  var downX = x;
  var downY = y + 1;
  var leftX = x - 1;
  var leftY = y;
  var rightX = x + 1;
  var rightY = y;

  var ret = [];
  if (y > 0 && isVisited(maze[upY][upX])) {
    ret.push([upX, upY]);
  }
  if (y < maze.length - 1 && isVisited(maze[downY][downX])) {
    ret.push([downX, downY]);
  }
  if (x > 0 && isVisited(maze[leftY][leftX])) {
    ret.push([leftX, leftY]);
  }
  if (x < maze[0].length - 1 && isVisited(maze[rightY][rightX])) {
    ret.push([rightX, rightY]);
  }

  return ret;
}

function findFrontiers(maze) {
  var ret = [];

  for (var i = 0; i < maze.length; i++) {
    for (var j = 0; j < maze[0].length; j++) {
      var cell = maze[i][j];
      if (isVisited(cell)) {
        continue;
      }
      if (findVisitedInSurrounding(maze, j, i).length > 0) {
        ret.push([j, i]);
      }
    }
  }

  return ret;
}

function findSharedWall(x1, y1, x2, y2) {
  if (x1 === x2) {
    if (y1 < y2) {
      return 'd';
    }
    return 'u';
  }

  if (y1 === y2) {
    if (x1 < x2) {
      return 'r';
    }
    return 'l';
  }
}

function randNth(arr) {
  return arr[Math.floor(Math.random() * arr.length)];
}

function draw(maze) {
  console.log(Array(maze[0].length + 1).join('__'));

   for (var i = 0; i < maze.length; i++) {
      var line = '|';
      for (var j = 0; j < maze[0].length; j++) {
        var downLine = maze[i][j].d ? ' ' : '_';
        line += downLine;
        line += maze[i][j].r ? downLine : '|';
      }
      console.log(line);
   }
}

function drawMaze(w, h) {
  var maze = [];
  for (var i = 0; i < h; i++) {
    maze.push([]);
    for (var j = 0; j < w; j++) {
      maze[i][j] = {u: false, d: false, l: false, r: false};
    }
  }

  var openRight = Math.random() > 0.5;
  maze[0][0] = {
    u: false,
    d: !openRight,
    l: false,
    r: openRight,
  };

  var frontiers = findFrontiers(maze);
  var opposite = {u: 'd', d: 'u', l: 'r', r: 'l'};

  while (frontiers.length > 0) {
    var aFrontier = randNth(frontiers);
    var visiteds = findVisitedInSurrounding(maze, aFrontier[0], aFrontier[1]);
    var aVisited = randNth(visiteds);

    var orientation = findSharedWall(aFrontier[0], aFrontier[1], aVisited[0], aVisited[1]);
    maze[aFrontier[1]][aFrontier[0]][orientation] = true;
    maze[aVisited[1]][aVisited[0]][opposite[orientation]] = true;
    frontiers = findFrontiers(maze);
  }

  draw(maze);
}

drawMaze(10, 7);
