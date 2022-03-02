#
# @lc app=leetcode.cn id=473 lang=ruby
#
# [473] 火柴拼正方形
#

# @lc code=start
# @param {Integer[]} matchsticks
# @return {Boolean}
def makesquare(matchsticks)
    l = matchsticks.sum / 4
    if l * 4 != matchsticks.sum
        return false
    end
    return helper matchsticks.sort{
        |x, y|
        y <=> x
    }, 0, [0, 0, 0, 0], l
end
def helper(matchsticks, i, vals, l)
    if i >= matchsticks.length
        v = vals[0]
        vals.each{
            |_v|
            if _v != v
                return false
            end
        }
        return true
    end
    vals.each_index{
        |j|
        vals[j] += matchsticks[i]
        if vals[j] <= l
            tmp = helper(matchsticks, i + 1, vals, l)
            if tmp
                return true
            end
        end
        vals[j] -= matchsticks[i]
    }
    return false
end
# @lc code=end

if __FILE__ == $0
    puts "#{makesquare [1,1,2,2,2]}"
    puts "#{makesquare [1,2,3,4,5,6,7,8,9,10,5,4,3,2,1]    }"
end
