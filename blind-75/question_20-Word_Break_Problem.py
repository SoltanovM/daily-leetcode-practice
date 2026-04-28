# Question Category : Dynamic Programming
# Difficulty : Medium
# Link to Leetcode Problem : https://leetcode.com/problems/word-break/
# NeedCode Video Solution : https://youtu.be/Sx9NNgInc3A
# Obs.: for each prefix, if prefix is in dict and wordbreak(remaining str)=True,
# then return True, cache result of wordbreak;
# Problem Desciption :
"""
Given a string s and a dictionary of strings wordDict, return true if
s can be segmented into a space-separated sequence of one or more dictionary words.

Note that the same word in the dictionary may be reused multiple times in the segmentation.



Example 1:

Input: s = "leetcode", wordDict = ["leet","code"]
Output: true
Explanation: Return true because "leetcode" can be segmented as "leet code".
Example 2:

Input: s = "applepenapple", wordDict = ["apple","pen"]
Output: true
Explanation: Return true because "applepenapple" can be segmented as "apple pen apple".
Note that you are allowed to reuse a dictionary word.
Example 3:

Input: s = "catsandog", wordDict = ["cats","dog","sand","and","cat"]
Output: false


Constraints:

1 <= s.length <= 300
1 <= wordDict.length <= 1000
1 <= wordDict[i].length <= 20
s and wordDict[i] consist of only lowercase English letters.
All the strings of wordDict are unique.
"""


class MySolution:
    def word_break(self, s: str, wordDict: list[str]) -> bool:
        """
        Recursive backtracking idea:
        try every dictionary word as a possible prefix of `s`. When a word
        matches, recursively check whether the remaining suffix can also be
        segmented into dictionary words.

        The empty string is the success base case, because it means every
        previous prefix choice consumed the whole input.

        Without memoization, the same suffix can be recomputed many times, so
        this implementation may be exponential in the worst case and can hit a
        time limit on larger inputs. The recursion stack uses up to O(len(s))
        space in the deepest path.
        """
        wordDict = list(set(wordDict))
        if len(s) == 0:
            return True
        for word in wordDict:
            if s[: len(word)] == word and self.word_break(s=s[len(word) :], wordDict=wordDict):
                return True
        return False


class NeedCodeSolution:
    def word_break(self, s: str, wordDict: list[str]) -> bool:
        wordDict = list(set(wordDict))
        dp = [False] * (len(s) + 1)
        dp[len(s)] = True
        for index in range(len(s) - 1, -1, -1):
            # print(f"{index=}")
            for word in wordDict:
                if (index + len(word)) <= len(s) and s[index : (index + len(word))] == word:
                    dp[index] = dp[index + len(word)]
                if dp[index]:
                    # print(f"{dp[index]=}")
                    break
        return dp[0]


def _test_case():
    # Example 1:
    s = "leetcode"
    wordDict = ["leet", "code"]
    output = True
    assert MySolution().word_break(s, wordDict) == output
    assert NeedCodeSolution().word_break(s, wordDict) == output

    # Example 2:
    s = "applepenapple"
    wordDict = ["apple", "pen"]
    output = True
    assert MySolution().word_break(s, wordDict) == output
    assert NeedCodeSolution().word_break(s, wordDict) == output

    # Example 3:
    s = "catsandog"
    wordDict = ["cats", "dog", "sand", "and", "cat"]
    output = False
    assert MySolution().word_break(s, wordDict) == output
    assert NeedCodeSolution().word_break(s, wordDict) == output
