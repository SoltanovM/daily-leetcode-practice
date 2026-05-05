# Question Category : Graph
# Difficulty : Medium
# Link to Leetcode Problem : https://leetcode.com/problems/course-schedule/
# NeedCode Video Solution : https://youtu.be/EgI5nU9etnU
# Obs.: build adjacentcy_list with edges, run dfs on each V, if while dfs on V we see V again,
# then loop exists, otherwise V isnt in a loop, 3 states= not visited, visited, still visiting

# Problem Desciption :
"""
There are a total of numCourses courses you have to take, labeled from 0 to numCourses - 1.
You are given an array prerequisites where prerequisites[i] = [ai, bi] indicates that
you must take course bi first if you want to take course ai.

For example, the pair [0, 1], indicates that to take course 0 you have to first take course 1.
Return true if you can finish all courses. Otherwise, return false.



Example 1:

Input: numCourses = 2, prerequisites = [[1,0]]
Output: true
Explanation: There are a total of 2 courses to take.
To take course 1 you should have finished course 0. So it is possible.
Example 2:

Input: numCourses = 2, prerequisites = [[1,0],[0,1]]
Output: false
Explanation: There are a total of 2 courses to take.
To take course 1 you should have finished course 0, and to take course 0 you should also have finished course 1. So it is impossible.


Constraints:

1 <= numCourses <= 2000
0 <= prerequisites.length <= 5000
prerequisites[i].length == 2
0 <= ai, bi < numCourses
All the pairs prerequisites[i] are unique.

"""


class MySolution:
    def canFinish(self, numCourses: int, prerequisites: list[list[int]]) -> bool:
        # prerequisites = [[0, 1], [0, 2], [1, 3], [1, 4], [3, 4]]
        # numCourses = 5
        finishable_courses = {index: None for index in range(numCourses)}

        def _create_pre_requisite_map() -> dict[int, list]:
            pre_requesite_map = {index: [] for index in range(numCourses)}
            for prerequisite in prerequisites:
                pre_requesite_map[prerequisite[0]].append(prerequisite[1])

            return pre_requesite_map

        pre_requesite_map = _create_pre_requisite_map()

        def _is_finishable(course_id: int) -> bool:
            if finishable_courses[course_id] is not None:
                return finishable_courses[course_id]
            if len(pre_requesite_map[course_id]) == 0:
                finishable_courses[course_id] = True
                return True
            else:
                # I got stuck here went to see the solution !!!!!
                return


class NeedCodeSolution:
    def canFinish(self, numCourses: int, prerequisites: list[list[int]]) -> bool:
        """
        The core of this problem is to determine if a set of courses with prerequisites can be completed,
        which is equivalent to detecting if there is a cycle in a directed graph. If a cycle exists, the courses cannot be completed.

        The Main Solution Idea
        The solution uses Depth First Search (DFS) to traverse the graph and identify cycles.

        Here is the step-by-step logic:

            - Represent the Graph: The prerequisites are stored in an adjacency list (called pre_requesite_map),
            where each course maps to a list of its required prerequisites.

            - Visit Tracking: To detect a loop (cycle), a `actively_visiting` is used to keep track of all nodes in the current recursion path.

            - DFS Traversal:
            For each course, if it is already in the `actively_visiting`, a cycle is detected (return false).
            If a course has an empty prerequisite list, it can be completed (return true).
            Otherwise, the algorithm recursively visits all prerequisites of the current course.

            - Optimization: Once a course is confirmed as completable, it is removed from the `actively_visiting`
            and its prerequisite list is cleared (set to empty).
            This ensures we don't re-process the same course multiple times.

        Complexity
            Time Complexity: O(N + P), where N is the number of courses and
            P is the number of prerequisite pairs, as every node and edge is visited at most once.

        By checking every course individually, the algorithm correctly handles cases where the graph might be disconnected.
        """
        pre_requesite_map = {index: [] for index in range(numCourses)}
        for prerequisite in prerequisites:
            pre_requesite_map[prerequisite[0]].append(prerequisite[1])

        actively_visiting = set()

        def depth_first_search(course: int) -> bool:
            if course in actively_visiting:
                return False
            if pre_requesite_map[course] == []:
                return True

            actively_visiting.add(course)
            for pre_requisite in pre_requesite_map[course]:
                if not depth_first_search(pre_requisite):
                    return False
            actively_visiting.remove(course)
            pre_requesite_map[course] = []
            return True

        for course_index in range(numCourses):
            if not depth_first_search(course_index):
                return False
        return True


def _test_cases() -> None:

    # Example 1:
    numCourses = 2
    prerequisites = [[1, 0]]
    output = True
    assert MySolution().canFinish(numCourses, prerequisites) == output

    # Example 2:
    numCourses = 2
    prerequisites = [[1, 0], [0, 1]]
    output = False
    assert MySolution().canFinish(numCourses, prerequisites) == output
