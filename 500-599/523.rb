#
# @lc app=leetcode.cn id=523 lang=ruby
#
# [523] 连续的子数组和
#

# @lc code=start
# @param {Integer[]} nums
# @param {Integer} k
# @return {Boolean}
def check_subarray_sum(nums, k)
    n = nums.size
    pre_sum = Array.new(n){0}
    m = Hash.new{false}
    for i in 0...n
        ps = nums[i]
        if i > 0
            ps += pre_sum[i - 1]
        end
        pre_sum[i] = ps

        if i > 0 && ps % k == 0
            return true
        end

        if ps / k > m.size
            j = i - 2
            while j >= 0
                if (ps - pre_sum[j]) % k == 0
                    return true
                end
                j -= 1
            end
        else
            cnt = 0
            while cnt * k < ps
                target = ps - cnt * k
                if m[target] != false && i - m[target] > 1
                    return true
                end
                cnt += 1
            end
        end

        if !m[ps]
            m[ps] = i
        end
    end

    return false
end
# @lc code=end

if __FILE__ == $0
    puts "#{check_subarray_sum [23, 2, 4, 6, 7], 6}"
    puts "#{check_subarray_sum [23,2,4,6,6], 7}"
    puts "#{check_subarray_sum [23,2,6,4,7], 13}"
    puts "#{check_subarray_sum [5,0,0,0], 3}"
end
