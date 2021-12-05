#
# @lc app=leetcode.cn id=190 lang=ruby
#
# [190] 颠倒二进制位
#

# @lc code=start
# @param {Integer} n, a positive integer
# @return {Integer}
$mask2 = 0x55555555 # 0101
$mask4 = 0x33333333 # 0011
$mask8 = 0x0F0F0F0F # 00001111
$mask16 = 0x00FF00FF
$mask = 0x0000FFFF

def reverse_bits(n)
  n = ((n >> 1) & $mask2) | ((n & $mask2) << 1)
  n = ((n >> 2) & $mask4) | ((n & $mask4) << 2)
  n = ((n >> 4) & $mask8) | ((n & $mask8) << 4)
  n = ((n >> 8) & $mask16) | ((n & $mask16) << 8)
  return ((n >> 16) & $mask) | ((n & $mask) << 16)
end

# @lc code=end
