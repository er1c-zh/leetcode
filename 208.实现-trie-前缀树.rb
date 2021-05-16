#
# @lc app=leetcode.cn id=208 lang=ruby
#
# [208] 实现 Trie (前缀树)
#

# @lc code=start
class ENode
  def initialize()
    @val = ""
    @children = Hash.new
    @isReal = false
  end

  attr_accessor :val, :children, :isReal
end

class Trie

=begin
    Initialize your data structure here.
=end
  def initialize()
    @children = Hash.new
  end

=begin
    Inserts a word into the trie.
    :type word: String
    :rtype: Void
=end
  def insert(word)
    cur = nil
    nextMap = @children
    idx = 0

    while true
      if cur == nil
        # find cur
        # word.length >= 1
        c = word[idx]
        child = nextMap[c]
        if child == nil
          # insert to cur.children
          child = ENode.new
          child.val = word.slice(idx, (word.length - idx))
          child.isReal = true
          nextMap[c] = child
          break
        else
          cur = child
        end
      end
      delta = 0
      while delta < cur.val.length && idx + delta < word.length
        if cur.val[delta] != word[idx + delta]
          break
        end
        delta += 1
      end
      if delta == cur.val.length
        if idx + delta == word.length
          # match
          cur.isReal = true
          return
        else
          # next loop
          nextMap = cur.children
          cur = nil
          idx += delta
        end
      else
        # create new node and append cur as child
        # maybe another child for suffix of word
        parent = ENode.new
        parent.val = cur.val.slice(0, delta)
        cur.val = cur.val.slice(delta, (cur.val.length - delta))
        parent.children[cur.val[0]] = cur
        nextMap[parent.val[0]] = parent
        if idx + delta == word.length
          parent.isReal = true
        else
          child = ENode.new
          child.val = word.slice(idx + delta, word.length - idx - delta)
          child.isReal = true
          parent.children[child.val[0]] = child
        end
        return
      end
    end
  end

=begin
    Returns if the word is in the trie.
    :type word: String
    :rtype: Boolean
=end
  def search(word)
    cur = nil
    nextMap = @children
    idx = 0
    while true
      if cur == nil
        cur = nextMap[word[idx]]
        if cur == nil
          return false
        end
      end

      delta = 0
      while delta < cur.val.length && delta + idx < word.length
        if cur.val[delta] != word[delta + idx]
          return false
        end
        delta += 1
      end

      if delta + idx == word.length && delta == cur.val.length && cur.isReal
        return true
      elsif delta < cur.val.length
        return false
      end

      nextMap = cur.children
      cur = nil
      idx += delta
    end
    return false
  end

=begin
    Returns if there is any word in the trie that starts with the given prefix.
    :type prefix: String
    :rtype: Boolean
=end
  def starts_with(prefix)
    cur = nil
    nextMap = @children
    idx = 0
    while true
      if cur == nil
        cur = nextMap[prefix[idx]]
        if cur == nil
          return false
        end
      end
      delta = 0
      while delta < cur.val.length && delta + idx < prefix.length
        if cur.val[delta] != prefix[delta + idx]
          return false
        end
        delta += 1
      end
      if delta + idx == prefix.length
        return true
      end
      nextMap = cur.children
      cur = nil
      idx += delta
    end
    return false
  end

  def startsWith(prefix)
    return starts_with(prefix)
  end

  attr_accessor :children
end

# Your Trie object will be instantiated and called as such:
# obj = Trie.new()
# obj.insert(word)
# param_2 = obj.search(word)
# param_3 = obj.starts_with(prefix)
# @lc code=end

if __FILE__ == $0
  obj = Trie.new()
  obj.insert("apple")
  p "#{obj.search("apple")}"
  p "#{obj.search("app")}"
  p "#{obj.starts_with("app")}"
  obj.insert("app")
  p "#{obj.search("app")}"
end
