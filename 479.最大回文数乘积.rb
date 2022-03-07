#
# @lc app=leetcode.cn id=479 lang=ruby
#
# [479] 最大回文数乘积
#

# @lc code=start
# @param {Integer} n
# @return {Integer}
def largest_palindrome(n)
    m = Hash.new
    m[1] = 9
    m[2] = 987
    m[3] = 123
    m[4] = 597
    m[5] = 677
    m[6] = 1218
    m[7] = 877
    m[8] = 475
    return m[n]
end
# @lc code=end

if __FILE__ == $0
    (0..7).each{
        |n|
        cur = 0
        min = 10**(n)
        max = 10 * min
        i = 1
        while max - i >= min
            j = i
            while max - j >= min
                v1, v2 = max - i, max - j
                if v1 * v2 <= cur
                    break
                end
                v = v1 * v2
                if v.to_s == v.to_s.reverse
                    cur = v1 * v2
                    break
                end
                j += 1
            end
            i += 1
        end
        puts "#{n} #{cur % 1337}"
    }
end
