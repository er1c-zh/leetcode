#
# @lc app=leetcode.cn id=542 lang=ruby
#
# [542] 01 矩阵
#

# @lc code=start
# @param {Integer[][]} mat
# @return {Integer[][]}
def update_matrix(mat)
    m, n = mat.size, mat[0].size
    result = Array.new(m){Array.new(n){1e10}}
    queue = []

    for i in 0...m
        for j in 0...n
            if mat[i][j] == 0
                queue.append [i, j]
                result[i][j] = 0
            end
        end
    end
    while queue.size > 0
        nq = []

        queue.each{
            |i|
            x, y = i[0], i[1]
            [
                [1, 0],
                [0, -1],
                [0, 1],
                [-1, 0],
            ].each{
                |d|
                dx, dy = d[0], d[1]
                nx, ny = x + dx, y + dy
                if nx < 0 || nx >= m || ny < 0 || ny >= n
                    next
                end
                if result[nx][ny] <= result[x][y] + 1
                    next
                end
                result[nx][ny] = result[x][y] + 1
                nq.append [nx, ny]
            }
        }

        queue = nq
    end
    return result
end
# @lc code=end

if __FILE__ == $0
    # puts "#{update_matrix [[0,0,0],[0,1,0],[0,0,0]] }"
    puts "#{update_matrix [[0,0,0],[0,1,0],[1,1,1]] }"
end
