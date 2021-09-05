#
# @lc app=leetcode.cn id=166 lang=ruby
#
# [166] 分数到小数
#

# @lc code=start
# @param {Integer} numerator
# @param {Integer} denominator
# @return {String}
def fraction_to_decimal(numerator, denominator)
  prefix = ""
  if numerator < 0 && denominator > 0
    numerator = -numerator
    prefix = "-"
  end
  if numerator > 0 && denominator < 0
    denominator = -denominator
    prefix = "-"
  end
  if numerator < 0 && denominator < 0
    numerator = -numerator
    denominator = -denominator
  end
  left = numerator / denominator
  str = format "%s%d", prefix, left
  base = numerator % denominator
  if base == 0
    return str
  end
  str += "."

  right = ""
  m = Hash.new
  # map[base] = right_idx
  while right.length < 20001
    if m[base] != nil
      # find duplicated
      right = right.slice(0, m[base]) + "(" + right.slice(m[base], right.length) + ")"
      break
    end
    m[base] = right.length
    right += format "%d", ((base * 10) / denominator)
    base = (base * 10) % denominator

    if base == 0
      break
    end
  end

  return str + right
end

# @lc code=end
