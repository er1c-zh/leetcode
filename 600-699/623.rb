#
# @lc app=leetcode.cn id=623 lang=ruby
#
# [623] 在二叉树中增加一行
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
# @param {Integer} depth
# @return {TreeNode}
def add_one_row(root, val, depth)
    if depth == 1
        r = helper(val)
        r.left = root
        return r
    end
    if depth == 2
        l = helper(val)
        l.left = root.left
        root.left = l
        r = helper(val)
        r.right = root.right
        root.right = r
    else
        if root.left != nil
            add_one_row(root.left, val, depth - 1)
        end
        if root.right != nil
            add_one_row(root.right, val, depth - 1)
        end
    end
    
    return root
end

def helper(val)
    r = TreeNode.new
    r.val = val
    return r
end

# @lc code=end

