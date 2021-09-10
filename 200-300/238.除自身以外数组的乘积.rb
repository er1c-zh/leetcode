#
# @lc app=leetcode.cn id=238 lang=ruby
#
# [238] 除自身以外数组的乘积
#

# @lc code=start
# @param {Integer[]} nums
# @return {Integer[]}
def product_except_self(nums)
    prefix = Array.new
    suffix = Array.new
    l = nums.length
    nums.each_index{
        |idx|
        if idx == 0
            prefix[0] = 1
            suffix[l - 1] = 1
        else
            prefix[idx] = prefix[idx - 1] * nums[idx - 1]
            suffix[l - 1 - idx] = suffix[l - idx] * nums[l - idx]
        end
    }

    # p prefix
    # p suffix

    result = Array.new
    prefix.each_index{
        |idx|
        result[idx] = prefix[idx] * suffix[idx]
    }
    return result
end
# @lc code=end

