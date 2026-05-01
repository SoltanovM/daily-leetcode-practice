# Question Category : Dynamic Programming
# Difficulty : Medium
# Link to Leetcode Problem : https://leetcode.com/problems/decode-ways/
# NeedCode Video Solution : https://youtu.be/6aEyTjOwlJU
# Obs.: can cur char be decoded in one or two ways? Recursion -> cache -> iterative dp solution, a lot of edge cases to determine, 52, 31, 29, 10, 20 only decoded one way, 11, 26 decoded two ways
# Problem Desciption :
"""
You have intercepted a secret message encoded as a string of numbers. The message is decoded via the following mapping:

"1" -> 'A'

"2" -> 'B'

...

"25" -> 'Y'

"26" -> 'Z'

However, while decoding the message, you realize that there are many different ways you can decode the message because
some codes are contained in other codes ("2" and "5" vs "25").

For example, "11106" can be decoded into:

"AAJF" with the grouping (1, 1, 10, 6)
"KJF" with the grouping (11, 10, 6)
The grouping (1, 11, 06) is invalid because "06" is not a valid code (only "6" is valid).
Note: there may be strings that are impossible to decode.

Given a string s containing only digits, return the number of ways to decode it. If the entire string
cannot be decoded in any valid way, return 0.

The test cases are generated so that the answer fits in a 32-bit integer.



Example 1:

Input: s = "12"

Output: 2

Explanation:

"12" could be decoded as "AB" (1 2) or "L" (12).

Example 2:

Input: s = "226"

Output: 3

Explanation:

"226" could be decoded as "BZ" (2 26), "VF" (22 6), or "BBF" (2 2 6).

Example 3:

Input: s = "06"

Output: 0

Explanation:

"06" cannot be mapped to "F" because of the leading zero ("6" is different from "06"). In this case, the string is not a valid encoding, so return 0.



"""


class MySolution:
    def num_decodings(self, s: str) -> int:
        """
        Time Limit Exceeded, need to do some kindo of memoization
        """

        MAX_VALUE = 26
        result = 0

        if len(s) == 0:
            return result
        if int(s[0]) == 0:
            return result

        if len(s) == 1:
            return 1
        if len(s) == 2:
            if int(s) <= MAX_VALUE and int(s[1]) != 0:
                return 2
            return 1

        n1 = self.num_decodings(s[1:])
        n2 = self.num_decodings(s[2:])

        if n1 > 0:
            result += n1
        if n2 > 0 and int(s[:2]) <= MAX_VALUE:
            result += n2
        return result


class NeedCodeSolution:
    def num_decodings(self, s: str) -> int:
        """
        The core idea behind solving the Decode Ways problem (LeetCode 91) is to use Dynamic Programming (DP) or
        memoized recursion to count the number of ways to decode a string of digits into characters (1-26).
        Since choosing a single digit or a double-digit number at any given position affects the remaining possibilities,
        the problem can be broken down into smaller, overlapping sub-problems.

        Key Concepts:
        Decision Tree: At each position in the string, you generally have two choices:
        Take the current character as a single digit (if it is not '0').
        Take the current character plus the next as a double-digit number (if it forms a value between 10 and 26).
        Dynamic Programming approach: Instead of recomputing the same sub-problems (which leads to an exponential O(2^n) time complexity),
        you store the results of each index in a cache or array. This reduces the time complexity to O(n).

        Base Cases:
        If you reach the end of the string, you've found one valid way (return 1).
        If the current character is '0', it cannot be mapped, making that path invalid (return 0).
        Validation logic: To check if a double-digit is valid, you ensure the current digit is '1' (covering 10-19) or '2'
        combined with a second digit between '0'-'6' (covering 20-26).

        Implementation Methods:
        Recursive with Memoization: You build a DFS function that caches results for each index i.
        Iterative Bottom-Up: You fill an array from the end of the string to the beginning, which also runs in O(n) time.
        The logic remains essentially the same as the recursive version, but it avoids recursion depth limits and is slightly more memory-efficient.
        """
        dp = {len(s): 1}

        def dfs(index: int) -> int:
            if index in dp:
                return dp[index]
            if s[index] == "0":
                return 0

            res = dfs(index + 1)
            if (index + 1 < len(s)) and (s[index] == "1" or (s[index] == "2" and s[index + 1] in "0123456")):
                res += dfs(index + 2)
            dp[index] = res
            return res

        return dfs(0)


def _test_cases():
    # Example 1:
    s = "12"
    output = 2
    assert MySolution().num_decodings(s) == output

    # Example 2:
    s = "226"
    output = 3
    assert MySolution().num_decodings(s) == output

    # Example 3:
    s = "06"
    output = 0
    assert MySolution().num_decodings(s) == output
