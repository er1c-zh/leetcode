#
# @lc app=leetcode.cn id=593 lang=ruby
#
# [593] 有效的正方形
#

# @lc code=start
# @param {Integer[]} p1
# @param {Integer[]} p2
# @param {Integer[]} p3
# @param {Integer[]} p4
# @return {Boolean}
def valid_square(p1, p2, p3, p4)
    d12 = distance_squre p1, p2
    d13 = distance_squre p1, p3
    d14 = distance_squre p1, p4
    if d12 != d13 && d12 != d14 && d13 != d14
        return false
    end
    if d12 == d13 && d12 == d14 && d13 == d14
        return false
    end
    if d12 == 0 || d13 == 0 || d14 == 0
        return false
    end

    # p1 对角 p3
    if d12 == d13
        p3, p4 = p4, p3
    elsif d12 == d14
    else
        p2, p3 = p3, p2
    end

    d12 = distance_squre p1, p2
    d13 = distance_squre p1, p3
    d14 = distance_squre p1, p4
    if d13 < d12
        return false
    end

    d32 = distance_squre p3, p2
    d34 = distance_squre p3, p4
    d24 = distance_squre p2, p4

    if d24 != d13
        return false
    end

    if d12 != d14 || d12 != d32 || d12 != d32 || d32 != d34
        return false
    end

    return true
end

def distance_squre(p1, p2)
    return (p1[0] - p2[0]) ** 2 + (p1[1] - p2[1]) ** 2
end
# @lc code=end

if __FILE__ == $0
    puts "#{valid_square [0, 0], [1, 1], [1, 0], [0, 1]}"
    puts "#{valid_square [0, 0], [1, 1], [1, 0], [0, 12]}"
    puts "#{valid_square [1, 0], [-1, 1], [0, 1], [0, -1]}"
    puts "#{valid_square [1, 1], [0, 1], [1, 2], [0, 0]}"
end
