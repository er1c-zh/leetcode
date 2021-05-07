#
# @lc app=leetcode.cn id=174 lang=ruby
#
# [174] 地下城游戏
#

# @lc code=start
# @param {Integer[][]} dungeon
# @return {Integer}
def calculate_minimum_hp(dungeon)
  x = dungeon.length
  if x == 0
    return 0
  end
  y = dungeon[0].length

  dp = Array.new(x) { Array.new(y) } # dp[0][0] is result

  dp[x - 1][y - 1] = [dungeon[x - 1][y - 1], 0].min

  i, j = x - 1, y - 2

  while i >= 0
    while j >= 0
      goRight = 0
      goDown = 0

      cur = dungeon[i][j]
      result1 = false
      r1 = 0
      result2 = false
      r2 = 0

      if j + 1 < y
        # go right
        # puts "go right #{cur} + #{dp[i][j + 1]}"
        r1 = cur + dp[i][j + 1]
        result1 = true
        # puts "result1 #{result1}"
      end
      if i + 1 < x
        # go down
        # puts "go down #{cur} + #{dp[i + 1][j]}"
        r2 = cur + dp[i + 1][j]
        result2 = true
      end
      if !result1
        dp[i][j] = r2
      elsif !result2
        dp[i][j] = r1
      else
        dp[i][j] = r1 > r2 ? r1 : r2
      end

      #   puts "(#{x}, #{y}) (#{i}, #{j}) #{result1}, #{result2}"
      if dp[i][j] > 0
        dp[i][j] = 0
      end

      j -= 1
    end
    i -= 1
    j = y - 1
  end

  # puts "#{dp}"

  return [-dp[0][0] + 1, 1].max
end

# @lc code=end
