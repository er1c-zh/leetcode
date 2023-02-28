#
# @lc app=leetcode.cn id=513 lang=ruby
#
# [513] 找树左下角的值
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
def find_bottom_left_value(root)
    _, v = helper(0, root)
    return v
end

def helper(layer, root)
    if root == nil
        return nil, nil
    end
    ll, lv = helper(layer + 1, root.left)
    rl, rv = helper(layer + 1, root.right)
    if ll == nil && rl == nil
        return layer, root.val
    end
    if ll != nil && rl != nil
        if ll >= rl
            return ll, lv
        else
            return rl, rv
        end
    end
    if ll == nil
        return rl, rv
    end
    if rl == nil
        return ll, lv
    end
end
# @lc code=end

