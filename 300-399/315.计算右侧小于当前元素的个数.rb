#
# @lc app=leetcode.cn id=315 lang=ruby
#
# [315] 计算右侧小于当前元素的个数
#

# @lc code=start
# @param {Integer[]} nums
# @return {Integer[]}
def count_smaller(nums)
    m = Hash.new
    newVal2OldVal = [-1] + nums.uniq().sort()
    newVal2OldVal.each_index{
        |newVal|
        m[newVal2OldVal[newVal]] = newVal
    }

    if false
        p newVal2OldVal
        p m
    end

    result = Array.new(nums.length){0}
    eta = Eta.new(newVal2OldVal.length)
    nums.each_index{
        |delta|
        i = nums.length - 1 - delta
        v = nums[i]
        result[i] = eta.get(m[v] - 1)
        eta.add(m[v])
    }
    return result
end

class Eta
    attr_accessor :val, :n
    def initialize(n)
        @n, @val = n, Array.new(n+1){0}
    end
    def add(i)
        while i <= n
            @val[i] += 1
            i += self.lowbit(i)
        end
    end
    def get(i)
        if i < 0
            return 0
        end
        t = 0
        while i > 0
            t += @val[i]
            i -= lowbit(i)
        end
        return t
    end
    def lowbit(i)
        return i & (-i)
    end
end

# @lc code=end

if __FILE__ == $0
    p count_smaller([5,2,6,1])
end
