#
# @lc app=leetcode.cn id=430 lang=ruby
#
# [430] 扁平化多级双向链表
#

# @lc code=start
# Definition for a Node.
# class Node
#     attr_accessor :val, :prev, :next, :child
#     def initialize(val=nil, prev=nil, next_=nil, child=nil)
#         @val = val
#         @prev = prev
#         @next = next_
#         @child = child
#     end
# end

# @param {Node} root
# @return {Node}
def flatten(root)
    stack = Array.new
    cur = root
    while cur != nil
        if cur.child != nil
            stack.push cur.next
            cur.next = cur.child
            cur.child.prev = cur
            cur.child, cur = nil, cur.child
        elsif cur.next != nil
            cur = cur.next
        elsif cur.next == nil
            while !stack.empty?
                _next = stack.pop
                if _next == nil
                    next
                end
                cur.next = _next
                _next.prev = cur
                break
            end
            cur = cur.next
        end
    end

    return root
end
# @lc code=end

