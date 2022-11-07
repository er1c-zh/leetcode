#
# @lc app=leetcode.cn id=539 lang=ruby
#
# [539] 最小时间差
#

# @lc code=start
# @param {String[]} time_points
# @return {Integer}
def find_min_difference(time_points)
    time_points.sort!
    ph, pm = helper time_points[0]
    i = 1
    n = time_points.size
    result = 1e10
    while i < n
        ch, cm = helper time_points[i]
        delta = (ch - ph) * 60 + (cm - pm)
        if delta < result
            result = delta
        end
        ph, pm = ch, cm
        i += 1
    end
    fh, fm = helper time_points[0]
    fh += 24
    delta = (fh - ph) * 60 + (fm - pm)
    if delta < result
        result = delta
    end
    return result
end
def helper(src)
    l = src.split ":"
    return l[0].to_i, l[1].to_i
end
# @lc code=end

