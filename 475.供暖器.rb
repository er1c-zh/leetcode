#
# @lc app=leetcode.cn id=475 lang=ruby
#
# [475] 供暖器
#

# @lc code=start
# @param {Integer[]} houses
# @param {Integer[]} heaters
# @return {Integer}
def find_radius(houses, heaters)
    houses.sort!
    heaters.sort!
    i, j = 0, 0
    result = 0
    while i < houses.length
        idx = houses[i]
        tmp = (heaters[j] - idx).abs
        while j + 1 < heaters.length && heaters[j + 1] < idx
            j += 1
            tmp = (heaters[j] - idx).abs
        end
        if j + 1 < heaters.length && tmp > (heaters[j + 1] - idx).abs
            tmp = (heaters[j + 1] - idx).abs
        end
        # puts "#{idx}, #{tmp}"
        if tmp > result
            result = tmp
        end
        i += 1
    end
    return result
end
# @lc code=end

if __FILE__ == $0
    puts "#{find_radius [1,2,3], [1]}"
    puts "#{find_radius [1,2,3], [2]}"
    puts "#{find_radius [1,2,3,4], [1,4]}"
    puts "#{find_radius [1,5], [2]}"
end
