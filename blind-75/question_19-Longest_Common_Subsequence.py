# Question Category : Dynamic Programming
# Difficulty : Medium
# Link to Leetcode Problem : https://leetcode.com/problems/longest-common-subsequence/
# NeedCode Video Solution : https://youtu.be/Ua0GhsJSlWM
# Obs.: recursive: if first chars are equal find lcs of remaining of each,
# else max of: lcs of first and remain of 2nd and lcs of 2nd remain of first, cache result;
# nested for loop to compute the cache without recursion;
# Problem Desciption :
"""
Given two strings text1 and text2, return the length of their longest common subsequence.
If there is no common subsequence, return 0.

A subsequence of a string is a new string generated from the original string with some characters (can be none)
deleted without changing the relative order of the remaining characters.

For example, "ace" is a subsequence of "abcde".
A common subsequence of two strings is a subsequence that is common to both strings.



Example 1:

Input: text1 = "abcde", text2 = "ace"
Output: 3
Explanation: The longest common subsequence is "ace" and its length is 3.
Example 2:

Input: text1 = "abc", text2 = "abc"
Output: 3
Explanation: The longest common subsequence is "abc" and its length is 3.
Example 3:

Input: text1 = "abc", text2 = "def"
Output: 0
Explanation: There is no such common subsequence, so the result is 0.


Constraints:

1 <= text1.length, text2.length <= 1000
text1 and text2 consist of only lowercase English characters.

"""


class MySolution:
    def longest_common_subsequence(self, text1: str, text2: str) -> int:
        """
        dp[j] is the LCS length for the suffixes text1[i + 1:] and text2[j:].
        While scanning text1 from right to left, prev_diagonal keeps the old
        value of dp[j + 1], which represents text1[i + 1:] and text2[j + 1:].

        If the current characters match, they add 1 to that diagonal subproblem.
        Otherwise, skip one character from either string and keep the better
        result.

        Time: O(len(text1) * len(text2))
        Space: O(min(len(text1), len(text2)))
        """
        if len(text2) > len(text1):
            text1, text2 = text2, text1

        dp = [0] * (len(text2) + 1)
        for char1 in reversed(text1):
            prev_diagonal = 0
            for idx2 in range(len(text2) - 1, -1, -1):
                old_dp = dp[idx2]
                if char1 == text2[idx2]:
                    dp[idx2] = 1 + prev_diagonal
                else:
                    dp[idx2] = max(dp[idx2], dp[idx2 + 1])
                prev_diagonal = old_dp
        return dp[0]

    # def get_index_of_letter(self, letter: str, text2: str):
    #     for idx,char in text2:

    def length_of_lis(self, nums: list[int]) -> int:
        """
        Return the length of the longest strictly increasing subsequence.

        dp[i] stores the best subsequence length that starts at index i. Walk from
        right to left so every possible following element has already been solved.
        If nums[j] can follow nums[i], then nums[i] can extend that subsequence:


        Time: O(n^2)
        Space: O(n)
        """
        n = len(nums)
        max_length_for_indexes = [1] * n
        for reversed_index in range(n - 2, -1, -1):
            for tailing_index in range(reversed_index + 1, n):
                if nums[tailing_index] > nums[reversed_index]:
                    max_length_for_indexes[reversed_index] = max(
                        max_length_for_indexes[reversed_index],
                        1 + max_length_for_indexes[tailing_index],
                    )
        return max(max_length_for_indexes)


class NeedCodeSolution:
    def longest_common_subsequence(self, text1: str, text2: str) -> int:
        """
        dp[i][j] stores the LCS length for suffixes text1[i:] and text2[j:].
        The extra row and column stay zero, covering cases where either suffix
        is empty.

        Fill the grid from bottom-right to top-left so each dependent subproblem
        is already solved. Matching characters extend the diagonal answer by 1;
        otherwise, skip one character from either string and keep the better
        result.

        Time: O(len(text1) * len(text2))
        Space: O(len(text1) * len(text2))
        """
        n1 = len(text1)
        n2 = len(text2)
        dp = [[0 for _ in range(n2 + 1)] for _ in range(n1 + 1)]
        for i in range(n1 - 1, -1, -1):
            for j in range(n2 - 1, -1, -1):
                if text1[i] == text2[j]:
                    dp[i][j] = 1 + dp[i + 1][j + 1]
                else:
                    dp[i][j] = max(dp[i][j + 1], dp[i + 1][j])
        return dp[0][0]


def _test_cases():
    # Example 1:
    text1 = "abcde"
    text2 = "ace"
    output = 3
    assert NeedCodeSolution().longest_common_subsequence(text1, text2) == output

    # Example 2:
    text1 = "abc"
    text2 = "abc"
    output = 3
    assert NeedCodeSolution().longest_common_subsequence(text1, text2) == output

    text1 = "abc"
    text2 = "def"
    output = 0
    assert NeedCodeSolution().longest_common_subsequence(text1, text2) == output
