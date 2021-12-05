#
# @lc app=leetcode.cn id=376 lang=ruby
#
# [376] 摆动序列
#

# @lc code=start
# @param {Integer[]} nums
# @return {Integer}
def wiggle_max_length(nums)
    l = nums.length
    dp1 = Array.new(l){0} # 从i开始下降的
    dp2 = Array.new(l){0} # 从i开始上升的

    result = 0

    nums.each_index{
        |i|
        if i == 0
            dp1[0] = 1
            dp2[0] = 1
            result = 1
        end
        v = nums[i]
        dp1[i], dp2[i] = 1, 1

        (0..i-1).each{
            |j|
            vp = nums[j]
            if vp > v && dp2[j] + 1 > dp1[i]
                dp1[i] = dp2[j] + 1
            elsif vp < v && dp1[j] + 1 > dp2[i]
                dp2[i] = dp1[j] + 1
            end
        }
        if dp1[i] > result
            result = dp1[i]
        end
        if dp2[i] > result
            result = dp2[i]
        end
    }

    return result
end
# @lc code=end

if __FILE__ == $0
    puts "#{wiggle_max_length [1,7,4,9,2,5]}"
    puts "#{wiggle_max_length [1,17,5,10,13,15,10,5,16,8]}"
    puts "#{wiggle_max_length [1,2,3,4,5,6,7,8,9]}"
end
