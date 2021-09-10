#
# @lc app=leetcode.cn id=260 lang=ruby
#
# [260] 只出现一次的数字 III
#

# @lc code=start
# @param {Integer[]} nums
# @return {Integer[]}
def single_number(nums)
    r = 0
    nums.each{
        |x|
        r ^= x
    }

    flag = 1
    (0..32).each{
        |offset|
        if r & flag > 0
            break
        else
            flag = flag << 1
        end
    }

    a, b = 0, 0
    nums.each{
        |x|
        if flag & x == 0
            a ^= x
        else
            b ^= x
        end
    }

    return [a, b]
end
# @lc code=end

