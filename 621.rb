#
# @lc app=leetcode.cn id=621 lang=ruby
#
# [621] 任务调度器
#

# @lc code=start
# @param {Character[]} tasks
# @param {Integer} n
# @return {Integer}
def least_interval(tasks, n)
    m = Hash.new{0}
    for t in tasks
        m[t] += 1
    end
    q = Array.new()
    for t, cnt in m
        q.append([t, cnt])
    end
    q.sort!{
        |x, y|
        y[1] <=> x[1]
    }
    wq = Array.new(n + 1){nil}
    wqc = 0
    result = 0
    while wqc > 0 || q.size > 0
        item = wq[0]
        wq = wq.drop 1
        if item != nil
            q.append item
            q.sort!{
                |x, y|
                y[1] <=> x[1]
            }
            wqc -= 1
        end

        if q.size > 0
            item = q[0]
            q = q.drop 1
            item[1] -= 1
            if item[1] > 0
                wq.append item
                wqc += 1
            else
                wq.append nil
            end
        else
            wq.append nil
        end
        result += 1
    end
    return result
end
# @lc code=end

if __FILE__ == $0
    puts "#{least_interval ["A","A","A","B","B","B"], 2}"
    puts "#{least_interval ["A","A","A","B","B","B"], 0}"
    puts "#{least_interval ["A","A","A","A","A","A","B","C","D","E","F","G"], 2}"
end
