#
# @lc app=leetcode.cn id=377 lang=ruby
#
# [377] 组合总和 Ⅳ
#

# @lc code=start
# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer}
def combination_sum4(nums, target)
    dp = Array.new(target + 1){0}
    dp.each_index{
        |i|
        if i == 0
            dp[i] = 1
            next
        end
        nums.each{
            |v|
            if i - v >= 0
                dp[i] += dp[i - v]
            end
        }
    }
    return dp[target]
end
# @lc code=end

if __FILE__ == $0
    puts "#{combination_sum4([1,2,3], 4)}"
    puts "#{combination_sum4([9], 3)}"
end
