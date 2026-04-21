# Question Category : Arrays
# Difficulty : Medium
# Link to Leetcode Problem : https://leetcode.com/problems/minimize-hamming-distance-after-swap-operations/description/?envType=daily-question&envId=2026-04-21
# Hints.:
#   1. The constraints are small. Can you try the combination of every two houses?
#   2. Greedily, the maximum distance will come from either the pair of the leftmost house and
#   possibly some house on the right with a different color, or the pair of the rightmost house and
#   possibly some house on the left with a different color.


# Problem Desciption :
"""
You are given two integer arrays, source and target, both of length n. You are also given an array allowedSwaps where each allowedSwaps[i] = [ai, bi] indicates that you are allowed to swap the elements at index ai and index bi (0-indexed) of array source. Note that you can swap elements at a specific pair of indices multiple times and in any order.

The Hamming distance of two arrays of the same length, source and target, is the number of positions where the elements are different. Formally, it is the number of indices i for 0 <= i <= n-1 where source[i] != target[i] (0-indexed).

Return the minimum Hamming distance of source and target after performing any amount of swap operations on array source.



Example 1:

Input: source = [1,2,3,4], target = [2,1,4,5], allowedSwaps = [[0,1],[2,3]]
Output: 1
Explanation: source can be transformed the following way:
- Swap indices 0 and 1: source = [2,1,3,4]
- Swap indices 2 and 3: source = [2,1,4,3]
The Hamming distance of source and target is 1 as they differ in 1 position: index 3.
Example 2:

Input: source = [1,2,3,4], target = [1,3,2,4], allowedSwaps = []
Output: 2
Explanation: There are no allowed swaps.
The Hamming distance of source and target is 2 as they differ in 2 positions: index 1 and index 2.
Example 3:

Input: source = [5,1,2,4,3], target = [1,5,4,2,3], allowedSwaps = [[0,4],[4,2],[1,3],[1,4]]
Output: 0


Constraints:

n == source.length == target.length
1 <= n <= 105
1 <= source[i], target[i] <= 105
0 <= allowedSwaps.length <= 105
allowedSwaps[i].length == 2
0 <= ai, bi <= n - 1
ai != bi


Hint 1
The source array can be imagined as a graph where each index is a node and each allowedSwaps[i] is an edge.
Hint 2
Nodes within the same component can be freely swapped with each other.
Hint 3
For each component, find the number of common elements. The elements that are not in common will contribute to the total Hamming distance.
"""


class MySolution(object):
    def minimum_hamming_distance(self, source: list[int], target: list[int], allowedSwaps: list[list[int]]) -> int:
        """
        Group indices that can reach each other through swaps, then compare
        source/target value frequencies inside each group. Any unmatched values
        left in a component contribute to the minimum Hamming distance.

        :type source: List[int]
        :type target: List[int]
        :type allowedSwaps: List[List[int]]
        :rtype: int
        """
        disjoint_swap_set = self.get_disjoint_swap_sets(allowedSwaps)
        n = len(source)
        parents = [-1] * n

        for component in disjoint_swap_set:
            iterator = iter(component)
            root = next(iterator)
            parents[root] = root
            for index in iterator:
                parents[index] = root

        mismatch_count = 0
        grouped_counts = {}

        for index, source_value in enumerate(source):
            if parents[index] == -1:
                if source_value != target[index]:
                    mismatch_count += 1
                continue

            root = parents[index]
            counts = grouped_counts.setdefault(root, {})
            counts[source_value] = counts.get(source_value, 0) + 1
            target_value = target[index]
            counts[target_value] = counts.get(target_value, 0) - 1

        for counts in grouped_counts.values():
            for count in counts.values():
                if count > 0:
                    mismatch_count += count

        return mismatch_count

    def get_disjoint_swap_sets(self, allowedSwaps: list[list[int]]) -> list[list[int]]:
        """
        Build connected components of swappable indices with union-find.
        Each returned list contains indices whose values can be permuted freely.
        For more infos: https://cp-algorithms.com/data_structures/disjoint_set_union.html
        """
        if not allowedSwaps:
            return []

        parent = {}
        size = {}

        def find(node: int) -> int:
            """Return the component representative for node with path compression."""
            while parent[node] != node:
                parent[node] = parent[parent[node]]
                node = parent[node]
            return node

        def union(a: int, b: int) -> None:
            """Merge the components for a and b using union by size."""
            root_a = find(a)
            root_b = find(b)
            if root_a == root_b:
                return
            if size[root_a] < size[root_b]:
                root_a, root_b = root_b, root_a
            parent[root_b] = root_a
            size[root_a] += size[root_b]

        for a, b in allowedSwaps:
            if a not in parent:
                parent[a] = a
                size[a] = 1
            if b not in parent:
                parent[b] = b
                size[b] = 1
            union(a, b)

        components = {}
        for node in parent:
            root = find(node)
            components.setdefault(root, []).append(node)

        return list(components.values())


def _test_cases():
    # --------------- Example 01 ---------------
    source = [1, 2, 3, 4]
    target = [2, 1, 4, 5]
    allowedSwaps = [[0, 1], [2, 3]]
    output = 1
    assert MySolution().minimum_hamming_distance(source=source, target=target, allowedSwaps=allowedSwaps) == output

    # --------------- Example 02 ---------------
    source = [1, 2, 3, 4]
    target = [1, 3, 2, 4]
    allowedSwaps = []
    output = 2
    assert MySolution().minimum_hamming_distance(source=source, target=target, allowedSwaps=allowedSwaps) == output

    # --------------- Example 03 ---------------
    source = [5, 1, 2, 4, 3]
    target = [1, 5, 4, 2, 3]
    allowedSwaps = [[0, 4], [4, 2], [1, 3], [1, 4]]
    output = 0
    assert MySolution().minimum_hamming_distance(source=source, target=target, allowedSwaps=allowedSwaps) == output
