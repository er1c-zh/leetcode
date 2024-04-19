#
# @lc app=leetcode.cn id=654 lang=ruby
#
# [654] 最大二叉树
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
# @param {Integer[]} nums
# @return {TreeNode}
def construct_maximum_binary_tree(nums)
    if nums.size == 0
        return nil
    end

    n = TreeNode.new

    mi, mv = -1, -1
    i = 0
    while i < nums.size
        if nums[i] > mv
            mv = nums[i]
            mi = i
        end
        i += 1
    end

    n.val = mv
    n.left = construct_maximum_binary_tree(nums[0...mi])
    n.right = construct_maximum_binary_tree(nums[mi+1..-1])
    return n
end
# @lc code=end

class TreeNode
    attr_accessor :val, :left, :right
    def initialize(val = 0, left = nil, right = nil)
        @val = val
        @left = left
        @right = right
    end
end

if __FILE__ == $0
    construct_maximum_binary_tree([3,2,1,6,0,5])
end
