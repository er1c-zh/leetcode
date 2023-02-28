#
# @lc app=leetcode.cn id=517 lang=ruby
#
# [517] 超级洗衣机
#

# @lc code=start
# @param {Integer[]} machines
# @return {Integer}
def find_min_moves(machines)
    n = machines.size
    sum = machines.sum
    if sum % n != 0
        return -1
    end
    target = sum / n

    result = 0
    cost = 0
    for i in 0...n
        cost += machines[i] - target
        c = machines[i] - target
        result = [result, c, cost.abs].max
    end
    return result
end

# @lc code=end

if __FILE__ == $0
    puts "#{find_min_moves [4,0,0,4]}"
    puts "#{find_min_moves [1,0,5]}"
    puts "#{find_min_moves [0,3,0]}"
    puts "#{find_min_moves [0,2,0]}"
end
