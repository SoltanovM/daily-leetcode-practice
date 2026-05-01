# Question Category : Dynamic Programming
# Difficulty : Medium
# Link to Leetcode Problem : https://leetcode.com/problems/unique-paths/
# NeedCode Video Solution : https://youtu.be/IlEsdxuD4lY
# Obs.: work backwards from solution, store paths for each position in grid, to further optimize, we don’t store whole grid, only need to store prev row;
# Problem Desciption :
"""

There is a robot on an m x n grid. The robot is initially located at the top-left corner (i.e., grid[0][0]).
The robot tries to move to the bottom-right corner (i.e., grid[m - 1][n - 1]).
The robot can only move either down or right at any point in time.

Given the two integers m and n, return the number of possible unique paths that the robot can take to reach the bottom-right corner.

The test cases are generated so that the answer will be less than or equal to 2 * 109.

Example 1:


Input: m = 3, n = 7
Output: 28
Example 2:

Input: m = 3, n = 2
Output: 3
Explanation: From the top-left corner, there are a total of 3 ways to reach the bottom-right corner:
1. Right -> Down -> Down
2. Down -> Down -> Right
3. Down -> Right -> Down

"""

# This is classic permutation question, Answer is (m+n-2)!/(m-1)! * (n-1)!


class MySolution:
    calculated_factorials = {0: 1, 1: 1}

    def uniquePaths(self, m: int, n: int) -> int:
        return int(self.factorial(n + m - 2) / (self.factorial(n - 1) * self.factorial(m - 1)))

    def factorial(self, number: int):
        if number in self.calculated_factorials:
            return self.calculated_factorials[number]
        result = number * self.factorial(number - 1)
        self.calculated_factorials[number] = result
        return result


def _test_case():
    # Example 1:
    m = 3
    n = 7
    output = 28
    assert MySolution().uniquePaths(m, n) == output

    # Example 2:
    m = 3
    n = 2
    output = 3
    assert MySolution().uniquePaths(m, n) == output
