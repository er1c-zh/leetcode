#
# @lc app=leetcode.cn id=191 lang=ruby
#
# [191] 位1的个数
#

# @lc code=start
# @param {Integer} n, a positive integer
# @return {Integer}
def hamming_weight(n)
  n = ((n >> 1) & 0x55555555) + (n & 0x55555555) # 0101
  n = ((n >> 2) & 0x33333333) + (n & 0x33333333) # 0011
  n = ((n >> 4) & 0x0f0f0f0f) + (n & 0x0f0f0f0f)
  n = ((n >> 8) & 0x00ff00ff) + (n & 0x00ff00ff)
  n = ((n >> 16) & 0x0000ffff) + (n & 0x0000ffff)
  return n
end

# @lc code=end
