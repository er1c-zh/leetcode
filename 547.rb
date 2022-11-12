#
# @lc app=leetcode.cn id=547 lang=ruby
#
# [547] 省份数量
#

# @lc code=start
# @param {Integer[][]} is_connected
# @return {Integer}
def find_circle_num(is_connected)
    result = 0
    n = is_connected.size
    mask = Array.new(n){0}
    for i in 0...n
        if mask[i] != 0
            next
        end
        result += 1
        q = [i]
        while q.size > 0
            nq = []
            q.each {
                |f|
                for t in 0...n
                    if f == t
                        next
                    end
                    if is_connected[f][t] == 0
                        next
                    end
                    if mask[t] != 0
                        next
                    end
                    nq.append t
                    mask[t] = result
                end
            }
            q = nq
        end
    end
    return result
end
# @lc code=end

