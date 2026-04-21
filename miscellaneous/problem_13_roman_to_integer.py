# Question Category : ?
# Difficulty : Easy
# Link to Leetcode Problem : https://leetcode.com/problems/roman-to-integer/
# Problem Desciption :
"""
Roman numerals are represented by seven different symbols: I, V, X, L, C, D and M.

Symbol       Value
I             1
V             5
X             10
L             50
C             100
D             500
M             1000
For example, 2 is written as II in Roman numeral, just two ones added together. 12 is written as XII, which is simply X + II. The number 27 is written as XXVII, which is XX + V + II.

Roman numerals are usually written largest to smallest from left to right. However, the numeral for four is not IIII. Instead, the number four is written as IV. Because the one is before the five we subtract it making four. The same principle applies to the number nine, which is written as IX. There are six instances where subtraction is used:

I can be placed before V (5) and X (10) to make 4 and 9.
X can be placed before L (50) and C (100) to make 40 and 90.
C can be placed before D (500) and M (1000) to make 400 and 900.
Given a roman numeral, convert it to an integer.



Example 1:

Input: s = "III"
Output: 3
Explanation: III = 3.
Example 2:

Input: s = "LVIII"
Output: 58
Explanation: L = 50, V= 5, III = 3.
Example 3:

Input: s = "MCMXCIV"
Output: 1994
Explanation: M = 1000, CM = 900, XC = 90 and IV = 4.


Constraints:

1 <= s.length <= 15
s contains only the characters ('I', 'V', 'X', 'L', 'C', 'D', 'M').
It is guaranteed that s is a valid roman numeral in the range [1, 3999].

"""

from typing import Literal


class MySolution:
    def roman_to_int(self, s: str) -> int:
        """
        :type s: str
        :rtype: int
        """
        result = 0
        for i in range(len(s)):
            symbol = s[i]
            value1 = self.get_symbol_value(symbol)
            if i + 1 == len(s):
                result += value1
                return result
            else:
                next_symbol = s[i + 1]
                value2 = self.get_symbol_value(next_symbol)
                if value2 > value1:
                    result -= value1
                else:
                    result += value1
        return result

    def get_symbol_value(self, s: str) -> Literal[1] | Literal[5] | Literal[10] | Literal[50] | Literal[100] | Literal[500] | Literal[1000]:
        if s == "I":
            return 1
        elif s == "V":
            return 5
        elif s == "X":
            return 10
        elif s == "L":
            return 50
        elif s == "C":
            return 100
        elif s == "D":
            return 500
        elif s == "M":
            return 1000
        else:
            raise Exception("InvalidValue")


def _test_cases() -> None:
    # ----------- Example : 01 ---------
    s = "III"
    output = 3
    assert MySolution().roman_to_int(s) == output

    # ----------- Example : 02 ---------
    s = "LVIII"
    output = 58
    assert MySolution().roman_to_int(s) == output

    # ----------- Example : 03 ---------
    s = "MCMXCIV"
    output = 1994
    assert MySolution().roman_to_int(s) == output
