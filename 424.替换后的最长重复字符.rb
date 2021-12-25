#
# @lc app=leetcode.cn id=424 lang=ruby
#
# [424] 替换后的最长重复字符
#

# @lc code=start
# @param {String} s
# @param {Integer} k
# @return {Integer}
def character_replacement(s, k)
    m = s.length
    # dp['A'][8] 从0到8A的数量
    dp = Hash.new
    (0..25).each{
        |d|
        dp["ABCDEFGHIJKLMNOPQRSTUVWXYZ"[d]] = Array.new(m){0}
    }
    (0..s.length - 1).each{
        |i|
        c = s[i]
        dp.keys.each{
            |kc|
            if i != 0
                dp[kc][i] = dp[kc][i - 1]
            end
            dp[kc][i] += c == kc ? 1 : 0
        }
    }
    result = k
    dp.keys.each{
        |kc|
        i, j = 0, 0
        while j < m
            pre = 0
            if i > 0
                pre = dp[kc][i - 1]
            end
            if (j - i + 1) - (dp[kc][j] - pre) <= k
                if j - i + 1 > result
                    result = j - i + 1
                end
                j += 1
            else
                i += 1
            end
        end
    }
    return result
end
# @lc code=end

if __FILE__ == $0
    puts "#{character_replacement "ABAB", 2}"
    puts "#{character_replacement "AABABBA", 1}"
end
