# Question Category : Graph
# Difficulty :
# Link to Leetcode Problem : https://leetcode.com/problems/longest-consecutive-sequence/
# NeedCode Video Solution : https://youtu.be/P6RZZMu_maU
# Obs.: use bruteforce and try to optimize, consider the max subseq containing each num; add each num to hashset, for each num if num-1 doesn’t exist, count the consecutive nums after num, ie num+1; there is also a union-find solution;
# Problem Desciption :
"""
Given an unsorted array of integers nums,
return the length of the longest consecutive elements sequence.

You must write an algorithm that runs in O(n) time.



Example 1:

Input: nums = [100,4,200,1,3,2]
Output: 4
Explanation: The longest consecutive elements sequence is [1, 2, 3, 4]. Therefore its length is 4.
Example 2:

Input: nums = [0,3,7,2,5,8,4,6,0,1]
Output: 9
Example 3:

Input: nums = [1,0,1,2]
Output: 3


Constraints:

0 <= nums.length <= 105
-109 <= nums[i] <= 109
"""


class NeedCodeSolution:
    def longestConsecutive(self, nums: list[int]) -> int:
        numbers_set = set(nums)
        longest_consecutive = 0

        for num in numbers_set:
            if (num - 1) not in numbers_set:
                current_length = 1
                while (num + current_length) in numbers_set:
                    current_length += 1
                longest_consecutive = max(longest_consecutive, current_length)

        return longest_consecutive


"""
Set membership is O(1) on average because Python stores set values in a hash table:
it hashes the value and jumps directly to the bucket where that value should be.
An array/list membership check is O(n) because it may need to scan each element
until it finds the target or reaches the end. That is why `(num - 1) in
numbers_set` and `(num + current_length) in numbers_set` keep this solution O(n)
overall instead of becoming O(n^2).
"""


def _test_cases():
    # Example 1:

    nums = [100, 4, 200, 1, 3, 2]
    output = 4
    assert NeedCodeSolution().longestConsecutive(nums) == output

    # Example 2:
    nums = [0, 3, 7, 2, 5, 8, 4, 6, 0, 1]
    output = 9
    assert NeedCodeSolution().longestConsecutive(nums) == output

    # Example 3:
    nums = [1, 0, 1, 2]
    output = 3
    assert NeedCodeSolution().longestConsecutive(nums) == output
