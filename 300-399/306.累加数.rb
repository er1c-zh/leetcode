#
# @lc app=leetcode.cn id=306 lang=ruby
#
# [306] 累加数
#

# @lc code=start
# @param {String} num
# @return {Boolean}
def is_additive_number(num)
    nums = []
    (0..num.length - 1).each{
        |i|
        nums.append num[i].to_i
    }
    (0..nums.length - 3).each{
        |i|
        (i + 1..nums.length - 2).each{
            |j|
            if helper(nums[0..i], nums[i + 1..j], nums[j + 1.. -1])
                return true
            end
        }
    }
    return false
end

def helper(p1, p2, nums)
    # puts "==#{p1}, #{p2}, #{nums}"
    if nums.length == 0
        return true
    end
    if (p1[0] == 0 && p1.length > 1) || (p2[0] == 0 && p2.length > 1)
        return false
    end
    _p1, _p2, t, idx, carry = p1.reverse, p2.reverse, [], 0, 0
    while idx < p1.length || idx < p2.length
        # puts "++== #{idx} #{carry} + #{p1[idx]} + #{p2[idx]}"
        tmp = carry
        if _p1.length > idx
            tmp += _p1[idx]
        end
        if _p2.length > idx
            tmp += _p2[idx]
        end
        t[idx] = tmp % 10
        carry = tmp / 10
        idx += 1
    end
    if carry > 0
        t[idx] = carry
    end
    t.reverse!

    # puts "#{p1}, #{p2}, #{t}, #{nums}"

    if t.length > nums.length
        return false
    end

    idx = 0

    while idx < t.length
        if t[idx] != nums[idx]
            return false
        end
        idx += 1
    end
    return helper p2, t, nums[idx..-1]
end
# @lc code=end

if __FILE__ == $0
    p is_additive_number("199001200")
end
