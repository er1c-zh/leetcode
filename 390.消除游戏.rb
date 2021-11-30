#
# @lc app=leetcode.cn id=390 lang=ruby
#
# [390] 消除游戏
#

# @lc code=start
# @param {Integer} n
# @return {Integer}
def last_remaining(n)
    return helper(n, 0) + 1
    # dp = Array.new(n + 1){Array.new(2){-1}}
    # # dp[i][0] i个 从左开始
    # # dp[i][1] i个 从右开始
    # dp[1][0], dp[1][1] = 0, 0
    # i = 2
    # while i <= n
    #     dp[i][0] = dp[i / 2][1] * 2 + 1
    #     if i % 2 == 0
    #         dp[i][1] = dp[i / 2][0] * 2
    #     else
    #         dp[i][1] = dp[i / 2][0] * 2 + 1
    #     end
    #     i += 1
    # end
    # return dp[n][0] + 1
end
def helper(i, lr)
    if i == 1
        return 0
    end
    if lr == 0
        return helper(i / 2, 1) * 2 + 1
    else
        return helper(i / 2, 0) * 2 + (i % 2 == 0 ? 0 : 1)
    end
end
# @lc code=end

if __FILE__ == $0
    # puts "#{last_remaining 7057}"
    (1...50).each{
        |v|
        puts "#{v} - #{last_remaining v}"
    }
end
