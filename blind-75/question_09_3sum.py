# Question Category : Arrays
# Difficulty : Medium
# Link to Leetcode Problem : https://leetcode.com/problems/3sum/
# NeedCode Video Solution : https://youtu.be/jzZsG8n2R9A
# Obs.: sort input, for each first element, find next two where -a = b+c, if a=prevA, skip a, if b=prevB skip b to elim duplicates; to find b,c use two pointers, left/right on remaining list;
# Problem Desciption :

"""
Given an integer array nums, return all the triplets [nums[i], nums[j], nums[k]] such that i != j, i != k, and j != k, and nums[i] + nums[j] + nums[k] == 0.

Notice that the solution set must not contain duplicate triplets.



Example 1:

Input: nums = [-1,0,1,2,-1,-4] --> [-4, -1, -1, 0, 1, 2]
Output: [[-1,-1,2],[-1,0,1]]
Explanation:
nums[0] + nums[1] + nums[2] = (-1) + 0 + 1 = 0.
nums[1] + nums[2] + nums[4] = 0 + 1 + (-1) = 0.
nums[0] + nums[3] + nums[4] = (-1) + 2 + (-1) = 0.
The distinct triplets are [-1,0,1] and [-1,-1,2].
Notice that the order of the output and the order of the triplets does not matter.
Example 2:

Input: nums = [0,1,1]
Output: []
Explanation: The only possible triplet does not sum up to 0.
Example 3:

Input: nums = [0,0,0]
Output: [[0,0,0]]
Explanation: The only possible triplet sums up to 0.

threeSum(nums)

"""
# Solution :


class MySolution(object):
    """
    Error: Time Limit Exceeded
    """

    def threeSum(self, nums: list[int]) -> list[list[int]]:
        result = []
        nums.sort()
        for index1 in range(len(nums)):
            for index2 in range(index1 + 1, len(nums)):
                for index3 in range(index2 + 1, len(nums)):
                    new_list = [nums[index1], nums[index2], nums[index3]]
                    if sum(new_list) == 0 and (new_list not in result):
                        result.append(new_list)
        return result


class NeetCodeSolution(object):
    def threeSum(self, nums: list[int]) -> list[list[int]]:
        result = []
        nums.sort()
        result = []
        for index_1, value_1 in enumerate(nums[:-2]):
            # index_1, value_1 = 1, nums[1]
            if index_1 > 0 and value_1 == nums[index_1 - 1]:
                continue
            two_sum_values = self.two_sum_with_target(adjusted_nums=nums[(index_1 + 1) :], target=-value_1)
            extended_list = []
            for two_sum_value in two_sum_values:
                new_list = [value_1]
                new_list.extend(two_sum_value)
                extended_list.append(new_list)

            if len(extended_list) > 0:
                result.extend(extended_list)
        return result

    def two_sum_with_target(self, adjusted_nums: list[int], target: int) -> list[int]:
        """
        Find two values in sorted adjusted_nums that add up to target.

        Use two pointers: start with left_index at the first element and
        right_index at the last element. If their sum is too small, move
        left_index right to increase the sum. If their sum is too large,
        move right_index left to decrease the sum. Because each pointer only
        moves inward, the scan takes O(n) time.
        """
        left_index = 0
        right_index = len(adjusted_nums) - 1
        two_sum_values = []
        while left_index < right_index:
            left_value = adjusted_nums[left_index]
            right_value = adjusted_nums[right_index]
            total_value = left_value + right_value
            if target == total_value:
                two_sum_values.append([left_value, right_value])
                left_index += 1
            else:
                if total_value < target:
                    left_index += 1
                else:
                    right_index -= 1
        return two_sum_values


def _test_cases():
    # ------------- Example 1 -------------
    nums = [-1, 0, 1, 2, -1, -4]
    output = [[-1, -1, 2], [-1, 0, 1]]
    assert NeetCodeSolution().threeSum(nums) == output

    # ------------- Example 2 -------------
    nums = [0, 1, 1]
    output = []
    assert NeetCodeSolution().threeSum(nums) == output

    # ------------- Example 3 -------------
    nums = [0, 0, 0]
    output = [[0, 0, 0]]
    assert NeetCodeSolution().threeSum(nums) == output


for i in range(10):
    if i == 4:
        continue
    print(i)
