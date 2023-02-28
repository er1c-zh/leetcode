#
# @lc app=leetcode.cn id=554 lang=ruby
#
# [554] 砖墙
#

# @lc code=start
# @param {Integer[][]} wall
# @return {Integer}
def least_bricks(wall)
    n = wall[0].sum
    m = Hash.new{0}
    wall.each{
        |r|
        cur = 0
        r.each{
            |w|
            cur += w
            if cur < n
                m[cur] = m[cur] + 1
            end
        }
    }

    r = 0
    for k, v in m
        if v > r
            r = v
        end
    end
    return wall.size - r
end
# @lc code=end

if __FILE__ == $0
    puts "#{least_bricks [[100000000],[100000000],[100000000]] }"
end
