#
# @lc app=leetcode.cn id=226 lang=ruby
#
# [226] 翻转二叉树
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
# @return {TreeNode}
def invert_tree(root)
  if root == nil
    return nil
  end
  invert_tree(root.left)
  invert_tree(root.right)
  tmp = root.left
  root.left = root.right
  root.right = tmp
  return root
end

# @lc code=end
