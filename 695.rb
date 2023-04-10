#
# @lc app=leetcode.cn id=695 lang=ruby
#
# [695] 岛屿的最大面积
#

# @lc code=start
# @param {Integer[][]} grid
# @return {Integer}
def max_area_of_island(grid)
    m, n = grid.size, grid[0].size
    result = 0
    for i in 0...m
        for j in 0...n
            if grid[i][j] != 1
                next
            end
            q = [[i, j]]
            grid[i][j] = -1
            tr = 1
            while q.size > 0
                nq = []
                q.each{
                    |a|
                    x, y = a[0], a[1]
                    [[1, 0], [0, 1], [-1, 0], [0, -1]].each{
                        |d|
                        nx, ny = x + d[0], y + d[1]
                        if nx < 0 || nx >= m || ny < 0 || ny >= n || grid[nx][ny] != 1
                            next
                        end
                        grid[nx][ny] = -1
                        tr += 1
                        nq = nq.append [nx, ny]
                    }
                }
                q = nq
            end
            if tr > result
                result = tr
            end
        end
    end
    return result
end
# @lc code=end

if __FILE__ == $0
    puts "#{max_area_of_island [[0,0,1,0,0,0,0,1,0,0,0,0,0],[0,0,0,0,0,0,0,1,1,1,0,0,0],[0,1,1,0,1,0,0,0,0,0,0,0,0],[0,1,0,0,1,1,0,0,1,0,1,0,0],[0,1,0,0,1,1,0,0,1,1,1,0,0],[0,0,0,0,0,0,0,0,0,0,1,0,0],[0,0,0,0,0,0,0,1,1,1,0,0,0],[0,0,0,0,0,0,0,1,1,0,0,0,0]]}"
end
