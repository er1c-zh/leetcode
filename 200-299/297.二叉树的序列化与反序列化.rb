#
# @lc app=leetcode.cn id=297 lang=ruby
#
# [297] 二叉树的序列化与反序列化
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
    # bfs
    queue = [root]
    result = []

    while !queue.empty?
        nq = []
        queue.each{
            |n|
            if n == nil
                result.append 'nil'
            else
                result.append n.val.to_s
                nq.append n.left, n.right
            end
        }
        queue = nq
    end

    return result.join ','
end

# Decodes your encoded data to tree.
#
# @param {string} data
# @return {TreeNode}
def deserialize(data)
    # p data
    vals = data.split ','
    root = nil
    queue = []
    vals.each_index{
        |idx|
        cur = helper vals[idx]
        if cur != nil
            queue.append cur
        end
        if root == nil
            root = queue[0]
        end
        if idx > 0
            p = queue[0]
            # p "parent #{p} #{idx - 1} val #{vals[idx]}"
            if p != nil
                if (idx - 1) % 2 == 0
                    p.left = cur
                else
                    p.right = cur
                    queue = queue[1..-1]
                end
            end
        end
    }
    return root
end

def helper(str)
    if str == 'nil'
        return nil
    else
        return TreeNode.new(str.to_i)
    end
end

# Your functions will be called as such:
# deserialize(serialize(data))
# @lc code=end

class TreeNode
    attr_accessor :val, :left, :right
    def initialize(val)
        @val = val
        @left, @right = nil, nil
    end
end

if __FILE__ == $0
    p deserialize(serialize(TreeNode.new 100))
end
