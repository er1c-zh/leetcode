#
# @lc app=leetcode.cn id=652 lang=ruby
#
# [652] 寻找重复的子树
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
# @return {TreeNode[]}
def find_duplicate_subtrees(root)
    ri = Hash.new{0}
    q = [root]
    i = 0
    result = []
    while i < q.size 
        cur = q[i]
        k = cal_key(cur)

        ri[k] += 1
        if ri[k] == 2
            result = result.append cur
        end
        if cur.left != nil
            q = q.append cur.left
        end
        if cur.right != nil
            q = q.append cur.right
        end
        i += 1
    end
    return result
end

def cal_key(node)
    return cal_pre(node) + "_" + cal_mid(node)
end
def cal_pre(node)
    if node == nil
        return "-"
    end
    return node.val.to_s + cal_pre(node.left) + cal_pre(node.right)
end
def cal_mid(node)
    if node == nil
        return "-"
    end
    return cal_mid(node.left) + node.val.to_s + cal_mid(node.right)
end
# @lc code=end
