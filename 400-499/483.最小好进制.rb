#
# @lc app=leetcode.cn id=483 lang=ruby
#
# [483] 最小好进制
#

# @lc code=start
# @param {String} n
# @return {String}
def smallest_good_base(n)
    _n = n.to_i
    (1..64).each{
        |l|
        l = 65 - l
        v = (_n ** (1.0/l)).to_i
        if v < 2
            next
        end
        tmp = 0
        (0..l).each{
            |i|
            tmp += v ** i
        }
        if tmp == _n
            # puts "#{tmp}, #{v}, #{l}, #{_n}"
            return v.to_s
        end
    }
    return (_n - 1).to_s
end
# @lc code=end

if __FILE__ == $0
    puts "#{smallest_good_base("4681")}"
    puts "#{smallest_good_base("121327")}"
    puts "#{smallest_good_base("31")}"
end

