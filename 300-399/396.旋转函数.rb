#
# @lc app=leetcode.cn id=396 lang=ruby
#
# [396] 旋转函数
#

# @lc code=start
# @param {Integer[]} nums
# @return {Integer}
def max_rotate_function(nums)
    n = nums.length
    delta = 0
    sum = 0
    nums.each_index{
        |i|
        delta += nums[i]
        sum += i * nums[i]
    }
    result = sum
    (0..n - 2).each{
        |i|
        i = n - 1 - i
        sum = sum + delta - n * nums[i]
        if result < sum
            result = sum
        end
    }
    return result
end
# @lc code=end

if __FILE__ == $0
    puts "#{max_rotate_function [4, 3, 2, 6]}"
end
