#
# @lc app=leetcode.cn id=357 lang=ruby
#
# [357] 计算各个位数不同的数字个数
#

# @lc code=start
# @param {Integer} n
# @return {Integer}
def count_numbers_with_unique_digits(n)
    if n == 0
        return 1
    end
    return helper(10, n, true)
end
def helper(cnt, n, zeroPrefix)
    if n == 1
        return cnt
    end
    if zeroPrefix
        return helper(cnt, n - 1, true) + (cnt - 1) * helper(cnt - 1, n - 1, false)
    else
        return cnt * helper(cnt - 1, n - 1, false)
    end
end
# @lc code=end

if __FILE__ == $0
    puts "#{count_numbers_with_unique_digits 100}"
end
