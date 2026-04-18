# Question Category : Arrays
# Difficulty : Easy
# Link to Leetcode Problem : https://leetcode.com/problems/best-time-to-buy-and-sell-stock/
# NeedCode Video Solution : https://youtu.be/1pkOgXD63yU
# Obs.: find local min and search for local max, sliding window;
# Problem Desciption :
"""
You are given an array prices where prices[i] is the price of a given stock on the ith day.

You want to maximize your profit by choosing a single day to buy one stock and choosing a different day in the future to sell that stock.

Return the maximum profit you can achieve from this transaction. If you cannot achieve any profit, return 0.

Example 1:

Input: prices = [7,1,5,3,6,4]
Output: 5
Explanation: Buy on day 2 (price = 1) and sell on day 5 (price = 6), profit = 6-1 = 5.
Note that buying on day 2 and selling on day 1 is not allowed because you must buy before you sell.
Example 2:

Input: prices = [7,6,4,3,1]
Output: 0
Explanation: In this case, no transactions are done and the max profit = 0.
"""


# class MySolution:
#     def max_profit(self, prices: list[int]) -> int:
#         maxValue = 0
#         for i in range(len(prices)):
#             value1 = prices[i]
#             value2 = max(prices[i:])
#             profit = value2 - value1
#             if profit > maxValue:
#                 maxValue = profit
#         return maxValue


class MySolution:
    def max_profit(self, prices: list[int]) -> int:
        max_value = 0
        lenght_of_prices = len(prices)
        for buy_day in range(0, lenght_of_prices - 1):
            for sell_day in range(buy_day + 1, lenght_of_prices):
                profit = prices[sell_day] - prices[buy_day]
                if profit > max_value:
                    print(f"{buy_day=} , {sell_day=} , {profit=}")
                    max_value = profit
        return max_value


# This brute-force approach checks every possible buy/sell pair.
# It exceeds LeetCode's time limit because it runs in O(n^2) time.
# It uses O(1) extra space because it only tracks the best profit found.


def _test_cases():
    # --------- example 01 ------------
    prices = [7, 1, 5, 3, 6, 4]
    otuput = 5
    assert MySolution().max_profit(prices) == otuput

    # --------- example 02 ------------
    prices = prices = [7, 6, 4, 3, 1]
    otuput = 0
    assert MySolution().max_profit(prices) == otuput


class NeetCodeSolution(object):
    def maxProfit(self, prices: list[int]) -> int:
        left = 0
        right = 1
        max_profit = 0

        while right < len(prices):
            if prices[left] < prices[right]:
                profit = prices[right] - prices[left]
                if profit > max_profit:
                    max_profit = profit
            else:
                left = right
            right += 1

        return max_profit


# Solution idea:
# Use two pointers as a sliding window over the array.
# `left` marks the best day to buy seen so far, and `right` scans future days to sell.
# If `prices[right]` is higher than `prices[left]`, compute the profit and keep the maximum.
# If `prices[right]` is lower or equal, move `left` to `right` because we found a better buy price.
#
# This works because the optimal transaction only needs the lowest price before each day,
# so we can process the array in one pass without checking every pair.
#
# Time complexity: O(n), because each day is visited once.
# Space complexity: O(1), because only a few variables are used.
