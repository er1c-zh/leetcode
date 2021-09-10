#
# @lc app=leetcode.cn id=223 lang=ruby
#
# [223] 矩形面积
#

# @lc code=start
# @param {Integer} ax1
# @param {Integer} ay1
# @param {Integer} ax2
# @param {Integer} ay2
# @param {Integer} bx1
# @param {Integer} by1
# @param {Integer} bx2
# @param {Integer} by2
# @return {Integer}
def compute_area(ax1, ay1, ax2, ay2, bx1, by1, bx2, by2)
    lx = ([ax2, bx2].min() - [ax1, bx1].max())
    ly = ([ay2, by2].min() - [ay1, by1].max())
    overlap = 0
    if lx < 0 && ly < 0
        overlap = 0
    else
        overlap = [lx * ly, 0].max
    end

    return (ax2 - ax1) * (ay2 - ay1) + (bx2 - bx1) * (by2 - by1) - overlap
end

# @lc code=end
