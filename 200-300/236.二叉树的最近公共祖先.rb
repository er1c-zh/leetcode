#
# @lc app=leetcode.cn id=236 lang=ruby
#
# [236] 二叉树的最近公共祖先
#

# @lc code=start
# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end

# @param {TreeNode} root
# @param {TreeNode} p
# @param {TreeNode} q
# @return {TreeNode}
def lowest_common_ancestor(root, p, q)
    _val, ans = helper root, p, q
    return ans
end

def helper(root, p, q)
    if root == nil 
        return 0, nil
    end
    l, lans = helper(root.left, p, q)
    if lans != nil
        return 2, lans
    end
    r, rans = helper(root.right, p, q)
    if rans != nil
        return 2, rans
    end
    _val = (root == p || root == q ? 1 : 0) + l + r
    if _val == 2
        return 2, root
    else
        return _val, nil
    end
end
# @lc code=end

