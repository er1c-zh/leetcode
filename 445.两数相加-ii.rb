#
# @lc app=leetcode.cn id=445 lang=ruby
#
# [445] 两数相加 II
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
# @param {ListNode} l1
# @param {ListNode} l2
# @return {ListNode}
def add_two_numbers(l1, l2)
    s1, s2 = [], []
    while l1 != nil
        s1.append l1
        l1 = l1.next
    end
    while l2 != nil
        s2.append l2
        l2 = l2.next
    end
    if s1.length < s2.length
        s1, s2 = s2, s1
    end
    cur = nil
    carry = 0
    while !s1.empty?
        v1 = s1[-1]
        s1 = s1[0..-2]
        v2 = nil
        if !s2.empty?
            v2 = s2[-1]
            s2 = s2[0..-2]
        end
        if v2 != nil
            v1.val += v2.val
        end
        v1.val += carry
        carry = v1.val / 10
        v1.val = v1.val % 10
        v1.next = cur
        cur = v1
    end
    if carry != 0
        tmp = ListNode.new
        tmp.next = cur
        tmp.val = carry
        cur = tmp
    end
    return cur
end
# @lc code=end

