#
# @lc app=leetcode.cn id=514 lang=ruby
#
# [514] 自由之路
#

# @lc code=start
# @param {String} ring
# @param {String} key
# @return {Integer}
def find_rotate_steps(ring, key)
    m = ring.size
    n = key.size
    dp = Array.new(n){Array.new(m){1e9}} # dp[key][ring] result

    idxMap = Hash.new{Array.new}

    for i in 0...m
        idxMap[ring[i]] = idxMap[ring[i]].push i
    end

    for i in 0...n
        i = n - 1 - i
        for j in 0...m
            cur = key[i]
            idxMap[cur].each{
                |k|
                step = [(k - j).abs, m - (k - j).abs].min
                if i + 1 < n
                    step += dp[i + 1][k]
                end
                if step < dp[i][j]
                    dp[i][j] = step
                end
            }
        end
    end

    return dp[0][0] + n
end
# @lc code=end

if __FILE__ == $0
    puts "#{find_rotate_steps("godding", "gd")}"
    puts "#{find_rotate_steps("godding", "godding")}"
    puts "#{find_rotate_steps("abcde", "abe")}"
end
