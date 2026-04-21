# Question Category : Arrays
# Difficulty : Easy
# Link to Leetcode Problem : https://leetcode.com/problems/two-furthest-houses-with-different-colors/description/?envType=daily-question&envId=2026-04-20
# Hints.:
#   1. The constraints are small. Can you try the combination of every two houses?
#   2. Greedily, the maximum distance will come from either the pair of the leftmost house and
#   possibly some house on the right with a different color, or the pair of the rightmost house and
#   possibly some house on the left with a different color.


# Problem Desciption :
"""
There are n houses evenly lined up on the street, and each house is beautifully painted. You are given a 0-indexed integer array colors of length n, where colors[i] represents the color of the ith house.

Return the maximum distance between two houses with different colors.

The distance between the ith and jth houses is abs(i - j), where abs(x) is the absolute value of x.



Example 1:


Input: colors = [1,1,1,6,1,1,1]
Output: 3
Explanation: In the above image, color 1 is blue, and color 6 is red.
The furthest two houses with different colors are house 0 and house 3.
House 0 has color 1, and house 3 has color 6. The distance between them is abs(0 - 3) = 3.
Note that houses 3 and 6 can also produce the optimal answer.
Example 2:


Input: colors = [1,8,3,8,3]
Output: 4
Explanation: In the above image, color 1 is blue, color 8 is yellow, and color 3 is green.
The furthest two houses with different colors are house 0 and house 4.
House 0 has color 1, and house 4 has color 3. The distance between them is abs(0 - 4) = 4.
Example 3:

Input: colors = [0,1]
Output: 1
Explanation: The furthest two houses with different colors are house 0 and house 1.
House 0 has color 0, and house 1 has color 1. The distance between them is abs(0 - 1) = 1.


Constraints:

n == colors.length
2 <= n <= 100
0 <= colors[i] <= 100
Test data are generated such that at least two houses have different colors.

"""


class MySolution(object):
    def max_distance(self, colors: list) -> int:
        length_of_colors = len(colors)
        if colors[length_of_colors - 1] != colors[0]:
            return length_of_colors - 1
        for i in range(1, (length_of_colors // 2) + 1):
            if colors[i - 1] != colors[i] or colors[length_of_colors - 1 - i] != colors[length_of_colors - i]:
                return length_of_colors - 1 - i
        return 0


"""
Idea of the solution:
First, compare the leftmost and rightmost colors. If they are different, the answer is immediately
`n - 1`, which is the maximum possible distance.

If they are the same, move inward from both sides and check adjacent positions until a different
color appears on either side. At that point, we can compute the largest valid distance by removing
the minimum number of matching edge positions.

The time complexity is O(n) because we scan the list at most once, and the space complexity is
O(1) because we use only a few variables.
"""


def _test_cases():
    # --------------- Example 01 ---------------
    colors = [1, 1, 1, 6, 1, 1, 1]
    output = 3
    assert MySolution().max_distance(colors) == output

    # --------------- Example 01 ---------------
    colors = [1, 8, 3, 8, 3]
    output = 4
    assert MySolution().max_distance(colors) == output

    # --------------- Example 01 ---------------
    colors = [0, 1]
    output = 1
    assert MySolution().max_distance(colors) == output
