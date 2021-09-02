#
# @lc app=leetcode.cn id=342 lang=ruby
#
# [342] 4的幂
#

# @lc code=start
# @param {Integer} n
# @return {Boolean}
def is_power_of_four(n)
    if n <= 0
        return false
    end
    if n & n - 1 != 0
        return false
    end
    if n & 0xAAAAAAAA != 0
        return false
    end
    return true
end
# @lc code=end

