#
# @lc app=leetcode.cn id=202 lang=ruby
#
# [202] 快乐数
#

# @lc code=start
# @param {Integer} n
# @return {Boolean}
def is_happy(n)
  set = Hash.new

  while true
    tmp = 0
    while n > 0
      tmp += (n % 10) ** 2
      if tmp < 0
        # overflow
        return false
      end
      n = n / 10
    end
    n = tmp
    if n == 1
      return true
    end
    if set[n] != nil
      return false
    end
    set[n] = true
  end
end

# @lc code=end
