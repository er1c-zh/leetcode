#
# @lc app=leetcode.cn id=406 lang=ruby
#
# [406] 根据身高重建队列
#

# @lc code=start
# @param {Integer[][]} people
# @return {Integer[][]}
def reconstruct_queue(people)
    people.sort!{
        |x, y|
        if x[0] == y[0]
            x[1] <=> y[1]
        else
            x[0] <=> y[0]
        end
    }
    m = Array.new
    pre = nil
    people.each{
        |p|
        if pre == nil || pre[0] != p[0]
            m.append [p]
            pre = p
        else
            m[-1].append p
        end
    }

    idx_list = Array.new(m.length){0}
    
    if false
        m.each_index{
            |i|
            puts "#{m[i]}"
        }
    end

    result = []
    while result.length < people.length
        # 本轮小于的插入的数量
        total = 0
        m.each_index{
            |i|
            if idx_list[i] < m[i].length
                if result.length - total == m[i][idx_list[i]][1]
                    result.append m[i][idx_list[i]]
                    idx_list[i] += 1
                    break
                elsif result.length - total > m[i][idx_list[i]][1]
                    puts "fu*k the case"
                    return []
                end
            end
            total += idx_list[i]
        }
    end
    return result
end
# @lc code=end

if __FILE__ == $0
    puts "#{reconstruct_queue [[7,0],[4,4],[7,1],[5,0],[6,1],[5,2]]}"
    # puts "#{reconstruct_queue }"
end
