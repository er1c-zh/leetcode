#
# @lc app=leetcode.cn id=416 lang=ruby
#
# [416] 分割等和子集
#

# @lc code=start
# @param {Integer[]} nums
# @return {Boolean}
def can_partition(nums)
    total = nums.sum
    if total % 2 != 0
        return false
    end
    n = nums.length
    target = total / 2
    set = Hash.new
    set[0] = true
    nums.each_index{
        |i|
        set.keys.each{
            |before|
            after = before + nums[i]
            if after > target
                next
            end
            set[after] = true
        }
    }
    return set[target] != nil
end
# @lc code=end

if __FILE__ == $0
    puts "#{can_partition([1,5,11,5])}"
    puts "#{can_partition([1,2,3,5])}"
end
