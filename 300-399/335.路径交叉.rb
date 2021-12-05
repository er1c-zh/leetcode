#
# @lc app=leetcode.cn id=335 lang=ruby
#
# [335] 路径交叉
#

# @lc code=start
# @param {Integer[]} distance
# @return {Boolean}
def is_self_crossing(distance)
    d = nil
    dis = distance
    if distance.length < 3
        return false
    end
    i = 3
    # outer
    while i < distance.length
        if dis[i] >= dis[i - 2] && dis[i - 1] <= dis[i - 3]
            return true
        elsif (i - 4 < 0 && dis[i] == dis[i - 2]) || (i - 4 >= 0 && dis[i] >= dis[i - 2] - dis[i - 4] && dis[i] <= dis[i - 2])
            d = dis[i - 1] - dis[i - 3]
            break
        elsif dis[i] <= dis[i - 2]
            break
        else
            i += 1
        end
    end
    i += 1
    while i < distance.length
        if d != nil
            if dis[i] >= d
                return true
            end
            d = nil
        end
        if dis[i] >= dis[i - 2]
            return true
        end
        i += 1
    end
    return false
end
# @lc code=end

if __FILE__ == $0
    p is_self_crossing([2,1,1,2])
    p is_self_crossing([1,2,3,4])
    p is_self_crossing([1,1,1,1])
    p is_self_crossing([1,1,2,2,1,1])
    #p is_self_crossing()
end
