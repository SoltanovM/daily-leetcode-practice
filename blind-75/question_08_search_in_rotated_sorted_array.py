# Question Category : Arrays
# Difficulty : Medium
# Link to Leetcode Problem : https://leetcode.com/problems/search-in-rotated-sorted-array/
# NeedCode Video Solution : https://youtu.be/U8XENwh8Oy8
# Obs.: at most two sorted halfs, mid will be apart of left sorted or right sorted, if target is in range of sorted portion then search it, otherwise search other half
# Problem Desciption :
"""
There is an integer array nums sorted in ascending order (with distinct values).

Prior to being passed to your function, nums is possibly rotated at an unknown pivot index k (1 <= k < nums.length) such that the resulting array is [nums[k], nums[k+1], ..., nums[n-1], nums[0], nums[1], ..., nums[k-1]] (0-indexed).
For example, [0,1,2,4,5,6,7] might be rotated at pivot index 3 and become [4,5,6,7,0,1,2].

Given the array nums after the possible rotation and an integer target, return the index of target if it is in nums, or -1 if it is not in nums.

You must write an algorithm with O(log n) runtime complexity.



Example 1:

Input: nums = [4,5,6,7,0,1,2], target = 0
Output: 4
Example 2:

Input: nums = [4,5,6,7,0,1,2], target = 3
Output: -1
Example 3:

Input: nums = [1], target = 0
Output: -1
"""


class MySolution(object):
    def search(self, nums: list[int], target: int) -> int:
        for i in range(len(nums)):
            if nums[i] == target:
                return i
        return -1


# Brute force solution, just iterate all values and return index when target found. Time complexity is O(n) and space complexity is O(1)


class NeetCodeSolution(object):
    def search(self, nums: list[int], target: int) -> int:
        left_index = 0
        right_index = len(nums) - 1

        while left_index <= right_index:
            middle_index = (left_index + right_index) // 2
            if target == nums[middle_index]:
                return middle_index

            # Left sorted portion:
            if nums[left_index] <= nums[middle_index]:
                if target > nums[middle_index]:
                    left_index = middle_index + 1
                elif target < nums[left_index]:
                    left_index = middle_index + 1
                else:
                    right_index = middle_index - 1
            else:  # right sorted portion
                if target < nums[middle_index]:
                    right_index = middle_index - 1
                elif target > nums[right_index]:
                    right_index = middle_index - 1
                else:
                    left_index = middle_index + 1
        return -1


# Try to use binary search, keeping in mind that the array consists of two sorted portions.

# When evaluating the middle index:

# * If the middle value is greater than or equal to the value at the left index, then it belongs to the left (sorted) portion.
# * Otherwise, it belongs to the right (sorted) portion.

# Based on this, adjust the search boundaries accordingly, and keep track of the minimum value found. Also, be careful with edge cases, such as when the array is already sorted.


def _test_cases():
    # ---------------------- Example 1 ----------------------
    nums = [4, 5, 6, 7, 0, 1, 2]
    target = 0
    output = 4
    assert MySolution().search(nums, target) == output

    # ---------------------- Example 2 ----------------------
    nums = [4, 5, 6, 7, 0, 1, 2]
    target = 3
    output = -1
    assert MySolution().search(nums, target) == output

    # ---------------------- Example 3 ----------------------
    nums = [1]
    target = 0
    output = -1
    assert MySolution().search(nums, target) == output
