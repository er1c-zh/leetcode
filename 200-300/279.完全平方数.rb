#
# @lc app=leetcode.cn id=279 lang=ruby
#
# [279] 完全平方数
#

# @lc code=start
# @param {Integer} n
# @return {Integer}
def num_squares(n)
    queue = Hash.new
    queue[0] = 0

    round = 0
    while true
        round += 1
        nextQueue = Hash.new
        queue.each{
            |k, v|
            (1..100).each{
                |x|
                val = k + x**2
                if val == n
                    return round
                elsif val > n
                    break
                else
                    nextQueue[val] = true
                end
            }
        }
        queue = nextQueue
    end

    return round
end
# @lc code=end

if __FILE__ == $0
    p num_squares 1033
end
