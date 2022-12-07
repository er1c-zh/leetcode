#
# @lc app=leetcode.cn id=565 lang=ruby
#
# [565] 数组嵌套
#

# @lc code=start
# @param {Integer[]} nums
# @return {Integer}
def array_nesting(nums)
    n = nums.size
    f = Array.new(n){-1}
    for i in 0...n
        f[nums[i]] = i
    end

    result = 0
    for i in 0...n
        if f[i] > -1
            next
        end
        j = i
        cnt = 0
        while f[j] > -1
            cnt += 1
            f[j] = -2
            j = nums[j]
        end
        if cnt > result
            result = cnt
        end
    end
    for i in 0...n
        if f[i] <= -1
            next
        end
        j = i
        cnt = 0
        while f[j] > -1
            cnt += 1
            f[j] = -2
            j = nums[j]
        end
        if cnt > result
            result = cnt
        end
    end
    return result
end
# @lc code=end

if __FILE__ == $0
    puts "#{array_nesting [5,4,0,3,1,6,2]}"
end
