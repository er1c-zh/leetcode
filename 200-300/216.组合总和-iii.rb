#
# @lc app=leetcode.cn id=216 lang=ruby
#
# [216] 组合总和 III
#

# @lc code=start
# @param {Integer} k
# @param {Integer} n
# @return {Integer[][]}
def combination_sum3(k, n)
    return helper k, n, Array.new(10){0}, Array.new(0), 1
end

def helper(k, n, mask, prefix, from)
  result = Array.new(0) { Array.new(0) }
  if n == 0 and k == 0
    result = result.append prefix.clone
    return result
  end
  for i in from...10
    if n < i || mask[i] == 1
        next
    end
    mask[i] = 1
    p = prefix.clone().append i
    result = result + helper(k - 1, n - i, mask, p, i)
    mask[i] = 0
  end
  return result
end

# @lc code=end
