#
# @lc app=leetcode.cn id=413 lang=ruby
#
# [413] 等差数列划分
#

# @lc code=start
# @param {Integer[]} nums
# @return {Integer}
def number_of_arithmetic_slices(nums)
    n = nums.length
    # dp[i][j] 到i为止，差为j的数列的长度
    dp = Array.new(n){Hash.new{0}}
    result = 0
    nums.each_index{
        |i|
        j = i - 1
        if j < 0
            next
        end
        result += dp[j][nums[i] - nums[j]]
        dp[i][nums[i] - nums[j]] = dp[j][nums[i] - nums[j]] + 1
    }
    if false
        dp.each{
            |v|
            puts "#{v}"
        }
    end
    return result
end
# @lc code=end

if __FILE__ == $0
    puts "#{number_of_arithmetic_slices [1,2,3,4]}"
    puts "#{number_of_arithmetic_slices [1]}"
    puts "#{number_of_arithmetic_slices [1,2,3,4,5,6]}"
end
