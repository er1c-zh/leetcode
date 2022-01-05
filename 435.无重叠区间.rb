#
# @lc app=leetcode.cn id=435 lang=ruby
#
# [435] 无重叠区间
#

# @lc code=start
# @param {Integer[][]} intervals
# @return {Integer}
def erase_overlap_intervals(intervals)
    intervals.each_index{
        |i|
        intervals[i].append i
    }
    left = intervals.sort{
        |x, y|
        if x[0] == y[0]
            x[1] <=> y[1]
        else
            x[0] <=> y[0]
        end
    }
    right = intervals.sort!{
        |x, y|
        if x[1] == y[1]
            x[0] <=> y[0]
        else
            x[1] <=> y[1]
        end
    }
    n = intervals.length
    dp = Array.new(n){0}
    result = 0

    slow, latest_start, latest_i = 0, nil, nil
    left.each_index{
        |i|
        cur = left[i]
        _s, _e, _i = cur[0], cur[1], cur[2]
        dp[_i] = 1
        while right[slow][1] <= _s
            if latest_start == nil || right[slow][0] > latest_start
                latest_start = right[slow][0]
                latest_i = right[slow][2]
            end
            slow += 1
        end
        if latest_i != nil
            dp[_i] += dp[latest_i]
        end
        if dp[_i] > result
            result = dp[_i]
        end
    }
    return intervals.length - result
end
# @lc code=end

if __FILE__ == $0
    puts "#{erase_overlap_intervals [ [1,2], [2,3], [3,4], [1,3] ]}"
    puts "#{erase_overlap_intervals [ [1,2], [1,2], [1,2] ]}"
    puts "#{erase_overlap_intervals [[-52,31],[-73,-26],[82,97],[-65,-11],[-62,-49],[95,99],[58,95],[-31,49],[66,98],[-63,2],[30,47],[-40,-26]]}"
end
