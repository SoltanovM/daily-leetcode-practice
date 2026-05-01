# Question Category : Dynamic Programming
# Difficulty : Medium
# Link to Leetcode Problem : https://leetcode.com/problems/combination-sum/
# NeedCode Video Solution : https://youtu.be/GBKI9VSKdGg
# Obs.: visualize the decision tree, base case is curSum = or > target,
# each candidate can have children of itself or elements to right of it inorder to elim duplicate solutions;
# Problem Desciption :
"""
Given an array of distinct integers candidates and a target integer target, return a list of all unique combinations of candidates
where the chosen numbers sum to target. You may return the combinations in any order.

The same number may be chosen from candidates an unlimited number of times.
Two combinations are unique if the frequency of at least one of the chosen numbers is different.

The test cases are generated such that the number of unique combinations that sum up to target is less than 150 combinations for the given input.



Example 1:

Input: candidates = [2,3,6,7], target = 7
Output: [[2,2,3],[7]]
Explanation:
2 and 3 are candidates, and 2 + 2 + 3 = 7. Note that 2 can be used multiple times.
7 is a candidate, and 7 = 7.
These are the only two combinations.
Example 2:

Input: candidates = [2,3,5], target = 8
Output: [[2,2,2,2],[2,3,3],[3,5]]
Example 3:

Input: candidates = [2], target = 1
Output: []


Constraints:

1 <= candidates.length <= 30
2 <= candidates[i] <= 40
All elements of candidates are distinct.
1 <= target <= 40

"""

"""
DFS - Deep first Search is a fundamental graph traversal algorithm that explores as deep as possible along each branch before backtracking. 
It is widely used for discovering structure within graphs and trees, such as finding connected components or detecting cycles.

In Combination Sum, DFS is used as a backtracking search over a decision tree:
- Each node represents the current partial combination and remaining target.
- Reusing the same index allows a candidate to appear multiple times.
- Moving only forward through candidate indexes avoids duplicate permutations such as [2, 3, 2].
- The search stops when the remaining target is 0, and it prunes branches once the sum would exceed the target.

Related algorithms and ideas:
- Backtracking: DFS plus undoing choices after each recursive call; useful for permutations, subsets, N-Queens, and Sudoku.
- BFS: explores combinations level by level instead of deeply; it can work for shortest-path style problems, but usually uses more memory here.
- Dynamic Programming: useful when counting combinations or optimizing a value, but less direct when every actual combination must be returned.
- Branch and Bound: prune impossible paths early, often by sorting candidates and stopping when candidate > remaining target.
- Recursion Tree Analysis: helps estimate complexity by looking at the branching factor and maximum depth target / min(candidates).
"""

# I tried some recursive ideas but couldnt implement, after 10-15 mins skipped directly to need-code solution


class NeedCodeSolution:
    def combination_sum(self, candidates: list[int], target: int) -> list[list[int]]:
        """
        The main idea to solve the Combination Sum problem is using a backtracking approach
        based on a decision tree to find all unique combinations that sum up to a given target value.

        To avoid generating duplicate combinations (which happen if you just treat this as a permutation problem),
        the solution follows a specific recursive logic.

        The Two-Decision Branching Strategy: At each step in the recursion, you make one of two choices:
            - Include the current candidate: You add the number to your running total and keep the same index (i)
            so you can potentially reuse the same number again in subsequent recursive calls.
            - Skip the current candidate: You move to the next index (i + 1) to ensure you never use the skipped number again in this branch,
            which prevents duplicate combinations like [2, 2, 3] and [3, 2, 2].

        Base Cases for Stopping:
            Success: If the current total exactly equals the target, you have found a valid combination and add a copy of it to your results.
            Failure: If the total exceeds the target or if you have run out of candidates to choose from (the index i is out of bounds),
                you stop searching down that path.

        This method ensures you explore all valid combinations efficiently without the redundancy of permutations,
        resulting in a time complexity of roughly 2 to the power of T (where T is the target value).
        """
        result = []

        def dfs(index: int, current_comb: list) -> None:
            """
            Explore combinations starting at candidates[index].

            current_comb stores the active path, and total is its sum. The
            recursive branch that keeps index reuses the same candidate, while
            the branch that advances index skips it permanently to avoid
            duplicate permutations of the same combination.
            """
            total = sum(current_comb)
            if total == target:
                result.append(current_comb.copy())
                return
            if index >= len(candidates) or total > target:
                return

            current_comb.append(candidates[index])
            dfs(index, current_comb)

            current_comb.pop()
            dfs(index + 1, current_comb)

        dfs(0, [])
        return result


def _test_cases():
    # Example 1:
    candidates = [2, 3, 6, 7]
    target = 7
    output = [[2, 2, 3], [7]]
    assert NeedCodeSolution().combination_sum(candidates, target) == output

    # Example 2:
    candidates = [2, 3, 5]
    target = 8
    output = [[2, 2, 2, 2], [2, 3, 3], [3, 5]]
    assert NeedCodeSolution().combination_sum(candidates, target) == output

    # Example 3:
    candidates = [2]
    target = 1
    output = []
    assert NeedCodeSolution().combination_sum(candidates, target) == output
