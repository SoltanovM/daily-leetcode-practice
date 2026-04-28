# Question Category : Binary
# Difficulty :
# Link to Leetcode Problem : https://leetcode.com/problems/counting-bits/
# NeedCode Video Solution : https://youtu.be/RyBM56RIWrM
# Obs.: write out result for num=16 to figure out pattern; res[i] = res[i - offset], where offset is the biggest power of 2 <= I;
# Problem Desciption :
"""
Given an integer n, return an array ans of length n + 1 such that
for each i (0 <= i <= n), ans[i] is the number of 1's in the binary representation of i.

Example 1:

Input: n = 2
Output: [0,1,1]
Explanation:
0 --> 0
1 --> 1
2 --> 10

Example 2:
Input: n = 5
Output: [0,1,1,2,1,2]
Explanation:
0 --> 0
1 --> 1
2 --> 10
3 --> 11
4 --> 100
5 --> 101
"""


class MySolution:
    def count_bits(self, n: int) -> list[int]:
        """
        Partially recurrence: use values already calculated
        O(nlogn)
        """
        dp = [0] * (n + 1)

        for i in range(1, n + 1):
            dp[i] = (i % 2) + dp[i // 2]
        return dp


class NeetCodeSolution:
    def count_bits(self, n: int) -> list[int]:
        dp = [0] * (n + 1)
        offset = 1

        for i in range(1, n + 1):
            if offset * 2 == i:
                offset = i
            dp[i] = 1 + dp[1 - offset]
        return dp


def _test_cases():
    # Example 1:
    n = 2
    output = [0, 1, 1]
    assert MySolution().count_bits(n) == output

    # Example 2:
    n = 5
    output = [0, 1, 1, 2, 1, 2]
    assert MySolution().count_bits(n) == output
