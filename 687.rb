#
# @lc app=leetcode.cn id=687 lang=ruby
#
# [687] 最长同值路径
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
# @return {Integer}
def longest_univalue_path(root)
    return h1(root)
end
def h1(root)
    if root == nil
        return 0
    end
    candidate = [h1(root.left), h1(root.right), h2(root.left, root.val) + h2(root.right, root.val)]
    return candidate.max
end
def h2(root, v)
    if root == nil
        return 0
    end
    if root.val != v
        return 0
    end
    l, r = h2(root.left, v), h2(root.right, v)
    return 1 + [l, r].max
end
# @lc code=end

