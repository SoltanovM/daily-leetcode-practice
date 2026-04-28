# Question Category : Dynamic Programming
# Difficulty :
# Link to Leetcode Problem : https://leetcode.com/problems/longest-increasing-subsequence/
# NeedCode Video Solution : https://youtu.be/cjWnW0hdF1Y
# Obs.: recursive: foreach num, get subseq with num and without num, only include num if prev was less,
# cache solution of each;
# dp=subseq length which must end with each num,
# curr num must be after a prev dp or by itself;
# Problem Desciption :
"""
Given an integer array nums, return the length of the longest strictly increasing subsequence.



Example 1:

Input: nums = [10,9,2,5,3,7,101,18]
Output: 4
Explanation: The longest increasing subsequence is [2,3,7,101], therefore the length is 4.
Example 2:

Input: nums = [0,1,0,3,2,3]
Output: 4
Example 3:

Input: nums = [7,7,7,7,7,7,7]
Output: 1


Constraints:

1 <= nums.length <= 2500
-104 <= nums[i] <= 104


Follow up: Can you come up with an algorithm that runs in O(n log(n)) time complexity?

"""


class MySolution:
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


def _test_cases():
    # Example 1:
    nums = [10, 9, 2, 5, 3, 7, 101, 18]
    output = 4
    assert MySolution().length_of_lis(nums) == output

    # Example 2:
    nums = [0, 1, 0, 3, 2, 3]
    output = 4
    assert MySolution().length_of_lis(nums) == output

    # Example 3:
    nums = [7, 7, 7, 7, 7, 7, 7]
    output = 1
    assert MySolution().length_of_lis(nums) == output
