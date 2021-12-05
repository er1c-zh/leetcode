#
# @lc app=leetcode.cn id=263 lang=ruby
#
# [263] 丑数
#

# @lc code=start
# @param {Integer} n
# @return {Boolean}
def is_ugly(n)
    if n < 1
        return false
    end
    while true
        if n == 1
            return true
        end
        if n % 5 == 0
            n /= 5
        elsif n % 3 == 0
            n /= 3
        elsif n % 2 == 0
            n /= 2
        else
            return false
        end
    end
end
# @lc code=end

