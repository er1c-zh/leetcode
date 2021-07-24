#
# @lc app=leetcode.cn id=300 lang=ruby
#
# [300] 最长递增子序列
#

# @lc code=start
# @param {Integer[]} nums
# @return {Integer}
def length_of_lis(nums)
    len = nums.length
    dp = Array.new{
        0
    }
    max = 0
    (0..len-1).each{
        |delta|
        i = len - 1 - delta
        dp[i] = 1
        (i+1..len-1).each{
            |idx|
            if idx >= len
                break
            end
            if nums[idx] > nums[i]
                dp[i] = [dp[i], 1 + dp[idx]].max
            end
        }
        max = [max, dp[i]].max
    }
    return max
end
# @lc code=end

