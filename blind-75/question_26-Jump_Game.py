# Question Category : Dynamic Programming
# Difficulty : Medium
# Link to Leetcode Problem : https://leetcode.com/problems/jump-game/
# NeedCode Video Solution : https://youtu.be/Yan0cv2cLy8
# Obs.: visualize the recursive tree, cache solution for O(n) time/mem complexity, iterative is O(1) mem, just iterate backwards to see if element can reach goal node, if yes, then set it equal to goal node, continue;
# Problem Desciption :
"""
You are given an integer array nums. You are initially positioned at the array's first index,
and each element in the array represents your maximum jump length at that position.

Return true if you can reach the last index, or false otherwise.



Example 1:

Input: nums = [2,3,1,1,4]
Output: true
Explanation: Jump 1 step from index 0 to 1, then 3 steps to the last index.
Example 2:

Input: nums = [3,2,1,0,4]
Output: false
Explanation: You will always arrive at index 3 no matter what. Its maximum jump length is 0,
which makes it impossible to reach the last index.


Constraints:

1 <= nums.length <= 104
0 <= nums[i] <= 105
"""


class MySolution:
    def canJump(self, nums: list[int]) -> bool:
        """
        Brute Force solution, memory inefficient, but accepted solution, O(n^2) time complexity, O(n) space complexity
        """
        if len(nums) == 1:
            return True

        already_processed = {len(nums) - 1: True}

        def _can_jump(index: int) -> bool:
            if index in already_processed:
                return already_processed[index]
            if index >= len(nums) - 1:
                already_processed[index] = True
                return True
            if nums[index] == 0:
                already_processed[index] = False
                return False

            next_possible_indexes = list(range(nums[index] + index, index, -1))
            for i in next_possible_indexes:
                if _can_jump(i):
                    already_processed[index] = True
                    return True
            already_processed[index] = False
            return False

        return _can_jump(index=0)


class NeedCodeSolution:
    def canJump(self, nums: list[int]) -> bool:
        target = len(nums) - 1

        for index in range(len(nums) - 1, -1, -1):
            if index + nums[index] >= target:
                target = index

        return target == 0


def _test_cases():
    # Example 1:
    nums = [2, 3, 1, 1, 4]
    output = True
    assert MySolution().canJump(nums) == output

    # Example 2:
    nums = [3, 2, 1, 0, 4]
    output = False
    assert MySolution().canJump(nums) == output

    nums = [2, 0, 0]
    output = True
    assert MySolution().canJump(nums) == output

    nums = [2, 5, 0, 0]
    output = True
    assert MySolution().canJump(nums) == output
