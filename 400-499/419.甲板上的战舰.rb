#
# @lc app=leetcode.cn id=419 lang=ruby
#
# [419] 甲板上的战舰
#

# @lc code=start
# @param {Character[][]} board
# @return {Integer}
def count_battleships(board)
    m, n = board.length, board[0].length
    result = 0
    board.each_index{
        |i|
        board[i].each_index{
            |j|
            if board[i][j] == "."
                next
            end
            found = false
            [[-1, 0], [0, -1]].each{
                |d|
                di, dj = d[0], d[1]
                ni, nj = i + di, j + dj
                if ni < 0 || ni >= m || nj < 0 || nj >= n
                    next
                end
                if board[ni][nj] == "X"
                    found = true
                end
            }
            if !found
                result += 1
            end
        }
    }
    return result
end
# @lc code=end

