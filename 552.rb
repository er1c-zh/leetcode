#
# @lc app=leetcode.cn id=552 lang=ruby
#
# [552] 学生出勤记录 II
#

# @lc code=start
# @param {Integer} n
# @return {Integer}
def check_record(n)
    dp = Array.new(2){Array.new(4){0}} # dp[ac][lc]

    dp[0][0] = 1 # P
    dp[0][1] = 1 # L
    dp[0][2] = 0 # 不存在
    dp[1][0] = 1 # A
    dp[1][1] = 0 # nil
    dp[1][2] = 0 # nil

    for i in 2...(n + 1)
        dp0s = dp[0].sum
        dp1s = dp[1].sum
        dp[0][2] = helper(dp[0][1])
        dp[0][1] = helper(dp[0][0])
        dp[0][0] = helper(dp0s)
        dp[1][2] = helper(dp[1][1])
        dp[1][1] = helper(dp[1][0])
        dp[1][0] = helper(dp0s + dp1s)
    end

    return helper(dp[0].sum + dp[1].sum).to_i
end

def helper(v)
    return v % (1e9 + 7)
end
# @lc code=end

if __FILE__ == $0
    puts "#{check_record 100000}"
end
