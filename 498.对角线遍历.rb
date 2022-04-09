#
# @lc app=leetcode.cn id=498 lang=ruby
#
# [498] 对角线遍历
#

# @lc code=start
# @param {Integer[][]} mat
# @return {Integer[]}
def find_diagonal_order(mat)
    # 0,0_0,1_1,0
    x, y = 0, 0
    direct = 0 # 右上
    dx, dy = -1, 1
    lx, ly = mat.length, mat[0].length
    result = []
    while x != lx - 1 || y != ly - 1
        result.append mat[x][y]
        nx, ny = x + dx, y + dy
        if nx < 0 || nx >= lx || ny < 0 || ny >= ly
            if direct == 0
                nx += 1
                if nx < 0 || nx >= lx || ny < 0 || ny >= ly
                    nx += 1
                    ny -= 1
                end
                direct = 1
                dx, dy = 1, -1
            else
                ny += 1
                if nx < 0 || nx >= lx || ny < 0 || ny >= ly
                    nx -= 1
                    ny += 1
                end
                direct = 0
                dx, dy = -1, 1
            end
        end
        x, y = nx, ny
    end
    result.append mat[x][y]
    return result
end
# @lc code=end

if __FILE__ == $0
    puts "#{find_diagonal_order([[1,2,3],[4,5,6],[7,8,9]])}"
end
