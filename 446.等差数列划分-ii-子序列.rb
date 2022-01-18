#
# @lc app=leetcode.cn id=446 lang=ruby
#
# [446] 等差数列划分 II - 子序列
#

# @lc code=start
# @param {Integer[]} nums
# @return {Integer}
def number_of_arithmetic_slices(nums)
    n = nums.length
    dp = Array.new(n){Hash.new{0}}
    result = 0
    nums.each_index{
        |i|
        v1 = nums[i]
        j = i - 1
        while j >= 0
            v2 = nums[j]
            delta = v1 - v2
            result += dp[j][delta]
            dp[i][delta] += dp[j][delta] + 1
            j -= 1
        end
    }
    return result
end
# @lc code=end

if __FILE__ == $0
    puts "#{number_of_arithmetic_slices [2,4,6,8,10]}"
    puts "#{number_of_arithmetic_slices [7,7,7,7,7]}"
    puts "#{number_of_arithmetic_slices [7,7,7,7]}"
    puts "#{number_of_arithmetic_slices [7,7,7]}"
end
