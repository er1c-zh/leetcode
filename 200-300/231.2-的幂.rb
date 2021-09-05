#
# @lc app=leetcode.cn id=231 lang=ruby
#
# [231] 2 的幂
#

# @lc code=start
# @param {Integer} n
# @return {Boolean}
def is_power_of_two(n)
    if n <= 0
        return false
    end
    return n & (n - 1) == 0
end
# @lc code=end

