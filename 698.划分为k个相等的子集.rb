#
# @lc app=leetcode.cn id=698 lang=ruby
#
# [698] 划分为k个相等的子集
#

# @lc code=start
# @param {Integer[]} nums
# @param {Integer} k
# @return {Boolean}
def can_partition_k_subsets(nums, k)
    s = nums.sum
    if s % k != 0
        return false
    end
    t = s / k
    if nums.max > t
        return false
    end

    set = []
    list = []
    for i in 0...nums.length
        v = nums[i]
        bit = 1 << i
        if v == t
            set.append(bit)
        end
        a = [[v, bit]]
        for item in list
            val, mask = item[0], item[1]
            if val + v > t
                next
            elsif val + v == t
                set.append(mask | bit)
            else
                a.append([val + v, mask | bit])
            end
        end
        list += a
    end

    if set.length < k
        return false
    end

    return helper(set, 0, k, 0)
end
def helper(v, i, t, mask)
    if t == 0
        return true
    end
    if v.length <= i
        return false
    end
    if v[i] & mask > 0
        return helper(v, i + 1, t, mask)
    else
        return helper(v, i + 1, t - 1, mask | v[i]) || helper(v, i + 1, t, mask)
    end
end
# @lc code=end

if __FILE__ == $0
    puts "#{can_partition_k_subsets [4, 3, 2, 3, 5, 2, 1], 4}"
    puts "#{can_partition_k_subsets [1,2,3,4], 3}"
end
