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
  if s.length <= 2
    return kmp
  end
  for i in 2...s.length
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
  delta = 0
  while i < s.length
    isFail = false
    while delta < s.length - i
      if rev[i + delta] != s[delta]
        # use kmp shift
        isFail = true
        delta = kmp[delta]
        i = [i + 1, i + (delta - kmp[delta])].max
        break
      end
      delta += 1
    end
    if isFail
      next
    else
      return rev.slice(0, i) + s
    end
  end
  return rev.slice(0, rev.length - 1) + s
end

# @lc code=end

if __FILE__ == $0
  p "#{getKmp "aacecaaa"}"
  p "#{getKmp "abcd"}"
  p "#{getKmp "ababb"}"
  p "#{shortest_palindrome "abcd"}"
  p "#{shortest_palindrome "babbbabbaba"}"
end
