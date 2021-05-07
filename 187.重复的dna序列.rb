#
# @lc app=leetcode.cn id=187 lang=ruby
#
# [187] 重复的DNA序列
#

# @lc code=start
# @param {String} s
# @return {String[]}
def find_repeated_dna_sequences(s)
  result = []

  if s.length <= 10
    return result
  end

  set = Hash.new

  i = 0
  while i + 10 <= s.length
    cur = s.slice i, 10
    if set[cur] != nil
      if set[cur] == 1
        set[cur] += 1
        result = result.push cur
      end
    else
      set[cur] = 1
    end
    i += 1
  end

  return result
end

# @lc code=end
