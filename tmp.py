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
