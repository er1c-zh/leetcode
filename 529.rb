#
# @lc app=leetcode.cn id=529 lang=ruby
#
# [529] 扫雷游戏
#

# @lc code=start
# @param {Character[][]} board
# @param {Integer[]} click
# @return {Character[][]}
def update_board(board, click)
    m, n = board.size, board[0].size

    r, c = click[0], click[1]

    if board[r][c] == 'M'
        board[r][c] = 'X'
    elsif board[r][c] == 'B'
        return board
    elsif board[r][c] >= '1' && board[r][c] <= '8'
        return board
    else
        cnt = 0
        [
            [-1, -1],
            [-1, 0],
            [-1, 1],
            [0, -1],
            [0, 1],
            [1, -1],
            [1, 0],
            [1, 1],
        ].each {
            |d|
            dr, dc = d[0], d[1]
            nr, nc = r + dr, c + dc
            if nr >= 0 && nr < m && nc >=0 && nc < n
                if board[nr][nc] == 'M'
                    cnt += 1
                end
            end
        }
        if cnt > 0
            board[r][c] = (cnt + '0'.ord).chr
        else
            board[r][c] = 'B'
            [
                [-1, -1],
                [-1, 0],
                [-1, 1],
                [0, -1],
                [0, 1],
                [1, -1],
                [1, 0],
                [1, 1],
            ].each {
                |d|
                dr, dc = d[0], d[1]
                nr, nc = r + dr, c + dc
                if nr >= 0 && nr < m && nc >=0 && nc < n
                    board = update_board(board, [nr, nc])
                end
            }
        end
    end

    return board
end
# @lc code=end

if __FILE__ == $0
    puts "#{update_board [["E","E","E","E","E"],["E","E","M","E","E"],["E","E","E","E","E"],["E","E","E","E","E"]], [3, 0]}"
end
