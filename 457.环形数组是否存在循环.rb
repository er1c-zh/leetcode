#
# @lc app=leetcode.cn id=457 lang=ruby
#
# [457] 环形数组是否存在循环
#

# @lc code=start
# @param {Integer[]} nums
# @return {Boolean}
def circular_array_loop(nums)
    i = 0
    n = nums.length
    bitset = Array.new(n) # 这里偷懒了，用真的bitset算是O(n)吧
    while i < nums.length
        if bitset[i] != nil
            # 已经检查过了 跳过
            i += 1
            next
        end
        v = nums[i]
        cur_bitset = Array.new(n)
        cur_bitset[i] = 1
        total = 1
        j = reset(i + v, n)
        while true
            if cur_bitset[j] != nil
                if nums[j].abs % n != 0
                    puts "#{i}, #{j}"
                    return true
                end
                break
            end
            if bitset[j] != nil
                break
            end
            _v = nums[j]
            if v * _v < 0
                break
            end
            bitset[j] = 0
            cur_bitset[j] = 0
            j = reset(j + _v, n)
            total += 1
        end
        i += 1
    end
    return false
end

def reset(i, n)
    while i < 0
        i += n
    end
    if i >= n
        i %= n
    end
    return i
end
# @lc code=end

if __FILE__ == $0
    # puts "#{circular_array_loop [-1,-2,-3,-4,-5]}"
    puts "#{circular_array_loop [-2,-3,-9]}"
end
