#
# @lc app=leetcode.cn id=560 lang=ruby
#
# [560] 和为 K 的子数组
#

# @lc code=start
# @param {Integer[]} nums
# @param {Integer} k
# @return {Integer}
def subarray_sum(nums, k)
    m = Hash.new{0}
    m[0] = 1
    n = nums.size
    result = 0
    cur = 0
    for i in 0...n
        cur += nums[i]
        t = cur - k
        result += m[t]
        m[cur] = m[cur] + 1
    end
    return result
end
# @lc code=end

