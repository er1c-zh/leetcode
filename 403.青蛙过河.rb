#
# @lc app=leetcode.cn id=403 lang=ruby
#
# [403] 青蛙过河
#

# @lc code=start
# @param {Integer[]} stones
# @return {Boolean}
def can_cross(stones)
    target = stones[-1]
    stones_set = Hash.new
    stones.each{
        |i|
        stones_set[i] = true
    }

    set = Hash.new
    set[0] = Hash.new
    set[0][0] = true
    stones.each{
        |idx|
        if set[idx] != nil
            set[idx].keys.each{
                |k|
                [k - 1, k, k + 1].each{
                    |delta|
                    if delta <= 0
                        next
                    end
                    next_idx = idx + delta
                    if next_idx == target
                        return true
                    end
                    if stones_set[next_idx] == true
                        if set[next_idx] == nil
                            set[next_idx] = Hash.new
                        end
                        set[next_idx][delta] = true
                    end
                }
            }
        end
    }
    return false
end
# @lc code=end

if __FILE__ == $0
    puts "#{can_cross [0,1,3,5,6,8,12,17]}"
    puts "#{can_cross [0,1,2,3,4,8,9,11]}"
    # puts "#{can_cross []}"
end
