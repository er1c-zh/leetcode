#
# @lc app=leetcode.cn id=289 lang=ruby
#
# [289] 生命游戏
#

# @lc code=start
# @param {Integer[][]} board
# @return {Void} Do not return anything, modify board in-place instead.
def game_of_life(board)
    lx = board.length
    ly = board[0].length

    # puts "#{lx}, #{ly}"

    # p board

    board.each_index{
        |x|
        board[x].each_index{
            |y|
            live, dead = 0, 0
            [
                [1, -1],
                [1, 0],
                [1, 1],
                [0, -1],
                [0, 1],
                [-1, -1],
                [-1, 0],
                [-1, 1],
            ].each{
                |d|
                dx, dy = d[0], d[1]
                _x, _y = x + dx, y + dy
                if _x < 0 || _x >= lx || _y < 0 || _y >= ly
                    next
                end
                # puts "#{_x}, #{_y}"
                if board[_x][_y] & 0b01 == 0
                    dead += 1
                else
                    live += 1
                end
            }
            if board[x][y] & 0b01 == 0
                if live == 3
                    # fuhuo
                    board[x][y] |= 0b10
                else
                    board[x][y] |= 0b00
                end
            else
                if live < 2 || live > 3
                    # die
                    board[x][y] |= 0b00
                else
                    # still alive
                    board[x][y] |= 0b10
                end
            end
        }
    }

    # p board

    board.each_index{
        |x|
        board[x].each_index{
            |y|
            board[x][y] = board[x][y] >> 1
        }
    }
end
# @lc code=end

if __FILE__ == $0
    game_of_life [[0,1,0],[0,0,1],[1,1,1],[0,0,0]]
end
