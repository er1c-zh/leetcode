#
# @lc app=leetcode.cn id=525 lang=ruby
#
# [525] 连续数组
#

# @lc code=start
# @param {Integer[]} nums
# @return {Integer}
def find_max_length(nums)
    result = 0
    m = Hash.new{false}
    m[0] = -1
    n = nums.size
    cur0, cur1 = 0, 0
    for i in 0...n
        if nums[i] == 0
            cur0 += 1
        else
            cur1 += 1
        end
        delta = cur0 - cur1
        td = delta
        if m[td] != false && i - m[td] > result
            result = i - m[td]
        end
        if m[delta] == false
            m[delta] = i
        end
    end
    return result
end
# @lc code=end

if __FILE__ == $0
    puts "#{find_max_length [0,1]}"
    puts "#{find_max_length [0,1,0]}"
end
