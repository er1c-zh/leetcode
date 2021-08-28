#
# @lc app=leetcode.cn id=327 lang=ruby
#
# [327] 区间和的个数
#

# @lc code=start
# @param {Integer[]} nums
# @param {Integer} lower
# @param {Integer} upper
# @return {Integer}
def count_range_sum(nums, lower, upper)
    sums = Array.new
    sums[0] = 0
    (0..nums.length - 1).each{
        |i|
        sums[i + 1] = sums[i] + nums[i]
    }

    # puts "#{sums}"

    cnt, _ = helper(sums, lower, upper)
    return cnt
end
def helper(sums, lower, upper)
    debug = false
    if sums.length <= 1
        return 0, sums
    end
    mid = sums.length / 2
    lc, left = helper(sums[0..mid - 1], lower, upper)
    rc, right = helper(sums[mid..sums.length - 1], lower, upper)
    cnt = rc + lc

    if debug
        # puts "=#{left} #{right}"
    end

    # cal cnt
    i, j = 0, 0
    left.each{
        |v|
        while i < right.length && right[i] - v < lower
            i += 1
        end
        while j < right.length && right[j] - v <= upper
            j += 1
        end
        cnt += j - i
    }

    if debug
        puts "++#{cnt}/#{lc}/#{rc}, #{sums}"
    end

    # sort merge
    sums = Array.new
    i, j = 0, 0
    while i < left.length || j < right.length
        if i < left.length && (j >= right.length || left[i] <= right[j])
            sums.append left[i]
            i += 1
        else
            sums.append right[j]
            j += 1
        end
    end

    return cnt, sums
end
# @lc code=end


if __FILE__ == $0
    # p count_range_sum([-2,5,-1], -2, 2)
    # p count_range_sum([0], 0, 0)
    p count_range_sum([-3,1,2,-2,2,-1], -3, -1)
    # p count_range_sum()
end
