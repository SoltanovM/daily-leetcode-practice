# Question Category : Arrays
# Difficulty : Medium
# Link to Leetcode Problem : https://leetcode.com/problems/product-of-array-except-self/
# NeedCode Video Solution : https://youtu.be/bNvIQI2wAjk
# Obs.: make two passes, first in-order, second in-reverse, to compute products
# Problem Desciption :
"""
Given an integer array nums, return an array answer such that answer[i] is equal to the product of all the elements of nums except nums[i].

The product of any prefix or suffix of nums is guaranteed to fit in a 32-bit integer.

You must write an algorithm that runs in O(n) time and without using the division operation.



Example 1:

Input: nums = [1,2,3,4]
Output: [24,12,8,6]
Example 2:

Input: nums = [-1,1,0,-3,3]
Output: [0,0,9,0,0]
"""


class MySolution(object):
    def product_except_self(self, nums: list[int]) -> list[int]:
        result = []
        for i in range(len(nums)):
            result.append(self.product_of_elements_in_list(nums[:i]) * self.product_of_elements_in_list(values=nums[(i + 1) :]))
        return result

    def product_of_elements_in_list(self, values: list[int]) -> int:
        result = 1
        if len(values) == 0:
            return result
        for value in values:
            result = result * value
        return result


# Note: this approach is logically correct and passes local tests, but it gets
# Time Limit Exceeded on LeetCode because it recalculates products for each
# index. The idea is simple: multiply all elements before the current index and
# all elements after it, then store the result. The helper method keeps the
# code easier to read, even though the overall approach is not optimal.

# Time complexity is O(n^2) because for each index, the solution recomputes
# the product of almost the entire array. Space complexity is O(n) because it
# stores the output array. If we also count the temporary slices, the peak
# extra space is still O(n).


class NeetCodeSolution(object):
    def productExceptSelf(self, nums: list[int]) -> list[int]:
        result = [1] * len(nums)

        current_prefix_product = 1
        for i in range(len(nums)):
            result[i] = current_prefix_product
            current_prefix_product *= nums[i]

        current_postfix_product = 1
        for i in range(len(nums) - 1, -1, -1):
            result[i] *= current_postfix_product
            current_postfix_product *= nums[i]

        return result


def _test_case():
    # --------------- Example 01 ---------------
    nums = [1, 2, 3, 4]
    output = [24, 12, 8, 6]
    assert MySolution().product_except_self(nums) == output

    # --------------- Example 02 ---------------
    nums = [-1, 1, 0, -3, 3]
    output = [0, 0, 9, 0, 0]
    assert MySolution().product_except_self(nums) == output
