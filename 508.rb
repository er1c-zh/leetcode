#
# @lc app=leetcode.cn id=508 lang=ruby
#
# [508] 出现次数最多的子树元素和
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
# @return {Integer[]}
def find_frequent_tree_sum(root)
    r = helper(root)
    puts "#{r}"
    result = []
    resultCnt = 0
    for sum, cnt in r[1]
        if cnt > resultCnt
            result = [sum]
            resultCnt = cnt
        elsif cnt == resultCnt
            result.append sum
        end
    end
    return result
end

def helper(root)
    if root == nil
        return [0, {}]
    end
    if root.left == nil && root.right == nil
        return [root.val, {root.val => 1}]
    end
    l = helper(root.left)
    r = helper(root.right)
    # merge l to right
    for k, v in l[1]
        if r[1][k] == nil
            r[1][k] = 0
        end
        r[1][k] = r[1][k] + l[1][k]
    end

    sum = l[0] + r[0] + root.val
    if r[1][sum] == nil
        r[1][sum] = 0
    end
    
    r[1][sum] += 1
    return [sum, r[1]]
end
# @lc code=end

