#
# @lc app=leetcode.cn id=486 lang=ruby
#
# [486] 预测赢家
#

# @lc code=start
# @param {Integer[]} nums
# @return {Boolean}
def predict_the_winner(nums)
    n = nums.length
    dp = Array.new(n){Array.new(n){}}
    # dp[i][j] = [先手最多，后手最多]
    (0..n-1).each{
        |l|
        (0..n-1).each{
            |i|
            j = i + l
            if j >= n
                break
            end
            if i == j
                dp[i][j] = [nums[i], 0]
                next
            end
            v1 = dp[i + 1][j].reverse
            v1[0] += nums[i]
            v2 = dp[i][j - 1].reverse
            v2[0] += nums[j]
            dp[i][j] = v1
            if v2[0] > v1[0]
                dp[i][j] = v2
            end
        }
    }
    return dp[0][n - 1][0] >= dp[0][n - 1][1]
end

# @lc code=end

if __FILE__ == $0
    puts "#{predict_the_winner [1,5,2]}"
    puts "#{predict_the_winner [1,5,233,7]}"
end
