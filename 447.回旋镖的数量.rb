#
# @lc app=leetcode.cn id=447 lang=ruby
#
# [447] 回旋镖的数量
#

# @lc code=start
# @param {Integer[][]} points
# @return {Integer}
def number_of_boomerangs(points)
    n = points.length
    dp = Array.new(n){Hash.new{0}}
    i = 0
    while i < n
        x1, y1 = points[i][0], points[i][1]
        j = i + 1
        while j < n
            x2, y2 = points[j][0], points[j][1]
            l = (x2 - x1) ** 2 + (y2 - y1) ** 2
            dp[i][l] += 1
            dp[j][l] += 1
            j += 1
        end
        i += 1
    end
    result = 0
    dp.each_index{
        |i|
        dp[i].values.each{
            |c|
            result += c * (c - 1)
        }
    }

    return result
end
# @lc code=end

