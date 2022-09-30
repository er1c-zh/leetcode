#
# @lc app=leetcode.cn id=417 lang=ruby
#
# [417] 太平洋大西洋水流问题
#

# @lc code=start
# @param {Integer[][]} heights
# @return {Integer[][]}
def pacific_atlantic(heights)
    act = [
        [1,0],
        [0,1],
        [-1,0],
        [0,-1],
    ]
    m, n = heights.length, heights[0].length
    dpp, dpa = Array.new(m){Array.new(n)}, Array.new(m){Array.new(n)}
    qp, qa = [], []
    heights[0].each_index{
        |j|
        i = 0
        if dpp[i][j] != nil
            next
        end
        qp.append [i,j]
        dpp[i][j] = true
    }
    heights[0].each_index{
        |j|
        i = m - 1
        if dpa[i][j] != nil
            next
        end
        qa.append [i, j]
        dpa[i][j] = true
    }
    heights.each_index{
        |i|
        j = 0
        if dpp[i][j] != nil
            next
        end
        qp.append [i,j]
        dpp[i][j] = true
    }
        
    heights.each_index{
        |i|
        j = n - 1
        if dpa[i][j] != nil
            next
        end
        qa.append [i, j]
        dpa[i][j] = true
    }
    if false
        dpp.each{
            |v|
            puts "#{v}"
        }
        puts "==="
        dpa.each{
            |v|
            puts "#{v}"
        }
    end
    while !qp.empty?
        cur = qp[0]
        qp = qp[1..-1]
        x, y = cur[0], cur[1]
        act.each{
            |d|
            dx, dy = d[0], d[1]
            nx, ny = x + dx, y + dy
            if nx < 0 || nx >= m || ny < 0 || ny >= n
                next
            end
            if dpp[nx][ny] != nil
                next
            end
            if heights[nx][ny] < heights[x][y]
                next
            end
            dpp[nx][ny] = true
            qp.append [nx, ny]
        }
    end
    while !qa.empty?
        cur = qa[0]
        qa = qa[1..-1]
        x, y = cur[0], cur[1]
        act.each{
            |d|
            dx, dy = d[0], d[1]
            nx, ny = x + dx, y + dy
            if nx < 0 || nx >= m || ny < 0 || ny >= n
                next
            end
            if dpa[nx][ny] != nil
                next
            end
            if heights[nx][ny] < heights[x][y]
                next
            end
            dpa[nx][ny] = true
            qa.append [nx, ny]
        }
    end
    if false
        puts "======"
        dpp.each{
            |v|
            puts "#{v}"
        }
        puts "==="
        dpa.each{
            |v|
            puts "#{v}"
        }
    end
    result = []
    heights.each_index{
        |i|
        heights[i].each_index{
            |j|
            if dpp[i][j] && dpa[i][j]
                result.append [i, j]
            end
        }
    }
    return result
end
# @lc code=end

if __FILE__ == $0
    puts "#{pacific_atlantic [[1,2,2,3,5],[3,2,3,4,4],[2,4,5,3,1],[6,7,1,4,5],[5,1,1,2,4]]}"
end
