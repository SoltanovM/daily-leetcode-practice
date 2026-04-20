# Question Category : Arrays
# Difficulty : Easy
# Link to Leetcode Problem : https://leetcode.com/problems/contains-duplicate/
# NeedCode Video Solution : https://youtu.be/3OamzN90kPg
# Obs.: hashset to get unique values in array, to check for duplicates easily
# Problem Desciption :
"""
Given an integer array nums, return true if any value appears at least twice in the array, and return false if every element is distinct.

Example 1:

Input: nums = [1,2,3,1]
Output: true
Example 2:

Input: nums = [1,2,3,4]
Output: false
Example 3:

Input: nums = [1,1,1,3,3,4,3,2,4,2]
Output: true
"""


class MySolution(object):
    def contains_duplicate(self, nums: list[int]) -> bool:
        unique_set = set()
        for num in nums:
            if num not in unique_set:
                unique_set.add(num)
            else:
                return True
        return False

# Solution idea: store each number in a set as you iterate through the list.
# Since a set only keeps unique values, finding a number already in the set
# means that number is duplicated, so we return True immediately. If we finish
# the loop without finding any repeated value, we return False.


class NeetCodeSolution(object):
    def containsDuplicate(self, nums: list[int]) -> bool:
        HashSet = set()
        for n in nums:
            if n in HashSet:
                return True
            HashSet.add(n)
        return False


def _test_cases():
    # --------------- Example 01 ---------------
    nums = [1, 2, 3, 1]
    output = True
    assert MySolution().contains_duplicate(nums) == output

    # --------------- Example 01 ---------------
    nums = [1, 2, 3, 4]
    output = False
    assert MySolution().contains_duplicate(nums) == output

    # --------------- Example 01 ---------------
    nums = [1, 1, 1, 3, 3, 4, 3, 2, 4, 2]
    output = True
    assert MySolution().contains_duplicate(nums) == output
