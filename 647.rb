#
# @lc app=leetcode.cn id=647 lang=ruby
#
# [647] 回文子串
#

# @lc code=start
# @param {String} s
# @return {Integer}
def count_substrings(s)
    n = s.size
    dp = Array.new(n){Array.new(n){0}} # dp[i][j] [i,j]为首尾的数量

    result = 0
    for d in 0...n
        for i in 0...n
            j = i + d
            if j >= n
                break
            end
            if s[i] != s[j]
                next
            end
            if i + 1 <= j - 1
                dp[i][j] = dp[i+1][j-1]
            else
                dp[i][j] = 1
            end

            result += dp[i][j]
        end
    end

    return result
end
# @lc code=end

if __FILE__ == $0
    puts "#{count_substrings "abc"}"
    puts "#{count_substrings "aaa"}"
end
