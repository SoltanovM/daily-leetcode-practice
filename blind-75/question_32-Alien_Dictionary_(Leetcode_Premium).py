# Question Category : Graph
# Difficulty : Hard
# Link to Leetcode Problem : https://leetcode.com/problems/alien-dictionary/
# NeedCode Video Solution : https://youtu.be/6kTZYvNNyps
# Obs.: chars of a word not in order, the words are in order, find character_adjacencyacency list of each unique char by iterating through character_adjacencyacent words and finding first chars that are different, run topsort on graph and do loop detection;
# Problem Desciption :
"""
There is a new alien language that uses the English alphabet. However, the order of the letters is unknown to you.

You are given a list of strings words from the alien language's dictionary.
Now it is claimed that the strings in words are sorted lexicographically by the rules of this new language.

If this claim is incorrect, and the given arrangement of string in words cannot correspond to any order of letters, return "".

Otherwise, return a string of the unique letters in the new alien language sorted
in lexicographically increasing order by the new language's rules. If there are multiple solutions, return any of them.

Example 1:

Input: words = ["wrt","wrf","er","ett","rftt"]

Output: "wertf"

Example 2:

Input: words = ["z","x"]

Output: "zx"

Example 3:

Input: words = ["z","x","z"]

Output: ""

Explanation: The order is invalid, so return "".

"""


class MySolution:
    def alienOrder(self, words: list[str]) -> str:

        def letters_order(letters: list[str]) -> str:
            result = ""
            for letter in letters:
                if letter not in result:
                    result += letter
                elif result[-1] != letter:
                    return "NotOrderableError"
            return result

        def join_ordered_letters(first_letters: str, second_letters: str) -> str:
            # Build a shortest common supersequence: keep the shared relative order
            # from both strings by following their longest common subsequence, and
            # insert non-shared letters from either side as soon as they appear.
            first_size = len(first_letters)
            second_size = len(second_letters)
            lengths = [[0] * (second_size + 1) for _ in range(first_size + 1)]

            for first_index in range(first_size - 1, -1, -1):
                for second_index in range(second_size - 1, -1, -1):
                    if first_letters[first_index] == second_letters[second_index]:
                        lengths[first_index][second_index] = (
                            1 + lengths[first_index + 1][second_index + 1]
                        )
                    else:
                        lengths[first_index][second_index] = max(
                            lengths[first_index + 1][second_index],
                            lengths[first_index][second_index + 1],
                        )

            ordered_letters = []
            first_index = 0
            second_index = 0

            while first_index < first_size and second_index < second_size:
                if first_letters[first_index] == second_letters[second_index]:
                    ordered_letters.append(first_letters[first_index])
                    first_index += 1
                    second_index += 1
                elif (
                    lengths[first_index + 1][second_index]
                    >= lengths[first_index][second_index + 1]
                ):
                    ordered_letters.append(first_letters[first_index])
                    first_index += 1
                else:
                    ordered_letters.append(second_letters[second_index])
                    second_index += 1

            ordered_letters.extend(first_letters[first_index:])
            ordered_letters.extend(second_letters[second_index:])

            return "".join(ordered_letters)

        first_letters = "werxt"
        second_letters = "raxtf"
        output = "weraxtf"
        assert join_ordered_letters(first_letters, second_letters) == output

        first_letters = [word[0] for word in words]
        second_letters = [word[1] for word in words]

        first_letters_order = letters_order(first_letters)
        second_letters_order = letters_order(second_letters)

        return


class NeedCodeSolution:
    def alienOrder(self, words: list[str]) -> str:
        """
        The main idea of the solution is to treat the alien language dictionary as a Directed Acyclic Graph (DAG),
        where each unique character is a node and the ordering rules defined by the words represent directed edges.
        By using topological sort, we can determine the correct sequence of characters.

        Here is how the algorithm works:

        - Building the Graph: By comparing adjacent words in the input list, we identify the first differing characters.
            These pairs define the dependencies (e.g., if 't' comes before 'f', we add a directed edge from 't' to 'f').
        - Handling Edge Cases: If a longer word appears before its prefix (e.g., 'apes' before 'ape'), the ordering is invalid,
            and we return an empty string.
        - Traversing with DFS: We perform a post-order Depth First Search (DFS) to visit nodes.
            By appending characters to our result only after visiting all their descendants,
            we essentially build the valid character order in reverse.
        - Loop Detection: To detect invalid language rules (cycles), we keep track of the current recursion path
            using a hash map. If we encounter a node already in our current path, it indicates a cycle,
            meaning no valid solution exists.
        - Final Output: Once the DFS is complete, we reverse the collected list of characters to return the final
            lexicographical order of the alien language.

        """
        character_adjacency = {character: set() for word in words for character in word}

        for index in range(len(words) - 1):
            word_1 = words[index]
            word_2 = words[index + 1]
            min_len = min(len(word_1), len(word_2))

            if len(word_1) > len(word_2) and word_1[:min_len] == word_2[:min_len]:
                return ""

            for letter_index in range(min_len):
                if word_1[letter_index] != word_2[letter_index]:
                    character_adjacency[word_1[letter_index]].add(word_2[letter_index])
                    break

        visit = {}
        result = []

        def dfs(c: str):
            if c in visit:
                return visit[c]

            visit[c] = True
            for nei in character_adjacency[c]:
                if dfs(nei):
                    return True

            visit[c] = False
            result.append(c)

        for c in character_adjacency:
            if dfs(c):
                return ""

        result.reverse()

        return "".join(result)


def _test_cases():
    # Example 1:
    words = ["wrt", "wrf", "er", "ett", "rftt"]
    output = "wertf"
    assert NeedCodeSolution().alienOrder(words) == output

    # Example 2:
    words = ["z", "x"]
    output = "zx"
    assert NeedCodeSolution().alienOrder(words) == output

    # Example 3:
    words = ["z", "x", "z"]
    output = ""
    assert NeedCodeSolution().alienOrder(words) == output
