#
# @lc app=leetcode.cn id=576 lang=ruby
#
# [576] 出界的路径数
#

# @lc code=start
# @param {Integer} m
# @param {Integer} n
# @param {Integer} max_move
# @param {Integer} start_row
# @param {Integer} start_column
# @return {Integer}
def find_paths(m, n, max_move, start_row, start_column)
    dp = Array.new(max_move + 1){Array.new(m){Array.new(n){0}}} # dp[times][x][y] 结果

    for i in 1...(max_move + 1)
        for x in 0...m
            for y in 0...n
                if i == 1
                    if x == 0
                        dp[i][x][y] += 1
                    end
                    if x == m - 1
                        dp[i][x][y] += 1
                    end
                    if y == 0 
                        dp[i][x][y] += 1
                    end
                    if y == n - 1
                        dp[i][x][y] += 1
                    end
                end
                [
                    [0, 1],
                    [0, -1],
                    [1, 0],
                    [-1, 0],
                ].each {
                    |d|
                    dx, dy = d[0], d[1]
                    nx, ny = x + dx, y + dy
                    if nx < 0 || nx >= m || ny < 0 || ny >= n
                        next
                    end
                    dp[i][x][y] += dp[i - 1][nx][ny]
                }
                dp[i][x][y] = dp[i][x][y] % (1e9 + 7)
            end
        end
    end
    
    # (a % k + b % k) % k == (a + b) % k ?
    i = 0
    result = 0
    while i <= max_move
        result += dp[i][start_row][start_column]
        result = result % (1e9 + 7)
        i += 1
    end
    return result.to_i
end
# @lc code=end

if __FILE__ == $0
    puts "#{find_paths 2, 2, 2, 0, 0}"
    puts "#{find_paths 1, 3, 3, 0, 1}"
end
