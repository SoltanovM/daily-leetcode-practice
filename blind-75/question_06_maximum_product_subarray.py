# Question Category : Arrays
# Difficulty : Medium
# Link to Leetcode Problem : https://leetcode.com/problems/maximum-product-subarray/
# NeedCode Video Solution : https://youtu.be/lXVy6YWFcRM
# Obs.: dp: compute max and max-abs-val for each prefix subarr;
# Problem Desciption :
"""
Given an integer array nums, find a
subarray
 that has the largest product, and return the product.

The test cases are generated so that the answer will fit in a 32-bit integer.



Example 1:

Input: nums = [2,3,-2,4]
Output: 6
Explanation: [2,3] has the largest product 6.
Example 2:

Input: nums = [-2,0,-1]
Output: 0
Explanation: The result cannot be 2, because [-2,-1] is not a subarray.
"""


class MySolution(object):
    def max_product(self, nums: list[int]) -> int:
        max_product = max(nums)

        if len(nums) == 1:
            return max_product

        for index1 in range(len(nums) - 1):
            for index2 in range(index1 + 1, len(nums) + 1):
                current_product = 1
                for n in nums[index1:index2]:
                    current_product *= n
                max_product = max(max_product, current_product)
        return max_product


# This brute-force solution checks every possible subarray, computes each product,
# and keeps the largest product found.
# As this approach uses Time complexity O(n^2) , leetcode not accepted my solution, due to TimeLimit.
# Memory complexity is O(1)


class NeetCodeSolution(object):
    def maxProduct(self, nums: list[int]) -> int:
        result = max(nums)
        CurrentMin, CurrentMax = 1, 1
        for n in nums:
            if n == 0:
                CurrentMin, CurrentMax = 1, 1
            else:
                tmp = CurrentMax * n
                CurrentMax = max(n * CurrentMax, n * CurrentMin, n)
                CurrentMin = min(tmp, n * CurrentMin, n)
                result = max(result, CurrentMax)
        return result


def _test_cases():
    # -------------------- Example : 01 --------------------
    nums = [2, 3, -2, 4]
    output = 6
    assert MySolution().max_product(nums) == output

    # -------------------- Example : 02 --------------------
    nums = [-2, 0, -1]
    output = 0
    assert MySolution().max_product(nums) == output
