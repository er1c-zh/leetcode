#
# @lc app=leetcode.cn id=688 lang=ruby
#
# [688] 骑士在棋盘上的概率
#

# @lc code=start
# @param {Integer} n
# @param {Integer} k
# @param {Integer} row
# @param {Integer} column
# @return {Float}
def knight_probability(n, k, row, column)
    dp = Array.new(k+1){Array.new(n){Array.new(n){-1}}}
    for x in 0...n
        for y in 0...n
            dp[0][x][y] = 1.0
        end
    end
    for s in 1..k
        for x in 0...n
            for y in 0...n
                r = 0.0
                for delta in action
                    dx, dy = delta[0], delta[1]
                    nx, ny = x + dx, y + dy
                    if nx < 0 || nx >= n || ny < 0 || ny >= n
                        next
                    end
                    r += dp[s - 1][nx][ny]
                end
                dp[s][x][y] = r / 8.0
            end
        end
    end
    return dp[k][row][column]
end

def action()
    return [
        [-1, -2],
        [-2, -1],
        [1, -2],
        [2, -1],
        [2, 1],
        [1, 2],
        [-1, 2],
        [-2, 1],
    ]
end
# @lc code=end

if __FILE__ == $0
    puts "#{knight_probability 25, 100, 0, 0}"
end
