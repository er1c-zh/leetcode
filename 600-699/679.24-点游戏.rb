#
# @lc app=leetcode.cn id=679 lang=ruby
#
# [679] 24 点游戏
#

# @lc code=start
# @param {Integer[]} cards
# @return {Boolean}
def judge_point24(cards)
    dp = Hash.new{}

    dp[1] = {cards[0] => true }
    dp[2] = {cards[1] => true }
    dp[4] = {cards[2] => true }
    dp[8] = {cards[3] => true }

    ak = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15]

    for k in ak
        sp = split(k, ak)
        if sp.length == 0
            next
        end
        dp[k] = Hash.new{false}
        for kp in sp
            for v1 in dp[kp[0]].keys
                for v2 in dp[kp[1]].keys
                    v1 = v1 * 1.0
                    v2 = v2 * 1.0
                    dp[k][v1 + v2] = true
                    dp[k][v1 - v2] = true
                    dp[k][v1 * v2] = true
                    dp[k][v1 / v2] = true

                    dp[k][v2 - v1] = true
                    dp[k][v2 / v1] = true
                end
            end
        end
    end

    for k in dp[15].keys
        if (k - 24.0).abs < 0.000001
            return true
        end
    end
    return false
end

def split(k, keys)
    set = Hash.new
    r = []
    for lk in keys
        if set[lk]
            next
        end
        set[lk] = true
        if k | lk != k
            next
        end
        rk = k ^ lk
        if rk == 0
            next
        end
        set[rk] = true
        r.append [lk, rk]
    end
    return r
end
def all_key(n)
    if n == 1
        return [0, 1]
    end
    r = []
    for k in all_key(n - 1)
        r.append (k << 1)
        r.append (k << 1 | 1)
    end
    return r
end
# @lc code=end

if __FILE__ == $0
    puts "#{judge_point24 [3,3,8,8]}"
    # puts "#{judge_point24 [4, 1, 8, 7]}"
    # puts "#{judge_point24 [1, 2, 1, 2]}"
end
