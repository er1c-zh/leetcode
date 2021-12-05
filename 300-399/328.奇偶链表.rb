#
# @lc app=leetcode.cn id=328 lang=ruby
#
# [328] 奇偶链表
#

# @lc code=start
# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val = 0, _next = nil)
#         @val = val
#         @next = _next
#     end
# end
# @param {ListNode} head
# @return {ListNode}
def odd_even_list(head)
    if head == nil || head.next == nil
        return head
    end
    cur, curOdd, even, curEven = head.next.next, head, head.next, head.next

    curOdd.next = nil
    curEven.next = nil

    while cur != nil
        curOdd.next = cur

        cur = cur.next
        curOdd = curOdd.next
        curOdd.next = nil

        if cur == nil
            break
        end

        curEven.next = cur
        cur = cur.next
        curEven = curEven.next
        curEven.next = nil
    end

    curOdd.next = even

    return head
end
# @lc code=end
