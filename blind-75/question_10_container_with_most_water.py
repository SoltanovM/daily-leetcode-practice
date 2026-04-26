# Question Category : Arrays
# Difficulty : Medium
# Link to Leetcode Problem : https://leetcode.com/problems/container-with-most-water/
# NeedCode Video Solution : https://youtu.be/UuiTKBwPgAo
# Obs.: shrinking window, left/right initially at endpoints, shift the pointer with min height;
# Problem Desciption :
"""
You are given an integer array height of length n. There are n vertical lines drawn such that the two endpoints of the ith line are (i, 0) and (i, height[i]).

Find two lines that together with the x-axis form a container, such that the container contains the most water.

Return the maximum amount of water a container can store.

Notice that you may not slant the container.


Input: height = [1,8,6,2,5,4,8,3,7]
Output: 49
Explanation: The above vertical lines are represented by array [1,8,6,2,5,4,8,3,7]. In this case, the max area of water (blue section) the container can contain is 49.
Example 2:

Input: height = [1,1]
Output: 1
"""


class MySolution(object):
    def max_area(self, height: list[int]) -> int:
        """
        Brute Force solution: test all possible values and take the max value.
        It iterates 2 times the whole list, so time complexity is O(n^2), space complexity is O(1)
        Leetcode didnt accept my solution because of TimeLimitExceeded
        """
        result = 0
        for index_01, value_01 in enumerate(height[:-1]):
            for index2 in range(index_01 + 1, len(height)):
                value2 = height[index2]
                common_height = min([value_01, value2])
                area = common_height * (index2 - index_01)
                result = max([result, area])
        return result


class NeetCodeSolution(object):
    def max_area(self, height: list[int]) -> int:
        """
        Two pointer solution, change index of pointer which has minor value.
        """
        result = 0
        left_index, right_index = 0, len(height) - 1
        while left_index < right_index:
            area = (right_index - left_index) * min(height[left_index], height[right_index])
            result = max(result, area)

            if height[left_index] < height[right_index]:
                left_index += 1
            else:
                right_index -= 1
        return result


def _test_case():
    # Example : 01
    height = [1, 8, 6, 2, 5, 4, 8, 3, 7]
    output = 49
    assert MySolution().max_area(height) == output

    # Example : 02
    height = [1, 1]
    output = 1
    assert MySolution().max_area(height) == output
