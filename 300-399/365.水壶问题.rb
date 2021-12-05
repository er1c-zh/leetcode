#
# @lc app=leetcode.cn id=365 lang=ruby
#
# [365] 水壶问题
#

# @lc code=start
# @param {Integer} jug1_capacity
# @param {Integer} jug2_capacity
# @param {Integer} target_capacity
# @return {Boolean}
def can_measure_water(jug1_capacity, jug2_capacity, target_capacity)
    if jug1_capacity + jug2_capacity < target_capacity
        return false
    end
    if jug1_capacity == 0 || jug2_capacity == 0
        return target_capacity == 0 || jug1_capacity + jug2_capacity == 0
    end
    return target_capacity % jug1_capacity.gcd(jug2_capacity) == 0
end
def can_measure_water_tle(jug1_capacity, jug2_capacity, target_capacity)
    set = Hash.new
    stack = [[0, 0]]
    while !stack.empty?
        cur = stack.pop
        if set["%d_%d" % [cur[0], cur[1]]] == true
            next
        end
        set["%d_%d" % [cur[0], cur[1]]] = true
        if cur[0] + cur[1] == target_capacity
            return true
        end
        x, y = cur[0], cur[1]
        stack.append [jug1_capacity, y]
        stack.append [x, jug2_capacity]
        stack.append [0, y]
        stack.append [x, 0]
        stack.append [emax(0, x - (jug2_capacity - y)), emin(x + y, jug2_capacity)]
        stack.append [emin(x + y, jug1_capacity), emax(0, y - (jug1_capacity - x))]
    end
    return false
end
def emin(v1, v2)
    if v1 > v2
        return v2
    else
        return v1
    end
end
def emax(v1, v2)
    if v1 > v2
        return v1
    else
        return v2
    end
end
# @lc code=end

if __FILE__ == $0
    puts "#{can_measure_water(3, 5, 4)}"
    puts "#{can_measure_water(2, 6, 5)}"
    puts "#{can_measure_water(104639, 104651, 234)}"
    puts "#{can_measure_water(104659, 104677, 142424)}"
end
