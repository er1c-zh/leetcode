#
# @lc app=leetcode.cn id=450 lang=ruby
#
# [450] 删除二叉搜索树中的节点
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
# @param {Integer} key
# @return {TreeNode}
def delete_node(root, key)
    if root == nil
        return root
    end
    if root.val == key
        if root.left == nil && root.right == nil
            return nil
        elsif root.left == nil
            return root.right
        elsif root.right == nil
            return root.left
        else
            to = root.left
            from = root.right
            while to.right != nil
                to = to.right
            end
            to.right = from
            return root.left
        end
    elsif root.val > key
        root.left = delete_node(root.left, key)
    elsif root.val < key
        root.right = delete_node(root.right, key)
    end
    return root
end
# @lc code=end

