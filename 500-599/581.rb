#
# @lc app=leetcode.cn id=581 lang=ruby
#
# [581] 最短无序连续子数组
#

# @lc code=start
# @param {Integer[]} nums
# @return {Integer}
def find_unsorted_subarray(nums)
    n = nums.size
    dp_min = Array.new(n){0} # dp[i] [i, ]的最小值
    dp_max = Array.new(n){0} # dp[i] [, i]的最大值
    for i in 0...n
        dp_max[i] = nums[i]
        if i > 0 && dp_max[i] < dp_max[i - 1]
            dp_max[i] = dp_max[i - 1]
        end
        j = n - 1 - i
        dp_min[j] = nums[j]
        if j < n - 1 && dp_min[j] > dp_min[j + 1]
            dp_min[j] = dp_min[j + 1]
        end
    end
    i, j = 0, n - 1
    while i < n && (i == 0 || nums[i] >= nums[i - 1]) && (i == n - 1 || nums[i] <= dp_min[i + 1])
        i += 1
    end
    while j >= 0 && (j == n - 1 || nums[j] <= nums[j + 1]) && (j == 0 || nums[j] >= dp_max[j - 1])
        j -= 1
    end
    return [j - i + 1, 0].max
end
# @lc code=end

if __FILE__ == $0
    puts "#{find_unsorted_subarray [2,6,4,8,10,9,15]}"
    puts "#{find_unsorted_subarray [1,2,3,4]}"
    puts "#{find_unsorted_subarray [1]}"
    puts "#{find_unsorted_subarray [2,3,3,2,4]}"
end
