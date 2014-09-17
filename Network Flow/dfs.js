// g = {
//   s: [
//     {to: 'a', c: 10, f: 0},
//     {to: 'b', c: 4, f: 0},
//   ],
//   a: [
//     {to: 't', c: 2, f: 0},
//     {to: 'b', c: 5, f: 0},
//   ],
//   b: [
//     {to: 't', c: 5, f: 0},
//   ],
//   t: [],
// };

function dfs(g) {
  var q = ['s'];
  var visited = {};

  while (q.length) {
    var currNode = q.pop();
    if (currNode === 't') {
      return true;
    }
    if (visited[currNode]) {
      continue;
    }
    visited[currNode] = true;

    var edges = g[currNode].map(function(edge) {return edge.to;});
    q = q.concat(edges);
  }

  return false;
}

module.exports = dfs;
