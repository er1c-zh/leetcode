#
# @lc app=leetcode.cn id=449 lang=ruby
#
# [449] 序列化和反序列化二叉搜索树
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

# Encodes a tree to a single string.
#
# @param {TreeNode} root
# @return {string}
def serialize(root)
    if root == nil
        return ""
    end
    return root.val.to_s + " " + serialize(root.left) + serialize(root.right)
end

# Decodes your encoded data to tree.
#
# @param {string} data
# @return {TreeNode}
def deserialize(data)
    strs = data.split(" ")
    strs.each_index{
        |i|
        strs[i] = strs[i].to_i
    }
    return helper(strs)
end

def helper(data)
    if data.empty?
        return nil
    end
    node = TreeNode.new(data[0])
    i = 1
    while i < data.length
        if data[i] > data[0]
            break
        end
        i += 1
    end
    node.left = helper(data[1, i - 1])
    node.right = helper(data[i..-1])
    return node
end


# Your functions will be called as such:
# deserialize(serialize(data))
# @lc code=end

