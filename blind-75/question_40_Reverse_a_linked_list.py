# Question Category : Linked List
# Difficulty :
# Link to Leetcode Problem : https://leetcode.com/problems/reverse-linked-list/
# NeedCode Video Solution : https://youtu.be/G0_I-ZF0S38
# Obs.: iterate through maintaining cur and prev; recursively reverse, return new head of list
# Problem Desciption :
"""
Given the head of a singly linked list, reverse the list, and return the reversed list.



Example 1:


Input: head = [1,2,3,4,5]
Output: [5,4,3,2,1]
Example 2:


Input: head = [1,2]
Output: [2,1]
Example 3:

Input: head = []
Output: []


Constraints:

The number of nodes in the list is the range [0, 5000].
-5000 <= Node.val <= 5000


Follow up: A linked list can be reversed either iteratively or recursively. Could you implement both?



"""

from typing import Optional


# Definition for singly-linked list.
class ListNode(object):
    def __init__(self, val=0, next=None):
        self.val = val
        self.next = next


class MySolution:
    def reverseList(self, head: Optional[ListNode]) -> Optional[ListNode]:
        result_head = None
        current_node = head
        while current_node is not None:
            # print(f"{current_node.val=}")
            tmp_node = current_node.next
            current_node.next = result_head
            result_head = current_node
            current_node = tmp_node
        return result_head


# The main difficulty here is usually not the reversal itself, but getting
# comfortable with the `ListNode` abstraction and with how pointers move from
# one node to the next. That is why the helper functions below are useful: they
# make it easier to build small linked lists, inspect them, and verify the
# result in a more familiar Python-list form.
#
# The core idea of the iterative solution is straightforward:
# take the current node from the original list and move it to the front of the
# reversed portion. Before changing `current_node.next`, we store the original
# `next` node in a temporary variable so we do not lose access to the rest of
# the list.
#
# In other words, each loop does three things:
# 1. Save the next node.
# 2. Point the current node to the already-reversed part.
# 3. Advance both references.
#
# Time complexity is O(n) because each node is visited exactly once.
# Space complexity is O(1) because the algorithm only uses a few pointers,
# regardless of the size of the input list.


def _build_linked_list(values: list) -> ListNode:
    dummy = ListNode()
    tail = dummy
    for value in values:
        tail.next = ListNode(value)
        tail = tail.next
    return dummy.next


def _linked_list_to_list(head: ListNode) -> list:
    values = []
    current = head
    while current:
        values.append(current.val)
        current = current.next
    return values


def _test_cases():
    # --------- example 01 ------------
    head = _build_linked_list([1, 2, 3, 4, 5])
    head.val
    head.next.val
    head.next.next.val
    output = [5, 4, 3, 2, 1]
    assert _linked_list_to_list(MySolution().reverseList(head)) == output

    # --------- example 02 ------------
    head = _build_linked_list([1, 2])
    output = [2, 1]
    assert _linked_list_to_list(MySolution().reverseList(head)) == output

    # --------- example 03 ------------
    head = _build_linked_list([])
    output = []
    assert _linked_list_to_list(MySolution().reverseList(head)) == output
