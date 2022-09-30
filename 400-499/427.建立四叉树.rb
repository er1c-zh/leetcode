#
# @lc app=leetcode.cn id=427 lang=ruby
#
# [427] 建立四叉树
#

# @lc code=start
# Definition for a QuadTree node.
# class Node
#     attr_accessor :val, :isLeaf, :topLeft, :topRight, :bottomLeft, :bottomRight
#     def initialize(val=false, isLeaf=false, topLeft=nil, topRight=nil, bottomLeft=nil, bottomRight=nil)
#         @val = val
#         @isLeaf = isLeaf
#         @topLeft = topLeft
#         @topRight = topRight
#         @bottomLeft = bottomLeft
#         @bottomRight = bottomRight
#     end
# end

# @param {Integer[][]} grid
# @return {Node}
def construct(grid)
    n = grid.length
    return helper(grid, 0, 0, n - 1, n - 1)
end
def helper(grid, x1, y1, x2, y2)
    if x1 > x2 || y1 > y2
        p "WA"
        return false
    end
    node = Node.new
    if x1 == x2 && y1 == y2
        node.val = grid[x1][y1] == 0 ? false : true
        node.isLeaf = true
        return node
    end
    node.val = false
    node.isLeaf = false
    mx, my = (x1 + x2) / 2, (y1 + y2) / 2
    node.topLeft = helper(grid, x1, y1, mx, my)
    node.topRight = helper(grid, x1, my + 1, mx, y2)
    node.bottomLeft = helper(grid, mx + 1, y1, x2, my)
    node.bottomRight = helper(grid, mx + 1, my + 1, x2, y2)
    if node.topLeft.isLeaf && node.topRight.isLeaf && node.bottomLeft.isLeaf && node.bottomRight.isLeaf
        if node.topLeft.val == node.topRight.val && node.topLeft.val == node.bottomLeft.val && node.topLeft.val == node.bottomRight.val
            node.isLeaf = true
            node.val = node.topLeft.val
            node.topLeft = nil
            node.topRight = nil
            node.bottomLeft = nil
            node.bottomRight = nil
        end
    end
    return node
end
# @lc code=end

