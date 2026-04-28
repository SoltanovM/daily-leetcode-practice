# Question Category : Binary
# Difficulty : Easy
# Link to Leetcode Problem : https://leetcode.com/problems/missing-number/
# NeedCode Video Solution : https://youtu.be/WnPLSRLSANE
# Obs.: compute expected sum - real sum; xor n with each index and value;
# Problem Desciption :
"""
Given an array nums containing n distinct numbers in the range [0, n], return the only number in the range that is missing from the array.


Example 1:

Input: nums = [3,0,1]

Output: 2

Explanation:

n = 3 since there are 3 numbers, so all numbers are in the range [0,3]. 2 is the missing number in the range since it does not appear in nums.

Example 2:

Input: nums = [0,1]

Output: 2

Explanation:

n = 2 since there are 2 numbers, so all numbers are in the range [0,2]. 2 is the missing number in the range since it does not appear in nums.

Example 3:

Input: nums = [9,6,4,2,3,5,7,0,1]

Output: 8

Explanation:

n = 9 since there are 9 numbers, so all numbers are in the range [0,9]. 8 is the missing number in the range since it does not appear in nums.



Constraints:

n == nums.length
1 <= n <= 104
0 <= nums[i] <= n
All the numbers of nums are unique.


Follow up: Could you implement a solution using only O(1) extra space complexity and O(n) runtime complexity?


"""


class MySolution:
    def missing_number(self, nums: list[int]) -> int:
        """
        Just iterate all numbers in 0 -> n (both sides including) return one returning
        As it iterates all ums 2 times, time complexity is O(n^2)
        """
        for i in range(len(nums) + 1):
            if i not in nums:
                return i

    def missing_number_02(self, nums: list[int]) -> int:
        """
        Idea: When you sum all numbers from 1-to-n, and subtract sum of values in nums, it would return missing number
        Sum of numbers from 1 - to - n is: (n*(n+1))/2
        """
        n = len(nums)
        return int((n * (n + 1)) / 2 - sum(nums))


def _test_case():
    # Example 1:
    nums = [3, 0, 1]
    output = 2
    assert MySolution().missing_number(nums) == output
    assert MySolution().missing_number_02(nums) == output

    # Example 2:
    nums = [0, 1]
    output = 2
    assert MySolution().missing_number(nums) == output

    # Example 3:
    nums = [9, 6, 4, 2, 3, 5, 7, 0, 1]
    output = 8
    assert MySolution().missing_number(nums) == output
