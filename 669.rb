#
# @lc app=leetcode.cn id=669 lang=ruby
#
# [669] 修剪二叉搜索树
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
# @param {Integer} low
# @param {Integer} high
# @return {TreeNode}
def trim_bst(root, low, high)
    if root == nil
        return nil
    end
    if root.val < low
        return trim_bst(root.right, low, high)
    elsif root.val > high
        return trim_bst(root.left, low, high)
    else
        root.left = trim_bst(root.left, low, high)
        root.right = trim_bst(root.right, low, high)
        return root
    end
end
# @lc code=end

