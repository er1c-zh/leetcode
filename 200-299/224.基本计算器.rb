#
# @lc app=leetcode.cn id=224 lang=ruby
#
# [224] 基本计算器
#

# @lc code=start
# @param {String} s
# @return {Integer}
def calculate(s)
  r, i = helper s, 0
  return r
end

def helper(s, i)
  cur = 0

  result = 0
  symbol = "+"

  while i < s.length
    cur = s[i]
    if cur == "+" || cur == "-"
      symbol = cur
    elsif cur == "("
      tmp, i = helper s, i + 1
      if symbol == ""
        # unreachable
        p "unreachable 1"
        return -1
      end
      result = symbol == "+" ? result + tmp : result - tmp
      symbol = ""
    elsif cur == ")"
      return result, i
    elsif cur == " "
      # do nothing
    else
      # number
      delta = 0
      while i + delta < s.length && ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"].include?(s[i + delta])
        delta += 1
      end
      tmp = Integer(s.slice i, delta)
      if symbol == ""
        # unreachable
        p "unreachable 2"
        return -1
      end
      result = symbol == "+" ? result + tmp : result - tmp
      symbol = ""
      i += delta - 1
    end
    i += 1
  end
  return result, i
end

# @lc code=end
