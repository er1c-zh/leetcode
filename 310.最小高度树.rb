#
# @lc app=leetcode.cn id=310 lang=ruby
#
# [310] 最小高度树
#

# @lc code=start
# @param {Integer} n
# @param {Integer[][]} edges
# @return {Integer[]}
def find_min_height_trees(n, edges)
    debug = false
    map, mask = Array.new(n){Array.new(n){0}}, Array.new(n){Array.new(n){0}}
    cnt = Array.new(n){0}
    queue = Array.new(n){Array.new}
    edges.each{
        |edge|
        x, y = edge[0], edge[1]
        map[x][y] = 1
        map[y][x] = 1
        queue[x].append y
        queue[y].append x
    }

    if debug
        map.each_index{
            |idx|
            puts "==#{map[idx]}"
        }
        puts "==="
    end

    result = []
    while true

        if debug
            puts "#{cnt}"
            puts "queue"
            queue.each_index{
                |idx|
                puts "=#{idx} -> #{queue[idx]}"
            }
            puts "===="
        end


        nq = Array.new(n){Array.new}
        queue.each_index{
            |from|
            queue[from].each{
                |to|
                cnt[from] += 1
                mask[from][to] = 1
                map[to].each_index{
                    |nextTo|
                    if map[to][nextTo] == 0
                        next
                    end
                    if from == nextTo
                        next
                    end
                    if mask[from][nextTo] == 1
                        next
                    end
                    nq[from].append nextTo
                }
            }
            if cnt[from] >= n - 1
                result.append from
            end
        }
        if !result.empty?
            if debug
                puts "before return"
                puts "#{cnt}"
            end
            return result
        end
        queue = nq
    end
end
# @lc code=end

if __FILE__ == $0
    # p find_min_height_trees(6, [[3,0],[3,1],[3,2],[3,4],[5,4]])
    # p find_min_height_trees(1, [])
    # p find_min_height_trees(2, [[0, 1]])
    p find_min_height_trees(7, [[0,1],[1,2],[1,3],[2,4],[3,5],[4,6]])
    # p find_min_height_trees()
end
