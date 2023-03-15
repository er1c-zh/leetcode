#
# @lc app=leetcode.cn id=646 lang=ruby
#
# [646] 最长数对链
#

# @lc code=start
# @param {Integer[][]} pairs
# @return {Integer}
def find_longest_chain(pairs)
    pairs.sort!{
        |x, y|
        x[1] <=> y[1]
    }
    result = 0
    cur = -1001
    while pairs.size > 0
        if pairs[0][0] > cur
            result += 1
            cur = pairs[0][1]
        end
        pairs = pairs[1..-1]
    end

    return result
end
# @lc code=end

if __FILE__ == $0
    puts "#{find_longest_chain [[1,2], [2,3], [3,4]]}"
    puts "#{find_longest_chain [[1,2],[7,8],[4,5]]}"
    puts "#{find_longest_chain [[-10,-8],[8,9],[-5,0],[6,10],[-6,-4],[1,7],[9,10],[-4,7]]}"
end
