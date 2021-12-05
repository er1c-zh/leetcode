#
# @lc app=leetcode.cn id=319 lang=ruby
#
# [319] 灯泡开关
#

# @lc code=start
# @param {Integer} n
# @return {Integer}
def bulb_switch(n)
    i, cnt = 1, 0
    while i ** 2 <= n
        cnt += 1
        i += 1
    end
    return cnt
end
# @lc code=end

