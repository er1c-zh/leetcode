#
# @lc app=leetcode.cn id=665 lang=ruby
#
# [665] 非递减数列
#

# @lc code=start
# @param {Integer[]} nums
# @return {Boolean}
def check_possibility(nums)
    n = nums.size
    change = false
    for i in 0...nums.size
        if i == 0
            next
        elsif nums[i] >= nums[i - 1]
            next
        elsif change
            return false
        elsif i > 1 && nums[i] < nums[i - 2]
            nums[i] = nums[i - 1]
            change = true
        else
            nums[i - 1] = nums[i]
            change = true
        end
    end
    return true
end
# @lc code=end

if __FILE__ == $0
    puts "#{check_possibility [4,2,3,1]}"
end
