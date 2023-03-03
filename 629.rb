#
# @lc app=leetcode.cn id=629 lang=ruby
#
# [629] K个逆序对数组
#

# @lc code=start
# @param {Integer} n
# @param {Integer} k
# @return {Integer}
def k_inverse_pairs(n, k)
    dp = Array.new(n + 1){Array.new(k + 1){0}} # dp[i][j] 对于i个数字，有j个逆序对的数量
    dps = Array.new(n + 1){Array.new(k + 1){0}} # dp[i][j] 对于i个数字，有j个逆序对的数量

    dp[0][0] = 1
    for i in 0...k + 1
        dps[0][i] = 1
    end

    for i in 1...n + 1
        for j in 0...k + 1
            dp[i][j] = 0
            m = j
            dp[i][j] = dps[i - 1][j]
            if (j - (i - 1) - 1) >= 0
                dp[i][j] -= dps[i - 1][j - (i - 1) - 1]
            end
            dp[i][j] = (dp[i][j] % (1e9 + 7)).to_i

            dps[i][j] = dp[i][j]
            if j - 1 >= 0
                dps[i][j] += dps[i][j - 1]
            end
            dps[i][j] = (dps[i][j] % (1e9 + 7)).to_i
        end
    end

    # puts "#{dp}"

    return dp[n][k]
end
# @lc code=end

if __FILE__ == $0
    puts "#{k_inverse_pairs 3, 0}"
    puts "#{k_inverse_pairs 3, 1}"
    puts "#{k_inverse_pairs 1000, 1000}"
end
