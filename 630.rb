#
# @lc app=leetcode.cn id=630 lang=ruby
#
# [630] 课程表 III
#

# @lc code=start
# @param {Integer[][]} courses
# @return {Integer}
def schedule_course(courses)
    courses.sort!{
        |x, y|
        if x[1] == y[1]
            x[0] <=> y[0]
        else
            x[1] <=> y[1]
        end
    }
    h = MaxHeap.new
    result = 0
    cur = 0
    for c in courses
        if c[0] + cur > c[1]
            if h.empty? || h.next <= c[0]
                next
            end
            cur -= h.pop
            result -= 1
        end
        result += 1
        cur += c[0]
        h.push c[0]
    end

    return result
end
# @lc code=end

if __FILE__ == $0
    puts "#{schedule_course [[100, 200], [200, 1300], [1000, 1250], [2000, 3200]]}"
    puts "#{schedule_course [[1, 2]]}"
    puts "#{schedule_course [[3,2], [4,3]]}"
end
