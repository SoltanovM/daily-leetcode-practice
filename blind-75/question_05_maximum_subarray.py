# Question Category : Arrays
# Difficulty : Medium
# Link to Leetcode Problem : https://leetcode.com/problems/maximum-subarray/
# NeedCode Video Solution : https://youtu.be/5WZl3MMT0Eg
# Obs.: pattern: prev subarray cant be negative, dynamic programming: compute max sum for each prefix
# Problem Desciption :
"""
Given an integer array nums, find the
subarray with the largest sum, and return its sum.



Example 1:

Input: nums = [-2,1,-3,4,-1,2,1,-5,4]
Output: 6
Explanation: The subarray [4,-1,2,1] has the largest sum 6.
Example 2:

Input: nums = [1]
Output: 1
Explanation: The subarray [1] has the largest sum 1.
Example 3:

Input: nums = [5,4,-1,7,8]
Output: 23
Explanation: The subarray [5,4,-1,7,8] has the largest sum 23.
"""


class MySolution(object):
    # Try all possible subsets and get max, Passed test cases but Time Limit Exceeded
    def max_sub_array(self, nums: list[int]) -> int:
        max_value = sum(nums)
        if len(nums) <= 1:
            return max_value
        for index1 in range(0, len(nums)):
            for index2 in range(index1 + 1, len(nums) + 1):
                sum_of_subset = sum(nums[index1:index2])
                max_value = max(max_value, sum_of_subset)
        return max_value


# The brute-force idea is correct, but it checks every possible subarray.
# That means the nested loops already visit O(n^2) start/end pairs, and each
# call to sum(nums[index1:index2]) scans part of the array again, so the real
# time cost is even worse than O(n^2). That repeated work causes Time Limit
# Exceeded on large inputs. The optimized solution uses Kadane's algorithm to
# process the array once, giving O(n) time and O(1) extra space.


class NeetCodeSolution(object):
    def max_sub_array(self, nums: list[int]) -> int:
        max_subarray = nums[0]
        current_sum = 0
        for n in nums:
            if current_sum < 0:
                current_sum = 0
            current_sum += n
            max_subarray = max(max_subarray, current_sum)
        return max_subarray


def _test_cases():
    # ----------------- Example 1: -----------------
    nums = [-2, 1, -3, 4, -1, 2, 1, -5, 4]
    output = 6
    assert MySolution().max_sub_array(nums) == output

    # ----------------- Example 2: -----------------
    nums = [1]
    output = 1
    assert MySolution().max_sub_array(nums) == output

    # ----------------- Example 3: -----------------
    nums = [5, 4, -1, 7, 8]
    output = 23
    assert MySolution().max_sub_array(nums) == output

    # ----------------- Example 4: -----------------
    nums = [-2, 1]
    output = 23
    assert MySolution().max_sub_array(nums) == output
