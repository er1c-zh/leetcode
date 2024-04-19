#
# @lc app=leetcode.cn id=667 lang=ruby
#
# [667] 优美的排列 II
#

# @lc code=start
# @param {Integer} n
# @param {Integer} k
# @return {Integer[]}
def construct_array(n, k)
    result = Array.new(n){0}
    d = 0
    a = 0
    for i in 0...n
        if d == 0
            result[i] = a * (k + 1)
            a += 1
            d = k
        elsif a == 1
            result[i] = result[i - 1] + ((k - d) % 2 == 0 ? 1 : -1) * d
            d -= 1
        else
            result[i] = result[i - 1] + 1
        end
    end
    for i in 0...n
        result[i] += 1
    end
    return result
end
# @lc code=end

if __FILE__ == $0
    puts "#{construct_array 3, 1}"
    puts "#{construct_array 3, 2}"
    puts "#{construct_array 4, 3}"
    puts "#{construct_array 5, 2}"
end
