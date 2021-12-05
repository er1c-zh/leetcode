#
# @lc app=leetcode.cn id=337 lang=ruby
#
# [337] 打家劫舍 III
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
def rob(root)
    return helper(root).max
end

def helper(root)
    # result[0] not include root
    # result[1] include root
    if root == nil
        return [0, 0]
    end
    l, r = helper(root.left), helper(root.right)
    return [l.max + r.max, root.val + l[0] + r[0]]
end

# @lc code=end

