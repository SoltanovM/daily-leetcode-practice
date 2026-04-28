# Question Category : Dynamic Programming
# Difficulty : Medium
# Link to Leetcode Problem : https://leetcode.com/problems/coin-change/
# NeedCode Video Solution : https://youtu.be/H9bfqozjoqs
# Obs.: top-down: recursive dfs, for amount, branch for each coin, cache to store prev coin_count for each amount; bottom-up: compute coins for amount = 1, up until n, using for each coin (amount - coin), cache prev values
# Problem Desciption :
"""
You are given an integer array coins representing coins of different denominations and an integer amount representing a total amount of money.

Return the fewest number of coins that you need to make up that amount. If that amount of money cannot be made up by any combination of the coins, return -1.

You may assume that you have an infinite number of each kind of coin.



Example 1:

Input: coins = [1,2,5], amount = 11
Output: 3
Explanation: 11 = 5 + 5 + 1
Example 2:

Input: coins = [2], amount = 3
Output: -1
Example 3:

Input: coins = [1], amount = 0
Output: 0


Constraints:

1 <= coins.length <= 12
1 <= coins[i] <= 231 - 1
0 <= amount <= 104

"""


class MySolution:
    def coin_change(self, coins: list[int], amount: int) -> int:
        """
        This is also a recurrence relation problem.
        Using memoization, time complexity of the solution would be O(n)
        Space complexity is O(n) because of memoization
        """
        coin_change_results = {v: 1 for v in coins}
        coin_change_results[0] = 0

        def _coin_change(value: int) -> int:
            if value < 0:
                return -1
            if value in coin_change_results:
                return coin_change_results[value]
            else:
                possible_changes = []
                for coin in coins:
                    candidate_value = value - coin
                    coin_change_for_candidate_value = _coin_change(candidate_value)
                    if coin_change_for_candidate_value > 0:
                        possible_changes.append(coin_change_for_candidate_value)
                if len(possible_changes) > 0:
                    result = 1 + min(possible_changes)
                else:
                    result = -1
                coin_change_results[value] = result
                return result

        return _coin_change(value=amount)


def _test_cases():
    # Example 1:

    coins = [1, 2, 5]
    amount = 11
    output = 3
    assert MySolution().coin_change(coins, amount) == output

    # Example 2:
    coins = [2]
    amount = 3
    output = -1
    assert MySolution().coin_change(coins, amount) == output

    # Example 3:
    coins = [1]
    amount = 0
    output = 0
    assert MySolution().coin_change(coins, amount) == output
