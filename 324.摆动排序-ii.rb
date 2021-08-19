#
# @lc app=leetcode.cn id=324 lang=ruby
#
# [324] 摆动排序 II
#

# @lc code=start
# @param {Integer[]} nums
# @return {Void} Do not return anything, modify nums in-place instead.
def wiggle_sort(nums)
    nums.sort!
    i, j = (nums.length - 1) / 2, nums.length - 1
    stack = []
    while stack.length < nums.length
        stack.append nums[i]
        if stack.length < nums.length
            stack.append nums[j]
        end
        i -= 1
        j -= 1
    end
    stack.each_index{
        |idx|
        nums[idx] = stack[idx]
    }
end
# @lc code=end

