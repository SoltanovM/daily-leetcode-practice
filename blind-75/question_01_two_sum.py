# Question Category : Arrays
# Difficulty : Easy
# Link to Leetcode Problem : https://leetcode.com/problems/two-sum/
# NeetCode Video Solution : https://youtu.be/KLlXCFG5TnA
# Obs.: use hash map to instantly check for difference value, map will add index of last occurrence of a num, don’t use same element twice;
# Problem Desciption :
"""
Given an array of integers nums and an integer target, return indices of the two numbers such that they add up to target.
You may assume that each input would have exactly one solution, and you may not use the same element twice.
You can return the answer in any order.

Input: nums = [2,7,11,15], target = 9
Output: [0,1]
Explanation: Because nums[0] + nums[1] == 9, we return [0, 1].
Example 2:
Input: nums = [3,2,4], target = 6
Output: [1,2]
Example 3:
Input: nums = [3,3], target = 6
Output: [0,1]

"""


class MySolution:
    def two_sum(self, nums: list[int], target: int) -> list[int]:
        lenght_of_list = len(nums)
        for i in range(lenght_of_list):
            num1 = nums[i]
            for j in range(i + 1, lenght_of_list):
                num2 = nums[j]
                if num1 + num2 == target:
                    return [i, j]


def _test_cases() -> None:
    # ----------- Example : 01 ---------
    nums = [2, 7, 11, 15]
    target = 9
    output = [0, 1]
    assert MySolution().two_sum(nums, target) == output

    # ----------- Example : 02 ---------
    nums = [3, 2, 4]
    target = 6
    output = [1, 2]
    assert MySolution().two_sum(nums, target) == output

    # ----------- Example : 03 ---------

    nums = [3, 3]
    target = 6
    output = [0, 1]
    assert MySolution().two_sum(nums, target) == output


class NeetCodeSolution(object):
    def twoSum(self, nums: list[int], target: int) -> list[int]:
        prevMap = {}
        for index2, value2 in enumerate(nums):
            value1 = target - value2
            if value1 in prevMap.keys():
                return [prevMap[value1], index2]
            prevMap[value2] = index2
