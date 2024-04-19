#
# @lc app=leetcode.cn id=650 lang=ruby
#
# [650] 只有两个键的键盘
#

# @lc code=start
# @param {Integer} n
# @return {Integer}
def min_steps(n)
    dp = Array.new(n + 1){1e9}
    dp[0] = 0
    dp[1] = 0
    for i in 2...n + 1
        dp[i] = i
        for k in 1...i
            if i % k != 0
                next
            end
            t = dp[k] + (i / k)
            if t < dp[i]
                dp[i] = t
            end
        end
    end
    return dp[n].to_i
end
# @lc code=end

if __FILE__ == $0
    puts "#{min_steps 3}"
    puts "#{min_steps 1}"
    puts "#{min_steps 1000}"
end
