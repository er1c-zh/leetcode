#
# @lc app=leetcode.cn id=659 lang=ruby
#
# [659] 分割数组为连续子序列
#

# @lc code=start
# @param {Integer[]} nums
# @return {Boolean}
def is_possible(nums)
    for i in 0...nums.size
        nums[i] += 1000
    end
    l = Array.new(2001){0}
    nums.each{
        |x|
        l[x] += 1
    }
    c1, c2, c3 = 0, 0, 0
    for i in 0...l.size
        cnt = l[i]
        nc1, nc2, nc3 = 0, 0, 0
        if cnt < c2
            return false
        end
        nc3 += c2
        cnt -= c2
        if cnt < c1
            return false
        end
        nc2 += c1
        cnt -= c1
        if cnt >= c3
            nc3 += c3
            cnt -= c3
        else
            nc3 += cnt
            cnt = 0
        end
        nc1 = cnt
        c1, c2, c3 = nc1, nc2, nc3
    end
    if c1 > 0 || c2 > 0
        return false
    end
    return true
end
# @lc code=end

if __FILE__ == $0
    puts "#{is_possible [1,2,3,3,4,5]}"
    puts "#{is_possible [1,2,3,3,4,4,5,5]}"
    puts "#{is_possible [1,2,3,4,4,5]}"
end
