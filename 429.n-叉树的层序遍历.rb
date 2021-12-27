#
# @lc app=leetcode.cn id=429 lang=ruby
#
# [429] N 叉树的层序遍历
#

# @lc code=start
# Definition for a Node.
# class Node
#     attr_accessor :val, :children
#     def initialize(val)
#         @val = val
#         @children = []
#     end
# end

# @param {Node} root
# @return {List[List[int]]}
def level_order(root)
    if root == nil
        return []
    end
    queue = [root]
    result = []
    while !queue.empty?
        cur = []
        nq = []
        queue.each{
            |n|
            cur.append n.val
            n.children.each{
                |nn|
                nq.append nn
            }
        }
        queue = nq
        result.append cur
    end
    return result
end
# @lc code=end

