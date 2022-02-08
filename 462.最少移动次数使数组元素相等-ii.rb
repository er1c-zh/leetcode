#
# @lc app=leetcode.cn id=462 lang=ruby
#
# [462] 最少移动次数使数组元素相等 II
#

# @lc code=start
# @param {Integer[]} nums
# @return {Integer}
def min_moves2(nums)
    nums.sort!
    if nums[0] < 0
        tmp = nums[0].abs
        nums.each_index{
            |i|
            nums[i] += tmp
        }
    end
    result = nums.sum
    pre = 0
    sum = nums.sum
    nums.each_index{
        |i|
        left = i
        right = nums.length - i - 1
        cur = nums[i]
        action = (cur * left - pre).abs + (sum - pre - cur - cur * right).abs
        if action < result
            result = action
        end
        pre += cur
    }
    return result
end
# @lc code=end

if __FILE__ == $0
    # puts "#{min_moves2 [-1, -2]}"
end
