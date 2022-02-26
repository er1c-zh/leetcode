#
# @lc app=leetcode.cn id=470 lang=ruby
#
# [470] 用 Rand7() 实现 Rand10()
#

# @lc code=start
# The rand7() API is already defined for you.
# def rand7()
# @return {Integer} a random integer in the range 1 to 7

def rand10()
    while true
        v1, v2 = rand7(), rand7()
        if v2 <= 4
            return v1
        end
        if v2 <= 6 && v1 <= 6
            return (v1 + 1) / 2 + 7
        end
        if v2 >= 7
            next
        end
    end
end
# @lc code=end

