#
# @lc app=leetcode.cn id=440 lang=ruby
#
# [440] 字典序的第K小数字
#

# @lc code=start
# @param {Integer} n
# @param {Integer} k
# @return {Integer}
def find_kth_number(n, k)
    nums = []
    _n = n
    while _n > 0
        nums.append _n % 10
        _n = _n / 10
    end
    result = 1
    cnt = 1
    while cnt < k
        batch = helper(n, result)
        if batch + cnt > k
            result *= 10
            cnt += 1
        else
            result += 1
            cnt += batch
        end
    end

    return result
end
def helper(n, prefix)
    cnt = 0
    s, e = prefix, prefix + 1
    while s <= n
        if e < n + 1
            cnt += e - s
        else
            cnt += n + 1 - s
        end
        s *= 10
        e *= 10
    end
    return cnt
end
# @lc code=end

if __FILE__ == $0
    # puts "#{find_kth_number(13, 13)}"
    n = 13
    (1..n).each{
        |i|
        puts "#{find_kth_number(n, i)}"
    }
end
