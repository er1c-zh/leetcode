#
# @lc app=leetcode.cn id=330 lang=ruby
#
# [330] 按要求补齐数组
#

# @lc code=start
# @param {Integer[]} nums
# @param {Integer} n
# @return {Integer}
def min_patches(nums, n)
    result = 0
    cur = 1
    nums.each{
        |v|
        if cur > n
            break
        end
        while v > cur
            result += 1
            cur *= 2
            if cur > n
                break
            end
        end
        cur += v
    }
    while cur <= n
        result += 1
        cur *= 2
    end
    return result
end
# @lc code=end

if __FILE__ == $0
    puts "#{min_patches([1,2,31,33], 2147483647)}"
    puts "#{min_patches([1,3], 6)}"
    # puts "#{min_patches}"
end
