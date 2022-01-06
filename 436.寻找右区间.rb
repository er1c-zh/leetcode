#
# @lc app=leetcode.cn id=436 lang=ruby
#
# [436] 寻找右区间
#

# @lc code=start
# @param {Integer[][]} intervals
# @return {Integer[]}
def find_right_interval(intervals)
    data = intervals
    data.each_index{
        |i|
        data[i].append i
    }
    # data[2] 原始下标
    n = intervals.length
    result = Array.new(n){-1}
    cache = data.sort{
        |x, y|
        x[0] <=> y[0]
    }
    i = 0
    data.sort{
        |x, y|
        if x[1] == y[1]
            x[2] <=> y[2]
        else
            x[1] <=> y[1]
        end
    }.each{
        |v|
        while i < n && cache[i][0] < v[1]
            i += 1
        end
        if i < n
            result[v[2]] = cache[i][2]
        end
    }

    return result
end

# @lc code=end

