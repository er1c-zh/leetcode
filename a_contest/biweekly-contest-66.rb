# 1
# @param {String[]} words1
# @param {String[]} words2
# @return {Integer}
def count_words(words1, words2)
    set1, set2 = Hash.new{0}, Hash.new{0}
    words1.each{
        |s|
        set1[s] += 1
    }
    words2.each{
        |s|
        set2[s] += 1
    }
    result = []
    set1.keys.each{
        |k|
        if set1[k] == 1 && set2[k] == 1
            result.append k
        end
    }
    return result.length
end

# 2
# @param {String} street
# @return {Integer}
def minimum_buckets(street)
    result = 0
    (0..street.length-1).each{
        |i|
        cur = street[i]
        if cur == "."
            next
        elsif cur == "H"
            if i > 0 && street[i - 1] == "B"
                # 左边已经有了
                next
            elsif i + 1 == street.length || street[i + 1] == "H"
                # 一定要放左边
                if i == 0 || street[i - 1] == "H"
                    # 左边没位置
                    return -1
                end
                street[i - 1] = "B"
                result += 1
                next
            else
                # 贪心放右边
                street[i + 1] = "B"
                result += 1
            end
        end
    }
    return result
end

# 3
# @param {Integer[]} start_pos
# @param {Integer[]} home_pos
# @param {Integer[]} row_costs
# @param {Integer[]} col_costs
# @return {Integer}
def min_cost(start_pos, home_pos, row_costs, col_costs)
    result = 0
    if start_pos[0] != home_pos[0]
        d = start_pos[0] > home_pos[0] ? -1 : 1
        while start_pos[0] != home_pos[0]
            result += row_costs[start_pos[0] + d]
            start_pos[0] += d
        end
    end
    if start_pos[1] != home_pos[1]
        d = start_pos[1] > home_pos[1] ? -1 : 1
        while start_pos[1] != home_pos[1]
            result += col_costs[start_pos[1] + d]
            start_pos[1] += d
        end
    end

    return result
end

# 4
# @param {Integer[][]} grid
# @return {Integer}
def count_pyramids(grid)
    return helper4(grid) + helper4(grid.reverse)
end
def helper4(grid)
    m, n = grid.length, grid[0].length
    dp = Array.new(m){Array.new(n){0}} # dp[i][j] (i, j)的倒金字塔深度
    grid.each_index{
        |i|
        grid[i].each_index{
            |j|
            if grid[i][j] == 0
                dp[i][j] = 0
                next
            end
            dp[i][j] = 1
            if i > 0 && j > 0 && j < n - 1
                dp[i][j] += [dp[i - 1][j - 1], dp[i - 1][j], dp[i - 1][j + 1]].min
            end
        }
    }

    result = 0
    dp.each_index{
        |i|
        dp[i].each_index{
            |j|
            if dp[i][j] > 0
                result += dp[i][j] - 1
            end
        }
    }

    return result
end

if __FILE__ == $0
    puts "#{count_pyramids [[0,1,1,0],[1,1,1,1]]}"
end