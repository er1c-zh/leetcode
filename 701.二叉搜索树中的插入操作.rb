#
# @lc app=leetcode.cn id=701 lang=ruby
#
# [701] 二叉搜索树中的插入操作
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
# @param {Integer} val
# @return {TreeNode}
def insert_into_bst(root, val)
    return helper(root, val)
end
def helper(cur, val)
    if cur == nil
        n = TreeNode::new()
        n.val = val
        return n
    end
    if cur.val > val
        cur.left = helper(cur.left, val)
    else
        cur.right = helper(cur.right, val)
    end
    return cur
end
# @lc code=end

