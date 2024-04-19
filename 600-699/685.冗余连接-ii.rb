#
# @lc app=leetcode.cn id=685 lang=ruby
#
# [685] 冗余连接 II
#

# @lc code=start
# @param {Integer[][]} edges
# @return {Integer[]}
def find_redundant_directed_connection(edges)
    n = edges.length
    edges.reverse!
    for i in 0...n
        croot = n
        us = Array.new(n + 1){0}

        for j in 0...n
            if j == i
                next
            end
            f, t = edges[j][0], edges[j][1]
            if us[t] != 0 || root(us, f) == t
                break
            end
            us[t] = us[f] == 0 ? f : us[f]
            croot = croot - 1
        end

        if croot == 1
            return edges[i]
        end
    end
    puts "oops!"
end
def root(us, i)
    while us[i] != 0
        i = us[i]
    end
    return i
end
# @lc code=end

if __FILE__ == $0
    puts "#{find_redundant_directed_connection [[1,2],[1,3],[2,3]]}"
    puts "#{find_redundant_directed_connection [[1,2],[2,3],[3,4],[4,1],[1,5]]}"
end
