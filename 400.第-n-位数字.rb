#
# @lc app=leetcode.cn id=400 lang=ruby
#
# [400] 第 N 位数字
#

# @lc code=start
# @param {Integer} n
# @return {Integer}
def find_nth_digit(n)
    k = 1
    base = 9
    while n > base * k
        n -= base * k
        k += 1
        base *= 10
    end
    n -= 1
    a = n / k
    b = n % k
    return (((10 ** (k - 1)) + a) / (10 ** (k - 1 - b))) % 10
end
# @lc code=end

if __FILE__ == $0
    puts "#{find_nth_digit 3}"
    puts "#{find_nth_digit 11}"
    puts "#{find_nth_digit 190}"
end
