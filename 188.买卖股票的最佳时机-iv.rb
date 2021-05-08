#
# @lc app=leetcode.cn id=188 lang=ruby
#
# [188] 买卖股票的最佳时机 IV
#

# @lc code=start
# @param {Integer} k
# @param {Integer[]} prices
# @return {Integer}
def max_profit(k, prices)
  days = prices.length
  dp = Array.new(k + 1) { Array.new(days + 1) { 0 } }

  peekIdx = []
  valleyHash = Hash.new

  i = 0
  while i < days
    if i > 0 && prices[i] > prices[i - 1]
      if i + 1 == days or prices[i] >= prices[i + 1]
        peekIdx = peekIdx.append i
      end
    end
    if i == 0 && i + 1 < days && prices[i] < prices[i + 1]
      valleyHash[i] = true
    end
    if i > 0 && i + 1 < days && prices[i] <= prices[i - 1] && prices[i] < prices[i + 1]
      valleyHash[i] = true
    end
    i += 1
  end

  i, j = 1, days - 1

  while i <= k
    while j >= 0
      dp[i][j] = [dp[i][j + 1], dp[i - 1][j]].max
      if valleyHash[j]
        # cal [j, end] trade once max
        cur = prices[j]

        for nextPeek in peekIdx
          if nextPeek < j
            next
          end
          dp[i][j] = [dp[i][j], prices[nextPeek] - cur + dp[i - 1][nextPeek + 1]].max
        end
      end

      j -= 1
    end
    i += 1
    j = days - 1
  end

  return dp[k][0]
end

# @lc code=end
