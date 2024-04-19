#
# @lc app=leetcode.cn id=518 lang=ruby
#
# [518] 零钱兑换 II
#

# @lc code=start
# @param {Integer} amount
# @param {Integer[]} coins
# @return {Integer}
def change(amount, coins)
    if amount == 0
        return 1
    end
    n = coins.length
    dp = Array.new(n){Array.new(amount + 1){0}}

    for i in 0...n
        coin = coins[i]
        for c in 1..amount
            if c % coin == 0
                dp[i][c] += 1
            end
            if i > 0
                k = 0
                while k * coin < c
                    dp[i][c] += dp[i - 1][c - k * coin]
                    k += 1
                end
            end
        end
    end

    return dp[n - 1][amount]
end
# @lc code=end

if __FILE__ == $0
    puts "#{change 5, [1,2,5]}"
    puts "#{change 3, [2]}"
    puts "#{change 10, [10]}"
    puts "#{change 0, [7]}"
end
