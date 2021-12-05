#
# @lc app=leetcode.cn id=368 lang=ruby
#
# [368] 最大整除子集
#

# @lc code=start
# @param {Integer[]} nums
# @return {Integer[]}
def largest_divisible_subset(nums)
    map = Hash.new
    result = []
    nums.sort!
    i = 0
    while i < nums.length
        j = 0
        while j < i
            if nums[i] % nums[j] == 0
                if map[i] == nil || map[i].length < map[j].length
                    map[i] = map[j]
                end
            end
            j += 1
        end
        if map[i] == nil
            map[i] = [nums[i]]
        else
            map[i] += [nums[i]]
        end
        if map[i].length > result.length
            result = map[i]
        end
        i += 1
    end

    return result
end
# @lc code=end

if __FILE__ == $0
    puts "#{largest_divisible_subset([1,2,4,8])}"
end
