# Question Category : Dynamic Programming
# Difficulty : Medium
# Link to Leetcode Problem : https://leetcode.com/problems/house-robber/
# NeedCode Video Solution : https://youtu.be/73r3KWiEvyk
# Obs.: for each num, get max of prev subarr, or num + prev subarr not including last element, store results of prev, and prev not including last element
# Problem Desciption :
"""

198. House Robber

You are a professional robber planning to rob houses along a street.
Each house has a certain amount of money stashed, the only constraint stopping you from
robbing each of them is that adjacent houses have security systems connected and it will
automatically contact the police if two adjacent houses were broken into on the same night.

Given an integer array nums representing the amount of money of each house,
return the maximum amount of money you can rob tonight without alerting the police.



Example 1:

Input: nums = [1,2,3,1]
Output: 4
Explanation: Rob house 1 (money = 1) and then rob house 3 (money = 3).
Total amount you can rob = 1 + 3 = 4.
Example 2:

Input: nums = [2,7,9,3,1]
Output: 12
Explanation: Rob house 1 (money = 2), rob house 3 (money = 9) and rob house 5 (money = 1).
Total amount you can rob = 2 + 9 + 1 = 12.


Constraints:

1 <= nums.length <= 100
0 <= nums[i] <= 400

"""


class MySolution:
    def rob(self, nums: list[int]) -> int:
        """
        Recursive recurrence:
        max(rob current house + best from nums[2:], best from nums[1:]).

        This recomputes the same subproblems many times, so the time complexity is
        O(2^n). LeetCode rejects this approach with Time Limit Exceeded.
        """
        if len(nums) == 0:
            return 0
        if len(nums) == 1:
            return nums[0]
        if len(nums) == 2:
            return max(nums)
        return max(nums[0] + self.rob(nums[2:]), self.rob(nums[1:]))


class NeedCodeSolution:
    def rob(self, nums: list[int]) -> int:
        """
        The core idea for solving the House Robber problem (198) uses Dynamic Programming to break down a complex problem into smaller,
        manageable subproblems. Since you cannot rob two adjacent houses, you must constantly decide whether to rob the current house or skip it.

        The Recurrence Relationship:
        To find the maximum money you can rob up to any specific house, you have two main choices

        Rob the current house: You get the money from the current house plus the maximum amount you could have robbed up to two houses ago (skipping the immediate neighbor).
        Skip the current house: You get the same maximum amount that you were able to collect up to the previous house.
        The Optimal Approach:
        Instead of calculating every path (which would be inefficient), you only need to keep track of the last two maximum values computed. This reduces the memory complexity significantly

        Maintain two variables, let's call them rob1 and rob2, initialized to 0.
        Iterate through the array of houses. For each house (n):
        Calculate the new maximum as the greater of: (n + rob1) or (rob2).
        Shift your variables forward: update rob1 to hold the value of rob2, and rob2 to hold your newly calculated maximum.
        By the end of the loop, rob2 will contain the maximum amount you can rob from the entire neighborhood.
        """

        rob1, rob2 = 0, 0
        # [rob1, rob2, n, n+1, ...]
        for n in nums:
            tmp = max(n + rob1, rob2)
            rob1 = rob2
            rob2 = tmp
        return rob2


def _test_cases():
    # Example 1:
    nums = [1, 2, 3, 1]
    output = 4
    assert MySolution().rob(nums) == output

    # Example 2:
    nums = [2, 7, 9, 3, 1]
    output = 12
    assert MySolution().rob(nums) == output
