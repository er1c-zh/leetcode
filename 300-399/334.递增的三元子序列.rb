#
# @lc app=leetcode.cn id=334 lang=ruby
#
# [334] 递增的三元子序列
#

# @lc code=start
# @param {Integer[]} nums
# @return {Boolean}
def increasing_triplet(nums)
    if nums.length <= 2
        return false
    end
    i = 0
    min, a, b = nums[i], nums[i], nil
    i += 1
    while i < nums.length
        v = nums[i]
        if v < min
            min = v
        end
        if b != nil
            if v > b
                return true
            elsif v > a
                b = v
            elsif v > min
                a = min
                b = v
            end
        else
            if v > a
                b = v
            elsif v > min
                a = min
                b = v
            elsif v < a
                a = v
            end
        end
        i += 1
    end
    return false
end
# @lc code=end

if __FILE__ == $0
    p increasing_triplet([1,2,3,4,5])
    p increasing_triplet([5,4,3,2,1])
    p increasing_triplet([2,1,5,0,4,6])
    # p increasing_triplet()
end
