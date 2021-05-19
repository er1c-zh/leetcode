#
# @lc app=leetcode.cn id=214 lang=ruby
#
# [214] 最短回文串
#

# @lc code=start
# @param {String} s
# @return {String}
def getKmp(s)
  kmp = Array.new(s.length) { 0 }
  for i in 1...s.length
    kmp[i] = kmp[i - 1] + (s[kmp[i - 1]] == s[i - 1] ? 1 : 0)
  end
  return kmp
end

def shortest_palindrome(s)
  if s.length <= 1
    return s
  end

  kmp = getKmp s
  rev = s.reverse

  i = 0
  while i < s.length
    delta = 0
    isFail = false
    while delta < s.length - i
      if rev[i + delta] != s[delta]
        isFail = true
        break
      end
      delta += 1
    end
    if isFail
      # use kmp shift
      i = (i + delta) - kmp[i]
      next
    else
      return rev.slice(0, i) + s
    end
  end
  return rev.slice(0, rev.length - 1) + s
end

# @lc code=end
