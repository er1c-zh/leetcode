#
# @lc app=leetcode.cn id=558 lang=ruby
#
# [558] 四叉树交集
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

# @param {Node} quadTree1
# @param {Node} quadTree2
# @return {Node}
def intersect(quadTree1, quadTree2)
    return helper(quadTree1, false, quadTree2, false)
end

def helper(t1, v1, t2, v2)
    if t1 == nil && t2 == nil
        t = Node.new
        t.val = v1 || v2
        t.isLeaf = true
        return t
    end
    tl1, tr1, bl1, br1 = nil, nil, nil, nil
    nv1 = v1
    if t1 != nil
        tl1, tr1, bl1, br1 = t1.topLeft, t1.topRight, t1.bottomLeft, t1.bottomRight
        nv1 = t1.val
    end
    tl2, tr2, bl2, br2 = nil, nil, nil, nil
    nv2 = v2
    if t2 != nil
        tl2, tr2, bl2, br2 = t2.topLeft, t2.topRight, t2.bottomLeft, t2.bottomRight
        nv2 = t2.val
    end
    tl = helper(tl1, nv1, tl2, nv2)
    tr = helper(tr1, nv1, tr2, nv2)
    bl = helper(bl1, nv1, bl2, nv2)
    br = helper(br1, nv1, br2, nv2)
    if tl.isLeaf && tr.isLeaf && bl.isLeaf && br.isLeaf && tl.val == tr.val && tl.val == bl.val && tl.val == br.val
        return tl
    end
    t = Node.new
    t.isLeaf = false
    t.topLeft = tl
    t.topRight = tr
    t.bottomLeft = bl
    t.bottomRight = br
    return t
end
# @lc code=end

