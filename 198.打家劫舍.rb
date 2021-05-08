#
# @lc app=leetcode.cn id=198 lang=ruby
#
# [198] 打家劫舍
#

# @lc code=start
# @param {Integer[]} nums
# @return {Integer}
def rob(nums)
  dp = Array.new(nums.length) { 0 }
  i = 0
  while i < nums.length
    if i < 2
      dp[i] = nums[i]
    elsif i == 2
      dp[i] = nums[i] + dp[i - 2]
    else
      dp[i] = [nums[i] + dp[i - 2], nums[i] + dp[i - 3]].max
    end
    i += 1
  end
  return dp.slice(dp.length - 2, 2).max
end

# @lc code=end
