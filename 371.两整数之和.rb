#
# @lc app=leetcode.cn id=371 lang=ruby
#
# [371] 两整数之和
#

# @lc code=start
# @param {Integer} a
# @param {Integer} b
# @return {Integer}
def get_sum(a, b)
    return a + b
    # how ruby deal with bit-op?
    r = 0
    carry = 0
    (0..10).each{
        |bit|
        mask = 1 << bit
        va, vb = (a & mask) >> bit, (b & mask) >> bit
        tmp = carry
        tmp += va & 0b1
        tmp += vb & 0b1
        puts "#{tmp} mask: #{mask.to_s(2)} #{carry} #{va.to_s(2)} #{vb.to_s(2)}"
        case tmp
        when 0
            # do nothing
            carry = 0
        when 1
            r = r | (0b1 << bit)
            carry = 0
        when 2
            carry = 1
        when 3
            carry = 1
            r = r | (0b1 << bit)
        end
    }
    return r
end
# @lc code=end

if __FILE__ == $0
    puts "#{get_sum -8, -1}"
end
