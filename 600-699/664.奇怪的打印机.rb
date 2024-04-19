#
# @lc app=leetcode.cn id=664 lang=ruby
#
# [664] 奇怪的打印机
#

# @lc code=start
# @param {String} s
# @return {Integer}
def strange_printer(s)
    n = s.length
    dp = Array.new(n){Array.new(n){n + 1}}
    for dl in 0...n
        for i in 0...n
            if dl == 0
                dp[i][i] = 1
                next
            end
            j = i + dl
            if j >= n
                break
            end
            if s[i] == s[j]
                dp[i][j] = dp[i][j - 1]
            else
                dp[i][j] = []
                for k in i...j
                    dp[i][j].append dp[i][k] + dp[k + 1][j]
                end
                dp[i][j] = dp[i][j].min
            end
        end
    end

    return dp[0][n - 1]
end
# @lc code=end

if __FILE__ == $0
    puts "#{strange_printer "tbgtgb"}"
    puts "#{strange_printer "abcabc"}"
    puts "#{strange_printer "aaabbb"}"
    puts "#{strange_printer "aba"}"
    puts "#{strange_printer "abbcbba"}"
    puts "#{strange_printer "abc"}"
end
