#
# @lc app=leetcode.cn id=662 lang=ruby
#
# [662] 二叉树最大宽度
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
def width_of_binary_tree(root)
    q = [[root, 0]]
    result = 0
    while q.size > 0
        nq = []
        l, r = -1, -1
        for i in 0...q.size
            n, idx = q[i]
            if l == -1
                l = idx
            end
            if idx > r
                r = idx
            end
            if n.left != nil
                nq = nq.append [n.left, 2 * idx]
            end
            if n.right != nil
                nq = nq.append [n.right, 2 * idx + 1]
            end
        end
        if r - l + 1 > result
            result = r - l + 1
        end
        q = nq
    end
    return result
end
# @lc code=end

