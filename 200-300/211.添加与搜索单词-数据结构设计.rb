#
# @lc app=leetcode.cn id=211 lang=ruby
#
# [211] 添加与搜索单词 - 数据结构设计
#

# @lc code=start
class WordDictionary

=begin
    Initialize your data structure here.
=end
  def initialize()
    @setList = Array.new(501) {
      Hash.new {
        |hash, key|
        hash[key] = Hash.new
      }
    }
    @lenSet = Array.new(501) {
      Hash.new
    }
  end

=begin
    :type word: String
    :rtype: Void
=end
  def add_word(word)
    i = 0
    @lenSet[word.length][word] = true
    while i < word.length
      @setList[i][word[i]][word] = true
      @setList[i]["."][word] = true
      i += 1
    end
  end

=begin
    :type word: String
    :rtype: Boolean
=end
  def search(word)
    i = 0
    first = true
    cur = @lenSet[word.length]
    while i < word.length
      cur = inter cur, @setList[i][word[i]]
      if cur == nil || cur.size == 0
        return false
      end
      i += 1
    end
    return cur.size > 0
  end

  def inter(a, b)
    result = Hash.new
    if a == nil || b == nil
      return result
    end
    for k in a.keys
      if b[k] == true
        result[k] = true
      end
    end
    return result
  end
end

# Your WordDictionary object will be instantiated and called as such:
# obj = WordDictionary.new()
# obj.add_word(word)
# param_2 = obj.search(word)
# @lc code=end
