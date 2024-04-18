#
# @lc app=leetcode.cn id=699 lang=ruby
#
# [699] 掉落的方块
#

# @lc code=start
# @param {Integer[][]} positions
# @return {Integer[]}
def falling_squares(positions)
    n = positions.length
    i = 0
    result = []
    while i < n
        base = 0
        j = 0
        _s = positions[i]
        _x, _y, _z = _s[0], _s[0] + _s[1], _s[1]
        new_z = _z
        cur_max = new_z
        while j < i
            s = positions[j]
            j += 1
            x, y, z = s[0], s[1], s[2]
            if z > cur_max
                cur_max = z
            end
            if x >= _y || y <= _x
                next
            end
            if z + _z > new_z
                new_z = z + _z
            end
        end
        result = result.append [new_z, cur_max].max
        positions[i] = [_x, _y, new_z]
        i += 1
    end
    return result
end
# @lc code=end

if __FILE__ == $0
    puts "#{falling_squares [[1,2],[2,3],[6,1]]}"
    puts "#{falling_squares [[100,100],[200,100]]}"
end
