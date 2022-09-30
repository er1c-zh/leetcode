#
# @lc app=leetcode.cn id=407 lang=ruby
#
# [407] 接雨水 II
#

# @lc code=start
# @param {Integer[][]} height_map
# @return {Integer}
def trap_rain_water(height_map)
    debug = true
    m, n = height_map.length, height_map[0].length
    h = Heap.new(){
        |x, y|
        if x[0] == y[0]
            if x[1][0] == y[1][0]
                (x[1][1] <=> y[1][1]) == -1
            else
                (x[1][0] <=> y[1][0]) == -1
            end
        else
            (x[0] <=> y[0]) == -1
        end
    }

    set = Array.new(m){Array.new(n){0}}

    [0,m - 1].each{
        |i|
        (0..n - 1).each{
            |j|
            if set[i][j] != 0
                next
            end
            set[i][j] = 1
            h.push [height_map[i][j], [i, j]]
        }
    }
    [0, n - 1].each{
        |j|
        (0..m - 1).each{
            |i|
            if set[i][j] != 0
                next
            end
            set[i][j] = 1
            h.push [height_map[i][j], [i, j]]
        }
    }
    act = [
        [1, 0],
        [0, 1],
        [-1, 0],
        [0, -1],
    ]
    result = 0
    while !h.empty?
        cur = h.pop
        l, x, y = cur[0], cur[1][0], cur[1][1]
        act.each{
            |d|
            dx, dy = d[0], d[1]
            nx, ny = x + dx, y + dy
            if nx < 0 || nx >= m || ny < 0 || ny >= n
                next
            end
            if set[nx][ny] == 1
                next
            end
            set[nx][ny] = 1
            if l > height_map[nx][ny]
                # puts "#{l} - #{height_map[nx][ny]} (#{nx}, #{ny})"
                result += l - height_map[nx][ny]
            end
            nl = [l, height_map[nx][ny]].max
            h.push [nl, [nx, ny]]
        }
    end
    return result
end
# @lc code=end

if __FILE__ == $0
    puts "#{trap_rain_water [[1,4,3,1,3,2],[3,2,1,3,2,4],[2,3,3,2,3,1]]}"
    puts "#{trap_rain_water [[3,3,3,3,3],[3,2,2,2,3],[3,2,1,2,3],[3,2,2,2,3],[3,3,3,3,3]]}"
    puts "#{trap_rain_water [[12,13,1,12],[13,4,13,12],[13,8,10,12],[12,13,12,12],[13,13,13,13]]}"
    puts "#{trap_rain_water [[78,16,94,36],[87,93,50,22],[63,28,91,60],[64,27,41,27],[73,37,12,69],[68,30,83,31],[63,24,68,36]]}"
    puts "#{trap_rain_water [[14,20,11,19,19,16],[11,10,7,4,9,6],[17,2,2,6,10,9],[15,9,2,1,4,1],[15,5,5,5,8,7],[14,2,8,6,10,7]]}"
end
