# Question Category : Graph
# Difficulty : Medium
# Link to Leetcode Problem : https://leetcode.com/problems/pacific-atlantic-water-flow/
# NeedCode Video Solution : https://youtu.be/s-VkcjHqkGI
# Obs.: dfs each cell, keep track of visited, and track which reach pac, atl; dfs on cells adjacent to pac, atl, find overlap of cells that are visited by both pac and atl cells;
# Problem Desciption :
"""
There is an m x n rectangular island that borders both the Pacific Ocean and Atlantic Ocean.
The Pacific Ocean touches the island's left and top edges, and the Atlantic Ocean touches the island's right and bottom edges.

The island is partitioned into a grid of square cells. You are given an m x n integer matrix heights
where heights[r][c] represents the height above sea level of the cell at coordinate (r, c).

The island receives a lot of rain, and the rain water can flow to neighboring cells directly north,
south, east, and west if the neighboring cell's height is less than or equal to the current cell's height.
Water can flow from any cell adjacent to an ocean into the ocean.

Return a 2D list of grid coordinates result where result[i] = [ri, ci] denotes that
rain water can flow from cell (ri, ci) to both the Pacific and Atlantic oceans.


Example 1:


Input: heights = [[1,2,2,3,5],[3,2,3,4,4],[2,4,5,3,1],[6,7,1,4,5],[5,1,1,2,4]]
Output: [[0,4],[1,3],[1,4],[2,2],[3,0],[3,1],[4,0]]
Explanation: The following cells can flow to the Pacific and Atlantic oceans, as shown below:
[0,4]: [0,4] -> Pacific Ocean
       [0,4] -> Atlantic Ocean
[1,3]: [1,3] -> [0,3] -> Pacific Ocean
       [1,3] -> [1,4] -> Atlantic Ocean
[1,4]: [1,4] -> [1,3] -> [0,3] -> Pacific Ocean
       [1,4] -> Atlantic Ocean
[2,2]: [2,2] -> [1,2] -> [0,2] -> Pacific Ocean
       [2,2] -> [2,3] -> [2,4] -> Atlantic Ocean
[3,0]: [3,0] -> Pacific Ocean
       [3,0] -> [4,0] -> Atlantic Ocean
[3,1]: [3,1] -> [3,0] -> Pacific Ocean
       [3,1] -> [4,1] -> Atlantic Ocean
[4,0]: [4,0] -> Pacific Ocean
       [4,0] -> Atlantic Ocean
Note that there are other possible paths for these cells to flow to the Pacific and Atlantic oceans.
Example 2:

Input: heights = [[1]]
Output: [[0,0]]
Explanation: The water can flow from the only cell to the Pacific and Atlantic oceans.


Constraints:

m == heights.length
n == heights[r].length
1 <= m, n <= 200
0 <= heights[r][c] <= 105


"""


class MySolution:
    def pacificAtlantic(self, heights: list[list[int]]) -> list[list[int]]:
        """
        A little complex solution , at least the idea is correct
        """

        row_number = len(heights)
        column_number = len(heights[0])

        pacific_accessibility_map = {}
        atlantic_accessibility_map = {}

        for col_index in range(column_number):
            pacific_accessibility_map[(0, col_index)] = True
            atlantic_accessibility_map[(row_number - 1, col_index)] = True

        for row_index in range(row_number):
            pacific_accessibility_map[(row_index, 0)] = True
            atlantic_accessibility_map[(row_index, column_number - 1)] = True

        def _get_height_of_above_cell(coordinate: tuple):
            row_no, col_no = coordinate
            return heights[row_no - 1][col_no]

        def _get_height_of_below_cell(coordinate: tuple):
            row_no, col_no = coordinate
            return heights[row_no + 1][col_no]

        def _get_height_of_left_cell(coordinate: tuple):
            row_no, col_no = coordinate
            return heights[row_no][col_no - 1]

        def _get_height_of_right_cell(coordinate: tuple):
            row_no, col_no = coordinate
            return heights[row_no][col_no + 1]

        def _get_current_coordinate_height(coordinate):
            row_no, col_no = coordinate
            return heights[row_no][col_no]

        def _is_pacific_reachable(coordinate: tuple) -> bool:
            """
            Check if a given coordinates are reachable by the ocean
            pacific, following given restrictions
            """
            if coordinate in pacific_accessibility_map:
                return pacific_accessibility_map[coordinate]

            row_no, col_no = coordinate
            current_coord_height = _get_current_coordinate_height(coordinate)
            accessibility = (
                _get_height_of_above_cell(coordinate) <= current_coord_height
                and _is_pacific_reachable((row_no - 1, col_no))
            ) or (
                _get_height_of_left_cell(coordinate) <= current_coord_height
                and _is_pacific_reachable((row_no, col_no - 1))
            )
            pacific_accessibility_map[coordinate] = accessibility
            return accessibility

        def _is_atlantic_reachable(coordinate: tuple) -> bool:
            """
            Check if a given coordinates are reachable by the ocean
            atlantic, following given restrictions
            """
            if coordinate in atlantic_accessibility_map:
                return atlantic_accessibility_map[coordinate]

            row_no, col_no = coordinate
            current_coord_height = _get_current_coordinate_height(coordinate)
            accessibility = (
                _get_height_of_below_cell(coordinate) <= current_coord_height
                and _is_atlantic_reachable((row_no + 1, col_no))
            ) or (
                _get_height_of_right_cell(coordinate) <= current_coord_height
                and _is_atlantic_reachable((row_no, col_no + 1))
            )
            atlantic_accessibility_map[coordinate] = accessibility
            return accessibility

        # if column_number > 1 and column_number > 1:
        for row_idx in range(1, row_number):
            for col_idx in range(1, column_number):
                coord = (row_idx, col_idx)
                pacific_accessibility_map[coord] = _is_pacific_reachable(coord)

        for col_idx in range(column_number - 2, -1, -1):
            for row_idx in range(row_number - 2, -1, -1):
                coord = (row_idx, col_idx)
                atlantic_accessibility_map[coord] = _is_atlantic_reachable(coord)

        result = []
        for row_idx in range(row_number):
            for col_idx in range(column_number):
                coord = (row_idx, col_idx)
                if (
                    pacific_accessibility_map[coord]
                    and atlantic_accessibility_map[coord]
                ):
                    result.append([row_idx, col_idx])

        return result


class NeedCodeSolution:
    def pacificAtlantic(self, heights: list[list[int]]) -> list[list[int]]:
        return


def _test_cases() -> None:
    # Example 1:
    heights = [
        [1, 2, 2, 3, 5],
        [3, 2, 3, 4, 4],
        [2, 4, 5, 3, 1],
        [6, 7, 1, 4, 5],
        [5, 1, 1, 2, 4],
    ]
    output = [[0, 4], [1, 3], [1, 4], [2, 2], [3, 0], [3, 1], [4, 0]]
    assert MySolution().pacificAtlantic(heights) == output

    # Example 2:
    heights = [[1]]
    output = [[0, 0]]
    assert MySolution().pacificAtlantic(heights) == output

    # Example 3:
    heights = [[1, 1], [1, 1], [1, 1]]
    output = MySolution().pacificAtlantic(heights)

    # Example 4:
    heights = [[1, 2, 3], [8, 9, 4], [7, 6, 5]]
    output = MySolution().pacificAtlantic(heights)
