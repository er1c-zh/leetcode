#
# @lc app=leetcode.cn id=442 lang=ruby
#
# [442] 数组中重复的数据
#

# @lc code=start
# @param {Integer[]} nums
# @return {Integer[]}
def find_duplicates(nums)
    nums.each_index{
        |i|
        nums[i] -= 1
    }
    nums.each_index{
        |i|
        tmp = nums[i]
        if tmp < 0
            next
        end
        nums[i] = -1
        while tmp >= 0
            i = tmp
            tmp = nums[i]
            if tmp < 0
                nums[i] -= 1
            else
                nums[i] = -2
            end
        end
    }
    result = []
    nums.each_index{
        |i|
        if nums[i] == -3
            result.append i + 1
        end
    }
    return result
end
# @lc code=end

if __FILE__ == $0
    puts "#{find_duplicates([4,3,2,7,8,2,3,1])}"
end
