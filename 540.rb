#
# @lc app=leetcode.cn id=540 lang=ruby
#
# [540] 有序数组中的单一元素
#

# @lc code=start
# @param {Integer[]} nums
# @return {Integer}
def single_non_duplicate(nums)
    n = nums.size
    i, j = 0, n
    while j - i > 1
        m = (i + j) / 2
        if nums[m] != nums[m - 1] && nums[m] != nums[m + 1]
            return nums[m]
        end

        f1, f2 = ((j - i) / 2) % 2 == 0, nums[m - 1] == nums[m]
        if f1
            if f2
                j = m - 1
            else
                i = m
            end
        else
            if f2
                i = m + 1
            else
                j = m
            end
        end
    end
    return nums[i]
end
# @lc code=end

if __FILE__ == $0
    puts "#{single_non_duplicate [1,1,2,3,3,4,4,8,8]}"
    puts "#{single_non_duplicate [3,3,7,7,10,11,11]}"
    # puts "#{single_non_duplicate }"
end
