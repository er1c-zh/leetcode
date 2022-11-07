#
# @lc app=leetcode.cn id=538 lang=ruby
#
# [538] 把二叉搜索树转换为累加树
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
def convert_bst(root)
    helper(root, 0)
    return root
end

def helper(node, pre)
    if node == nil
        return pre
    end
    pre = helper(node.right, pre)
    pre = pre + node.val
    node.val = pre
    pre = helper(node.left, pre)
    return pre
end
# @lc code=end

