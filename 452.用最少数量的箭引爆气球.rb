#
# @lc app=leetcode.cn id=452 lang=ruby
#
# [452] 用最少数量的箭引爆气球
#

# @lc code=start
# @param {Integer[][]} points
# @return {Integer}
def find_min_arrow_shots(points)
    result = 0
    pre = nil
    points.sort{
        |x, y|
        x[1] <=> y[1]
    }.each{
        |b|
        if pre == nil || b[0] > pre
            result += 1
            pre = b[1]
        end
    }
    return result
end
# @lc code=end

