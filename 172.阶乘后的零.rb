#
# @lc app=leetcode.cn id=172 lang=ruby
#
# [172] 阶乘后的零
#

# @lc code=start
# @param {Integer} n
# @return {Integer}
def trailing_zeroes(n)
  cur = 5
  cnt = 0
  while n / cur > 0
    cnt += n / cur
    cur *= 5
  end
  return cnt
end

# @lc code=end
