#
# @lc app=leetcode.cn id=201 lang=ruby
#
# [201] 数字范围按位与
#

# @lc code=start
# @param {Integer} left
# @param {Integer} right
# @return {Integer}
def range_bitwise_and(left, right)
  r = left & right

  i = 0
  while i <= 32
    if (1 << i) <= right - left
      r &= ~(1 << i)
      i += 1
      next
    end
    break
  end

  return r
end

# @lc code=end
