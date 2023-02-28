#
# @lc app=leetcode.cn id=553 lang=ruby
#
# [553] 最优除法
#

# @lc code=start
# @param {Integer[]} nums
# @return {String}
def optimal_division(nums)
    if nums.size == 1
        return "#{nums[0]}"
    end
    if nums.size == 2
        return "#{nums[0]}/#{nums[1]}"
    end

    return "#{nums[0]}/(#{nums[1...].join("/")})"
end
# @lc code=end

