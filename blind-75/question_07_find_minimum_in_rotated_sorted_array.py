# Question Category : Arrays
# Difficulty : Medium
# Link to Leetcode Problem : https://leetcode.com/problems/find-minimum-in-rotated-sorted-array/
# NeedCode Video Solution : https://youtu.be/nIVW4P8b1VA
# Obs.: check if half of array is sorted in order to find pivot, arr is guaranteed to be in at most two sorted subarrays
# Problem Desciption :
"""
Suppose an array of length n sorted in ascending order is rotated between 1 and n times. For example, the array nums = [0,1,2,4,5,6,7] might become:

[4,5,6,7,0,1,2] if it was rotated 4 times.
[0,1,2,4,5,6,7] if it was rotated 7 times.
Notice that rotating an array [a[0], a[1], a[2], ..., a[n-1]] 1 time results in the array [a[n-1], a[0], a[1], a[2], ..., a[n-2]].

Given the sorted rotated array nums of unique elements, return the minimum element of this array.

You must write an algorithm that runs in O(log n) time.



Example 1:

    nums = [3,4,5,1,2]
output= 1
Explanation: The original array was [1,2,3,4,5] rotated 3 times.
Example 2:

    nums = [4,5,6,7,0,1,2]
output= 0
Explanation: The original array was [0,1,2,4,5,6,7] and it was rotated 4 times.
Example 3:

    nums = [11,13,15,17]
output= 11
Explanation: The original array was [11,13,15,17] and it was rotated 4 times.
"""


class MySolution(object):
    def find_min(self, nums: list[int]) -> int:
        """
        Brute Force - O(n)
        """
        if len(nums) == 1:
            return nums[0]
        for index in range(len(nums)):
            if nums[index] < nums[index - 1]:
                return nums[index]


# The first number that is smaller than the previous one is the minimum.
# In the worst case, we may need to iterate through all numbers, so the time complexity is **O(n)**.
# The space complexity is **O(1)**.


class NeetCodeSolution(object):
    def find_min(self, nums: list[int]) -> int:
        result = nums[0]
        left, right = 0, len(nums) - 1
        while left <= right:
            if nums[left] < nums[right]:
                result = min(result, nums[left])
                break
            mid = (left + right) // 2
            result = min(result, nums[mid])
            if nums[mid] >= nums[left]:
                left = mid + 1
            else:
                right = mid - 1
        return result


# NEEDCODE SOLTION BASIC IDEA:
# Try to find the starting index of the right portion of the array.
# The array is divided into two sorted parts: left and right. All values in the right part are smaller than those in the left part because it is a rotated continuation of the array. So, the main challenge is to identify the starting index of the right portion.
# We can use binary search to solve this. Pick the middle element:
# * If it is greater than the left boundary value, then it belongs to the left portion.
# * Else in belongs to the right portion


def _test_cases():
    # ------------ Example 1: ------------
    nums = [3, 4, 5, 1, 2]
    output = 1
    assert MySolution().find_min(nums) == output

    # ------------ Example 2: ------------
    nums = [4, 5, 6, 7, 0, 1, 2]
    output = 0
    assert MySolution().find_min(nums) == output

    # ------------ Example 3: ------------
    nums = [11, 13, 15, 17]
    output = 11
    assert MySolution().find_min(nums) == output
