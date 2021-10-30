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
    set = Hash.new()
    stack = [[0, 0]]
    while !stack.empty?
        cur = stack.pop
        set[cur] = true
        x, y = cur[0], cur[1]
        [
            [jug1_capacity, y],
            [x, jug2_capacity],
            [0, y],
            [x, 0],
            [[0, x - (jug2_capacity - y)].max, [x + y, jug2_capacity].min],
            [[x + y, jug1_capacity].min, [0, y - (jug1_capacity - x)].max],
        ].each{
            |v|
            if v[0] + v[1] == target_capacity
                return true
            end
            if set[v] == true
                next
            else
                stack.append v
            end
        }
    end
    return false
end
# @lc code=end

if __FILE__ == $0
    puts "#{can_measure_water(3, 5, 4)}"
    puts "#{can_measure_water(2, 6, 5)}"
    puts "#{can_measure_water(104639, 104651, 234)}"
    puts "#{can_measure_water(104659, 104677, 142424)}"
end
