#
# @lc app=leetcode.cn id=268 lang=ruby
#
# [268] 丢失的数字
#

# @lc code=start
# @param {Integer[]} nums
# @return {Integer}
def missing_number(nums)
    overflow = nil
    nums.each_index{
        |idx|
        if nums[idx] == idx
            next
        end
        cur = nums[idx]
        nums[idx] = nil

        while true
            if cur >= nums.length
                overflow = cur
                break
            end
            if nums[cur] == nil
                nums[cur] = cur
                break
            end
            tmp = nums[cur]
            nums[cur] = cur
            cur = tmp
        end
    }
    if overflow == nil
        return nums.length
    end
    result = nil
    nums.each_index{
        |idx|
        if nums[idx] == nil
            result = idx
            break
        end
    }
    return result
end
# @lc code=end

