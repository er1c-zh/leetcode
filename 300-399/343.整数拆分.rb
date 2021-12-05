#
# @lc app=leetcode.cn id=343 lang=ruby
#
# [343] 整数拆分
#

# @lc code=start
# @param {Integer} n
# @return {Integer}
def integer_break(n)
    dp = Array.new
    dp[0], dp[1] = 0, 1
    (2..n).each{
        |v|
        dp[v] = dp[v - 1]
        (1..v - 1).each{
            |cv|
            if dp[v] < dp[v - cv] * cv
                dp[v] = dp[v - cv] * cv
            end
            if dp[v] < cv * (v - cv)
                dp[v] = cv * (v - cv)
            end
        }
    }
    return dp[n]
end
# @lc code=end

