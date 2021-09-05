#
# @lc app=leetcode.cn id=230 lang=ruby
#
# [230] 二叉搜索树中第K小的元素
#

# @lc code=start
# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val = 0, left = nil, right = nil)
#         @val = val
#         @left = left
#         @right = right
#     end
# end
# @param {TreeNode} root
# @param {Integer} k
# @return {Integer}
def kth_smallest(root, k)
    cur = root
    stack = Array.new
    cnt = k
    while cur != nil && cur.left != nil
        stack = stack.append cur
        cur = cur.left
    end
    while cur != nil
        if k == 1
            return cur.val
        end
        k -= 1
        if cur.right != nil
            cur = cur.right
            while cur != nil && cur.left != nil
                stack = stack.append cur
                cur = cur.left
            end
        else
            cur = stack.pop
        end
        next
    end
    p "unreachable"
end
# @lc code=end

