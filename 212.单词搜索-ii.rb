#
# @lc app=leetcode.cn id=212 lang=ruby
#
# [212] 单词搜索 II
#

# @lc code=start
# @param {Character[][]} board
# @param {String[]} words
# @return {String[]}
def find_words(board, words)
  item = Helper.new board
  result = Array.new
  for word in words
    if item.do(word)
      result = result.append(word)
    end
  end
  return result
end

class Helper
  def initialize(board)
    @x = board.length
    @y = board[0].length
    @board = board
    @set = Hash.new
    @badCase = Hash.new

    @charCnt = Hash.new { 0 }
    for l in board
      for item in l
        @charCnt[item] = @charCnt[item] + 1
      end
    end
  end

  def do(word)
    if @set[word] == true
      return true
    end
    cntMap = Hash.new { 0 }
    for i in 0...word.length
      c = word[i]
      cntMap[c] += 1
      if cntMap[c] > @charCnt[c]
        return false
      end
    end

    for i in 0...word.length
      if @badCase[word.slice(0, i + 1)] == true
        return false
      end
    end

    mask = Array.new(@x) { Array.new(@y) { 0 } }
    for i in 0...@x
      for j in 0...@y
        if @board[i][j] == word[0]
          mask[i][j] = 1
          if helper(i, j, mask, word, 1)
            return true
          end
          mask[i][j] = 0
        end
      end
    end
    for i in 0...word.length
      if @set[word.slice(0, i + 1)] != true
        @badCase[word.slice(0, i + 1)] = true
      end
    end
    return false
  end

  def helper(x, y, mask, word, n)
    @set[word.slice(0, n)] = true
    if n == word.length
      return true
    end
    delta = [[1, 0], [-1, 0], [0, 1], [0, -1]]
    for d in delta
      dx = d[0]
      dy = d[1]
      _x = dx + x
      _y = dy + y
      if _x < 0 || _x >= @x || _y < 0 || _y >= @y
        next
      end
      if @board[_x][_y] != word[n]
        next
      end
      if mask[_x][_y] == 1
        next
      end
      mask[_x][_y] = 1
      if helper(_x, _y, mask, word, n + 1)
        return true
      end
      mask[_x][_y] = 0
    end
    return false
  end
end

# @lc code=end
