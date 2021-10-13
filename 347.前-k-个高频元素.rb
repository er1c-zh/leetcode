#
# @lc app=leetcode.cn id=347 lang=ruby
#
# [347] 前 K 个高频元素
#

# @lc code=start
# @param {Integer[]} nums
# @param {Integer} k
# @return {Integer[]}
def top_k_frequent(nums, k)
    m = Hash.new(0)
    l = []
    nums.each{
        |v|
        m[v] += 1
    }
    m.keys.each{
        |k|
        l.append m[k]
    }
    # puts "#{m} #{l}"
    # O(n) 解决 top-k问题
    i, j = 0, l.length - 1
    flag = 0
    while true
        flag, f = l[i], l[i]
        slow, fast = i, i + 1
        while fast <= j
            if l[fast] >= f
                l[slow], l[slow + 1], l[fast] = l[fast], l[slow], l[slow + 1]
                slow += 1
            end
            fast += 1
        end
        # puts "#{slow}"
        if slow == k - 1
            break
        elsif slow < k - 1
            i = slow + 1
        else
            j = slow - 1
        end
    end

    # puts "#{flag} #{l}"
    result = []
    m.keys.each{
        |v|
        if m[v] >= flag
            result.append v
        end
    }
    return result
end
# @lc code=end

if __FILE__ == $0
    puts "#{top_k_frequent([1,1,1,2,2,3], 2)}"
    puts "#{top_k_frequent([1], 1)}"
    puts "#{top_k_frequent([4,1,-1,2,-1,2,3], 2)}"
end
