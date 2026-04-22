"""
You are given an n x n 2D matrix representing an image, rotate the image by 90 degrees (clockwise).

You have to rotate the image in-place, which means you have to modify the input 2D matrix directly. DO NOT allocate another 2D matrix and do the rotation.



Example 1:


Input: matrix = [[1,2,3],[4,5,6],[7,8,9]]
Output: [[7,4,1],[8,5,2],[9,6,3]]
Example 2:


Input: matrix = [[5,1,9,11],[2,4,8,10],[13,3,6,7],[15,14,12,16]]
Output: [[15,13,2,5],[14,3,4,1],[12,6,8,9],[16,7,10,11]]


Constraints:

n == matrix.length == matrix[i].length
1 <= n <= 20
-1000 <= matrix[i][j] <= 1000


"""


class Solution(object):
    def rotate(self, matrix):
        """
        :type matrix: List[List[int]]
        :rtype: None Do not return anything, modify matrix in-place instead.
        """
        matrix_size = len(matrix)
        rotated_matrix = [[None] * matrix_size for _ in range(matrix_size)]
        for idx_row in range(matrix_size):
            # print(f"{idx_row=}")
            for idx_col in range(matrix_size):
                # print(f"{idx_col=}")
                cell_value = matrix[idx_row][idx_col]
                # print(f"{cell_value=}")
                rotated_matrix[idx_col][matrix_size - 1 - idx_row] = cell_value
        for idx_row in range(matrix_size):
            for idx_col in range(matrix_size):
                matrix[idx_row][idx_col] = rotated_matrix[idx_row][idx_col]


matrix = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]

matrix_size = len(matrix)
rotated_matrix: list[list[int | None]] = [[None] * matrix_size for _ in range(matrix_size)]
rotated_matrix[0][1] = 1  # No overloads for "__setitem__" match the provided argumentsPylancereportCallIssue


Solution().rotate(matrix)
