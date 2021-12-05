#
# @lc app=leetcode.cn id=309 lang=ruby
#
# [309] 最佳买卖股票时机含冷冻期
#

# @lc code=start
# @param {Integer[]} prices
# @return {Integer}
def max_profit(prices)
    dp, dpMax = Array.new(prices.length){0}, Array.new(prices.length){0}

    max = 0
    prices.each_index{
        |idx|
        cur = 0
        prices.each_index{
            |from|
            if idx <= from
                break
            end
            income = prices[idx] - prices[from]
            maxPre = 0
            if from - 2 > 0
                maxPre = dpMax[from - 2]
            end
            income += maxPre
            if income > cur
                cur = income
            end
        }
        dp[idx] = cur
        if cur > max
            max = cur
        end
        dpMax[idx] = max
    }

    return max
end
# @lc code=end

