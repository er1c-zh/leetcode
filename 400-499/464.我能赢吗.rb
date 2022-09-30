#
# @lc app=leetcode.cn id=464 lang=ruby
#
# [464] 我能赢吗
#

# @lc code=start
# @param {Integer} max_choosable_integer
# @param {Integer} desired_total
# @return {Boolean}
def can_i_win(max_choosable_integer, desired_total)
    # desired <= max 赢
    # desired - min <= max 输
    if desired_total <= max_choosable_integer
        return true
    end
    if desired_total > (1 + max_choosable_integer) * max_choosable_integer / 2
        return false
    end
    result = helper(max_choosable_integer, 0, desired_total, Hash.new)
    return result
end
def helper(n, cur, need, cache)
    if need <= 0
        return false
    end
    # 返回先手是否必胜/负
    if cache[cur] != nil
        return cache[cur]
    end
    win = false
    (1..n).each{
        |offset|
        offset = n + 1 - offset
        mask = 1 << offset
        if cur & mask > 0
            # 用过了
            next
        end
        if !helper(n, cur | mask, need - offset, cache)
            win = true
            break
        end
    }
    cache[cur] = win
    return win
end
# @lc code=end

if __FILE__ == $0
    puts "#{can_i_win 10, 11}"
    puts "#{can_i_win 10, 0}"
    puts "#{can_i_win 20, 210}"
    puts "#{can_i_win 4, 6}"
end
