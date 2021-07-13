#
# @lc app=leetcode.cn id=229 lang=ruby
#
# [229] 求众数 II
#

# @lc code=start
# @param {Integer[]} nums
# @return {Integer[]}
def majority_element(nums)
    val1, cnt1 = 0, 0
    val2, cnt2 = 0, 0

    nums.each{
        |v|
        if v == val1
            cnt1 += 1
            next
        elsif v == val2
            cnt2 += 1
        elsif cnt1 == 0
            val1 = v
            cnt1 += 1
            next
        elsif cnt2 == 0
            val2 = v
            cnt2 += 1
            next
        else
            cnt1 -= 1
            cnt2 -= 1
        end
    }

    total1 = 0
    total2 = 0
    nums.each {
        |v|
        case v
        when val1
            total1 += 1
        when val2 
            total2 += 1
        else
            next
        end
    }
    if total1 > nums.length / 3 && total2 > nums.length / 3
        return [val1, val2]
    elsif total1 > nums.length / 3
        return [val1]
    elsif total2 > nums.length / 3
        return [val2]
    else
        return Array.new
    end
end
# @lc code=end

