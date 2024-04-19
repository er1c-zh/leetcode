#
# @lc app=leetcode.cn id=611 lang=ruby
#
# [611] 有效三角形的个数
#

# @lc code=start
# @param {Integer[]} nums
# @return {Integer}
def triangle_number(nums)
    eric_max = 1002
    cnts = Array.new(eric_max){0}
    for n in nums
        cnts[n] += 1
    end
    cnts_pre_sum = Array.new(eric_max){0}
    for i in 0...eric_max
        cnts_pre_sum[i] = cnts[i]
        if i > 0
            cnts_pre_sum[i] += cnts_pre_sum[i - 1]
        end
    end
    
    # puts "#{cnts_pre_sum}"

    i = 0
    n = nums.size
    result = 0
    while i < n
        if nums[i] == 0
            i += 1
            next
        end
        j = i + 1
        while j < n
            if nums[j] == 0
                j += 1
                next
            end
            e1, e2 = nums[i], nums[j]
            if e1 < e2
                e1, e2 = e2, e1
            end
            # e1 >= e2
            emin, emax = e1 - e2, e1 + e2 - 1 # (emin, emax]
            if emax >= 1000
                emax = 1000
            end
            delta = cnts_pre_sum[emax] - cnts_pre_sum[emin] + (e1 > emin && e1 <= emax ? -1 : 0) + (e2 > emin && e2 <= emax ? -1 : 0)
            # puts "#{e1}, #{e2}, (#{emin}, #{emax}], delta:#{delta}"
            result += delta
            j += 1
        end
        i += 1
    end
    return result / 3
end
# @lc code=end

if __FILE__ == $0
    puts "#{triangle_number [2,2,3,4]}"
    puts "#{triangle_number [4,2,3,4]}"
end
