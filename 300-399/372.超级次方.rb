#
# @lc app=leetcode.cn id=372 lang=ruby
#
# [372] 超级次方
#

# @lc code=start
# @param {Integer} a
# @param {Integer[]} b
# @return {Integer}
def super_pow(a, b)
    b.reverse!
    pre = a % 1337
    result = 1
    b.each{
        |v|
        cur = 1
        (1..10).each{
            |cnt|
            cur = (cur * pre) % 1337
            if cnt == v
                result = (result * cur) % 1337
            end
        }
        pre = cur
    }
    return result
end
# @lc code=end

if __FILE__ == $0
    puts "==#{super_pow(2, [0])}"
    puts "==#{super_pow(2, [3])}"
    puts "==#{super_pow(2, [1, 0])}"
    puts "==#{super_pow(1, [4,3,3,8,5,2])}"
    puts "==#{super_pow(2147483647, [2,0,0])}"
end
