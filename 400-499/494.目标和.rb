#
# @lc app=leetcode.cn id=494 lang=ruby
#
# [494] 目标和
#

# @lc code=start
# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer}
def find_target_sum_ways(nums, target)
    n = nums.length
    # dp[i][j][v] = [i,j]能拼接出v的个数
    dp = Array.new(n){Array.new(n){Hash.new{0}}}
    nums.each_index{
        |i|
        dp[i][i][nums[i]] += 1
        dp[i][i][-nums[i]] += 1
    }
    (1..n - 1).each{
        |l|
        (0..n-1).each{
            |i|
            j = i + l
            if j > n - 1
                break
            end
            delta = nums[j]
            dp[i][j - 1].keys().each{
                |before|
                dp[i][j][before + delta] += dp[i][j-1][before]
                dp[i][j][before - delta] += dp[i][j-1][before]
                # puts "#{i}, #{j}, #{dp[i][j]}"
            }
        }
    }
    return dp[0][n - 1][target]
end
# @lc code=end

if __FILE__ == $0
    puts "#{find_target_sum_ways([1,1,1,1,1], 3)}"
    puts "#{find_target_sum_ways([0,0,0,0,0,0,0,0,1], 1)}"
end
