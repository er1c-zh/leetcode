#
# @lc app=leetcode.cn id=169 lang=ruby
#
# [169] 多数元素
#

# @lc code=start
# @param {Integer[]} nums
# @return {Integer}
def majority_element(nums)
    cur = nil
    cnt = 0

    for val in nums 
        if cnt == 0 
            cur = val
            cnt = 1
        elsif cur == val
            cnt += 1
        else
            cnt -= 1
        end
    end
    return cur
end
# @lc code=end

