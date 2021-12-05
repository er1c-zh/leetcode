#
# @lc app=leetcode.cn id=338 lang=ruby
#
# [338] 比特位计数
#

# @lc code=start
# @param {Integer} n
# @return {Integer[]}
def count_bits(n)
    result = [0]
    (1..n).each{
        |v|
        result[v] = result[v >> 1] + (v & 0b1)
    }
    return result
end
# @lc code=end

