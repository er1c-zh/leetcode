#
# @lc app=leetcode.cn id=526 lang=ruby
#
# [526] 优美的排列
#

# @lc code=start
# @param {Integer} n
# @return {Integer}
def count_arrangement(n)
    return helper(n, Array.new(n+1){false}, 1)
end

def helper(n, m, i)
    if i > n
        return 1
    end
    result = 0
    for j in 1...n+1
        if j % i != 0 && i % j != 0
            next
        end
        if m[j]
            next
        end
        m[j] = true
        result += helper(n, m, i + 1)
        m[j] = false
    end
    return result
end
# @lc code=end

if __FILE__ == $0
    puts "#{count_arrangement 1}"
    puts "#{count_arrangement 2}"
end
