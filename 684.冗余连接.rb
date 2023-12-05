#
# @lc app=leetcode.cn id=684 lang=ruby
#
# [684] 冗余连接
#

# @lc code=start
# @param {Integer[][]} edges
# @return {Integer[]}
def find_redundant_connection(edges)
    n = edges.length
    m = Array.new(n + 1){0}
    for i in 0...n+1
        m[i] = i
    end

    for po in edges
        x, y = po[0], po[1]
        if m[x] == m[y]
            return po
        end
        old_set = m[y]
        for i in 0...n+1
            if m[i] == old_set
                m[i] = m[x]
            end
        end
    end
    puts "oops!"
end
# @lc code=end

if __FILE__ == $0
    puts "#{find_redundant_connection [[1,2], [1,3], [2,3]]}"
    puts "#{find_redundant_connection [[1,2], [2,3], [3,4], [1,4], [1,5]]}"
    puts "#{find_redundant_connection [[3,7],[1,4],[2,8],[1,6],[7,9],[6,10],[1,7],[2,3],[8,9],[5,9]]}"
end
