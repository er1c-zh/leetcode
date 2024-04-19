#
# @lc app=leetcode.cn id=689 lang=ruby
#
# [689] 三个无重叠子数组的最大和
#

# @lc code=start
# @param {Integer[]} nums
# @param {Integer} k
# @return {Integer[]}
def max_sum_of_three_subarrays(nums, k)
    n = nums.length
    sum = Array.new(n){0}
    sum[k - 1] = nums[0...k].sum
    for i in k...n
        sum[i] = sum[i - 1] - nums[i - k] + nums[i]
    end

    dp = Array.new(4){Array.new(n){0}}
    for i in 0...n
        dp[0][i] = [[], 0]
    end

    for a in 1..3
        dp[a][a * k - 1] = [dp[a - 1][(a - 1) * k - 1][0].clone.append((a - 1) * k), dp[a - 1][(a - 1) * k - 1][1] + sum[a * k - 1]]
        for i in a*k...n
            cur = [dp[a - 1][i - k][0].clone.append(i + 1 - k), dp[a - 1][i - k][1] + sum[i]]
            dp[a][i] = (dp[a][i - 1][1] < cur[1]) ? cur : dp[a][i - 1]
        end
    end
    
    return dp[3][n - 1][0]
end
# @lc code=end

if __FILE__ == $0
    puts "#{max_sum_of_three_subarrays [1,2,1,2,6,7,5,1], 2}"
    puts "#{max_sum_of_three_subarrays [1,2,1,2,1,2,1,2,1], 2}"
    puts "#{max_sum_of_three_subarrays [20,18,9,2,14,1,10,3,11,18], 3}"
end
