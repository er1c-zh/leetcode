#
# @lc app=leetcode.cn id=477 lang=ruby
#
# [477] 汉明距离总和
#

# @lc code=start
# @param {Integer[]} nums
# @return {Integer}
def total_hamming_distance(nums)
    m = Array.new(2){Array.new(64){0}}
    nums.each{
        |n|
        (0..63).each{
            |i|
            m[n & 1][i] += 1
            n = n >> 1
        }
    }
    result = 0
    (0..63).each{
        |i|
        result += m[0][i] * m[1][i]
    }
    return result
end
# @lc code=end

if __FILE__ == $0
    puts "#{total_hamming_distance [4,14,2]}"
    puts "#{total_hamming_distance [4,14,4]}"
end
