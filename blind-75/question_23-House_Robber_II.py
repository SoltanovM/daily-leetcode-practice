# Question Category : Dynamic Programming
# Difficulty : Medium
# Link to Leetcode Problem : https://leetcode.com/problems/house-robber-ii/
# NeedCode Video Solution : https://youtu.be/rWAJCfYYOvM
# Obs.: subarr = arr without first & last, get max of subarr, then pick which of first/last should be added to it
# Problem Desciption :
"""
You are a professional robber planning to rob houses along a street.
Each house has a certain amount of money stashed. All houses at this
place are arranged in a circle. That means the first house is the neighbor
of the last one. Meanwhile, adjacent houses have a security system connected,
and it will automatically contact the police if two adjacent houses were broken into on the same night.

Given an integer array nums representing the amount of money of each house,
return the maximum amount of money you can rob tonight without alerting the police.



Example 1:

Input: nums = [2,3,2]
Output: 3
Explanation: You cannot rob house 1 (money = 2) and then rob house 3 (money = 2), because they are adjacent houses.
Example 2:

Input: nums = [1,2,3,1]
Output: 4
Explanation: Rob house 1 (money = 1) and then rob house 3 (money = 3).
Total amount you can rob = 1 + 3 = 4.
Example 3:

Input: nums = [1,2,3]
Output: 3


Constraints:

1 <= nums.length <= 100
0 <= nums[i] <= 1000


"""


class MySolution:
    def rob(self, nums: list[int]) -> int:
        if len(nums) == 0:
            return 0
        if len(nums) == 1:
            return nums[0]
        if len(nums) == 2:
            return max(nums)

        return max(nums[0] + self.linear_rob(nums[2:(-1)]), self.linear_rob(nums[1:]))

    def linear_rob(self, linear_nums: list[int]) -> int:
        rob1, rob2 = 0, 0
        # [rob1, rob2, n, n+1, ...]
        for n in linear_nums:
            tmp = max(n + rob1, rob2)
            rob1 = rob2
            rob2 = tmp
        return rob2


class NeedCodeSolution:
    def rob(self, nums: list[int]) -> int:
        return


def _test_cases():
    # Example 1:
    nums = [2, 3, 2]
    output = 3
    assert MySolution().rob(nums) == output

    # Example 2:
    nums = [1, 2, 3, 1]
    output = 4
    assert MySolution().rob(nums) == output

    # Example 3:
    nums = [1, 2, 3]
    output = 3
    assert MySolution().rob(nums) == output
