#
# @lc app=leetcode.cn id=213 lang=ruby
#
# [213] 打家劫舍 II
#

# @lc code=start
# @param {Integer[]} nums
# @return {Integer}
def rob(nums)
  if nums.length == 1
    return nums[0]
  end
  return [helper(nums.slice(0, nums.length - 1)), helper(nums.slice(1, nums.length - 1))].max
end

def helper(nums)
  l = nums.length
  if l == 0
    return 0
  end
  if l == 1
    return nums[0]
  end
  if l == 2
    return nums.max
  end

  # dp[i] ==>
  dp = Array.new(l) { 0 }

  for i in 0...l
    dp[i] = nums[i]
    if i >= 2
      dp[i] = [dp[i], nums[i] + dp[i - 2]].max
    end
    if i >= 3
      dp[i] = [dp[i], nums[i] + dp[i - 3]].max
    end
  end

  return dp.slice(l - 2, 2).max
end

# @lc code=end

if __FILE__ == $0
  p "#{rob [1, 2, 3, 1]}"
end
