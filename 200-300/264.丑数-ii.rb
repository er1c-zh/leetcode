#
# @lc app=leetcode.cn id=264 lang=ruby
#
# [264] 丑数 II
#

# @lc code=start
# @param {Integer} n
# @return {Integer}
def nth_ugly_number(n)
    dp = Array.new

    set = Hash.new

    dp[0] = 1
    p2, p3, p5 = 0, 0, 0
    while n > 1
        v2, v3, v5 = 2 * dp[p2], 3 * dp[p3], 5 * dp[p5]
        v = [v2, v3, v5].min
        case v
        when v2
            p2 += 1
        when v3
            p3 += 1
        else
            p5 += 1
        end
        if set[v] == nil
            set[v] = true
            dp = dp.append v
            n -= 1
        end
    end

    return dp[dp.length - 1]
end

def nth_ugly_number_slow(n)
    heap = MinHeap.new
    set = Hash.new

    cur = 1
    [2, 3, 5].each{
        |v|
        set[v] = true
        heap.push v
    }
    while n > 1
        cur = heap.pop
        [2, 3, 5].each{
            |v|
            if set[v * cur] == nil
                set[v * cur] = true
                heap.push v * cur
            end
        }
        n -= 1
    end
    return cur
end
# @lc code=end

