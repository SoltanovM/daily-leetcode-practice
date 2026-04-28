# Question Category : Dynamic Programming
# Difficulty : Easy
# Link to Leetcode Problem : https://leetcode.com/problems/climbing-stairs/
# NeedCode Video Solution : https://youtu.be/Y0lT9Fck7qI
# Obs.: subproblem find (n-1) and (n-2), sum = n;
# Problem Desciption :
"""
You are climbing a staircase. It takes n steps to reach the top.

Each time you can either climb 1 or 2 steps. In how many distinct ways can you climb to the top?

Example 1:
Input: n = 2
Output: 2
Explanation: There are two ways to climb to the top.
1. 1 step + 1 step
2. 2 steps

Example 2:
Input: n = 3
Output: 3
Explanation: There are three ways to climb to the top.
1. 1 step + 1 step + 1 step
2. 1 step + 2 steps
3. 2 steps + 1 step"""


class MySolution:
    def climbStairs(self, n: int) -> int:
        """
        Recurrence relation: Find values for base cases, then follow the recurrence funtion:
            f_n  = f_(n-1) + f_(n-2)

        As it uses memoization --- doesnt calculate for the same value, time complexity is O(n)
        """
        calculated_values = {1: 1, 2: 2}

        def climber(x) -> int:
            if x in calculated_values:
                return calculated_values[x]
            else:
                calculated_values[x] = climber(x - 1) + climber(x - 2)
                return calculated_values[x]

        return climber(n)


class NeetcodeSolution:
    def climbStairs(self, n: int) -> int:
        one_step = 1
        two_step = 1

        for i in range(n - 1):
            temp = one_step
            one_step = one_step + two_step
            two_step = temp
        return one_step


def _test_cases():
    # Example 1:
    n = 2
    output = 2
    assert MySolution().climbStairs(n) == output

    # Example 2:
    n = 3
    output = 3
    assert MySolution().climbStairs(n) == output
