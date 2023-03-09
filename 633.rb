#
# @lc app=leetcode.cn id=633 lang=ruby
#
# [633] 平方数之和
#

# @lc code=start
# @param {Integer} c
# @return {Boolean}
def judge_square_sum(c)
    for i in 0...(Math.sqrt(c).to_i + 1)
        a_2 = i ** 2
        b_2 = c - a_2
        if Math.sqrt(b_2).to_i ** 2 + a_2 == c
            return true
        end
    end
    return false
end
# @lc code=end

if __FILE__ == $0
    puts "#{judge_square_sum 5}"
    puts "#{judge_square_sum 3}"
    puts "#{judge_square_sum 1e7 + 23421}"
end
