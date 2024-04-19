#
# @lc app=leetcode.cn id=712 lang=ruby
#
# [712] 两个字符串的最小ASCII删除和
#

# @lc code=start
# @param {String} s1
# @param {String} s2
# @return {Integer}
def minimum_delete_sum(s1, s2)
    m, n = s1.length, s2.length
    s1, s2 = s1.codepoints, s2.codepoints
    dp = Array.new(m + 1){Array.new(n + 1){0}}
    for i in 1..m
        dp[i][0] = dp[i - 1][0] + s1[i - 1]
    end
    for i in 1..n
        dp[0][i] = dp[0][i - 1] + s2[i - 1]
    end
    for i in 1..m
        vi = s1[i - 1]
        for j in 1..n
            vj = s2[j - 1]
            candidate = [dp[i - 1][j] + vi, dp[i][j - 1] + vj]
            if vi == vj
                candidate = candidate.append dp[i - 1][j - 1]
            end
            dp[i][j] = candidate.min
        end
    end
    dp[m][n]
end
# @lc code=end

if __FILE__ == $0
    puts "#{minimum_delete_sum "sea", "eat"}"
    puts "#{minimum_delete_sum "delete", "leet"}"
end
