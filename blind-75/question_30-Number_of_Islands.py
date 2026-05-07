# Question Category : Graph
# Difficulty : Medium
# Link to Leetcode Problem : https://leetcode.com/problems/number-of-islands/
# NeedCode Video Solution : https://youtu.be/pV2kpPD66nE
# Obs.: foreach cell, if cell is 1 and unvisited run dfs, increment cound and marking each contigous 1 as visited
# Problem Desciption :
"""
Given an m x n 2D binary grid grid which represents a map of '1's (land) and '0's (water), return the number of islands.

An island is surrounded by water and is formed by connecting adjacent lands horizontally or vertically.
You may assume all four edges of the grid are all surrounded by water.



Example 1:

Input: grid = [
  ["1","1","1","1","0"],
  ["1","1","0","1","0"],
  ["1","1","0","0","0"],
  ["0","0","0","0","0"]
]
Output: 1
Example 2:

Input: grid = [
  ["1","1","0","0","0"],
  ["1","1","0","0","0"],
  ["0","0","1","0","0"],
  ["0","0","0","1","1"]
]
Output: 3


Constraints:

m == grid.length
n == grid[i].length
1 <= m, n <= 300
grid[i][j] is '0' or '1'.

"""

from collections import deque


class MySolution:
    def numIslands(self, grid: list[list[str]]) -> int:
        return


class NeedCodeSolution:
    def numIslands(self, grid: list[list[str]]) -> int:
        if not grid:
            return 0

        no_rows = len(grid)
        no_columns = len(grid[0])

        already_visited = set()
        number_of_islands = 0

        def bfs(row: int, column: int):
            double_ended_queue = deque()

            already_visited.add((row, column))
            double_ended_queue.append((row, column))
            while double_ended_queue:
                row_idx, col_idx = double_ended_queue.popleft()
                directions = [[1, 0], [-1, 0], [0, 1], [0, -1]]
                for row_dir, col_dir in directions:
                    adj_row = row_idx + row_dir
                    adj_col = col_idx + col_dir

                    if (
                        adj_row in range(no_rows)
                        and adj_col in range(no_columns)
                        and grid[adj_row][adj_col] == "1"
                        and (adj_row, adj_col) not in already_visited
                    ):
                        double_ended_queue.append((adj_row, adj_col))
                        already_visited.add((adj_row, adj_col))

        for row in range(no_rows):
            for column in range(no_columns):
                if grid[row][column] == "1" and (row, column) not in already_visited:
                    bfs(row, column)
                    number_of_islands += 1

        return number_of_islands


def _test_cases():
    # Example 1:
    grid = [
        ["1", "1", "1", "1", "0"],
        ["1", "1", "0", "1", "0"],
        ["1", "1", "0", "0", "0"],
        ["0", "0", "0", "0", "0"],
    ]
    output = 1
    # assert MySolution().numIslands(grid) == output
    assert NeedCodeSolution().numIslands(grid) == output

    # Example 2:
    grid = [
        ["1", "1", "0", "0", "0"],
        ["1", "1", "0", "0", "0"],
        ["0", "0", "1", "0", "0"],
        ["0", "0", "0", "1", "1"],
    ]
    output = 3
    # assert MySolution().numIslands(grid) == output
    assert NeedCodeSolution().numIslands(grid) == output
