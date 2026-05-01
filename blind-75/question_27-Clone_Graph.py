# Question Category : Graph
# Difficulty : Medium
# Link to Leetcode Problem : https://leetcode.com/problems/clone-graph/
# NeedCode Video Solution : https://youtu.be/mQeF6bN8hMk
# Obs.: recursive dfs, hashmap for visited nodes
# Problem Desciption :
"""
Given a reference of a node in a connected undirected graph.

Return a deep copy (clone) of the graph.

Each node in the graph contains a value (int) and a list (List[Node]) of its neighbors.

class Node {
    public int val;
    public List<Node> neighbors;
}


Test case format:

For simplicity, each node's value is the same as the node's index (1-indexed).
For example, the first node with val == 1, the second node with val == 2, and so on.
The graph is represented in the test case using an adjacency list.

An adjacency list is a collection of unordered lists used to represent a finite graph.
Each list describes the set of neighbors of a node in the graph.

The given node will always be the first node with val = 1.
You must return the copy of the given node as a reference to the cloned graph.



Example 1:


Input: adjList = [[2,4],[1,3],[2,4],[1,3]]
Output: [[2,4],[1,3],[2,4],[1,3]]
Explanation: There are 4 nodes in the graph.
1st node (val = 1)'s neighbors are 2nd node (val = 2) and 4th node (val = 4).
2nd node (val = 2)'s neighbors are 1st node (val = 1) and 3rd node (val = 3).
3rd node (val = 3)'s neighbors are 2nd node (val = 2) and 4th node (val = 4).
4th node (val = 4)'s neighbors are 1st node (val = 1) and 3rd node (val = 3).
Example 2:


Input: adjList = [[]]
Output: [[]]
Explanation: Note that the input contains one empty list. The graph consists of only one node with val = 1 and it does not have any neighbors.
Example 3:

Input: adjList = []
Output: []
Explanation: This an empty graph, it does not have any nodes.


Constraints:

The number of nodes in the graph is in the range [0, 100].
1 <= Node.val <= 100
Node.val is unique for each node.
There are no repeated edges and no self-loops in the graph.
The Graph is connected and all nodes can be visited starting from the given node.

"""

"""
# Definition for a Node.
"""

from typing import Optional


class Node:
    def __init__(self, val=0, neighbors=None):
        self.val = val
        self.neighbors = neighbors if neighbors is not None else []


def _playground():
    example_node = Node(1)
    example_neighbor = Node(2)
    example_node.neighbors.append(example_neighbor)


def _create_graph_from_list(adj_list) -> Optional["Node"]:
    if not adj_list:
        return None

    nodes = [Node(i + 1) for i in range(len(adj_list))]
    for node, neighbors in zip(nodes, adj_list):
        node.neighbors = [nodes[val - 1] for val in neighbors]
    return nodes[0]


def _create_list_from_graph(node: Node) -> list[list[int]]:
    if node is None:
        return []

    seen = {}
    stack = [node]
    while stack:
        current = stack.pop()
        if current.val in seen:
            continue
        seen[current.val] = current
        stack.extend(current.neighbors)
    return [[neighbor.val for neighbor in seen[val].neighbors] for val in range(1, len(seen) + 1)]


class MySolution:
    def cloneGraph(self, node: Optional["Node"]) -> Optional["Node"]:
        node.val
        node.neighbors
        return


class NeedCodeSolution:
    def cloneGraph(self, node: Optional["Node"]) -> Optional["Node"]:
        if node is None:
            return None

        old_to_new = {}

        def dfs(node: Node) -> Optional["Node"]:
            if node in old_to_new:
                return old_to_new[node]

            copy = Node(node.val)
            old_to_new[node] = copy

            for neighbor in node.neighbors:
                copy.neighbors.append(dfs(neighbor))
            return copy

        return dfs(node)


def _test_cases():
    # Example 1:
    adjList = [[2, 4], [1, 3], [2, 4], [1, 3]]
    output = [[2, 4], [1, 3], [2, 4], [1, 3]]
    assert _create_list_from_graph(MySolution().cloneGraph(_create_graph_from_list(adjList))) == output

    # Example 2:
    adjList = [[]]
    output = [[]]
    assert _create_list_from_graph(MySolution().cloneGraph(_create_graph_from_list(adjList))) == output

    # Example 3:
    adjList = []
    output = []
    assert _create_list_from_graph(MySolution().cloneGraph(_create_graph_from_list(adjList))) == output


# class Graph:
#     def __init__(self, adj_list):
#         self.nodes = [Node(i + 1) for i in range(len(adj_list))]
#         for node, neighbors in zip(self.nodes, adj_list):
#             node.neighbors = [self.nodes[val - 1] for val in neighbors]

#     @property
#     def root(self) -> Optional["Node"]:
#         return self.nodes[0] if self.nodes else None
