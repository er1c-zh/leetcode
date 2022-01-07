#
# @lc app=leetcode.cn id=437 lang=ruby
#
# [437] 路径总和 III
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
# @param {Integer} target_sum
# @return {Integer}
def path_sum(root, target_sum)
    target = Hash.new{0}
    target[target_sum] += 1
    return helper(root, target, target_sum)
end
def helper(root, target_sum, origin)
    if root == nil
        return 0
    end
    result = 0
    result += target_sum[root.val]
    next_tag = Hash.new{0}
    target_sum.keys.each{
        |k|
        if target_sum[k] > 0
            next_tag[k - root.val] += target_sum[k]
        end
    }
    next_tag[origin] += 1
    result += helper(root.left, next_tag, origin)
    result += helper(root.right, next_tag, origin)
    return result
end
# @lc code=end

# [1,null,2,null,3,null,4,null,5]
# 3
