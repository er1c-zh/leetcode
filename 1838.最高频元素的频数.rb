#
# @lc app=leetcode.cn id=1838 lang=ruby
#
# [1838] 最高频元素的频数
#

# @lc code=start
# @param {Integer[]} nums
# @param {Integer} k
# @return {Integer}
def max_frequency(nums, k)
    nums.sort!{
        |x, y|
        y <=> x
    }
    fast, slow = 0, 0
    sum = k
    result = 1
    while fast < nums.length
        while fast < nums.length && (nums[slow] - nums[fast] <= sum)
            sum -= nums[slow] - nums[fast]
            fast += 1
        end
        if fast - slow > result
            result = fast - slow
        end
        slow += 1
        if slow < nums.length
            sum += (nums[slow - 1] - nums[slow]) * (fast - slow)
        end
    end
    return result
end
# @lc code=end

if __FILE__ == $0
    puts "#{max_frequency [1,2,4], 5}"
    puts "#{max_frequency [1,4,8,13], 5}"
    puts "#{max_frequency [3,9,6], 2}"
    # puts "#{max_frequency [], }"
end
