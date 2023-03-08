#
# @lc app=leetcode.cn id=639 lang=ruby
#
# [639] 解码方法 II
#

# @lc code=start
# @param {String} s
# @return {Integer}
def num_decodings(s)
    n = s.size
    dp = Array.new(n + 1) {0}
    dp[0] = 1
    for i in 1...n+1
        c = s[i-1]
        # cnt 1
        if c == '0'
        elsif c == '*'
            dp[i] += 9 * dp[i - 1]
        else
            dp[i] += dp[i - 1]
        end
        # cnt 2
        if i == 1
            next
        end
        pre = s[i-2]
        if c == '0'
            if pre == '1' || pre == '2'
                dp[i] += dp[i - 2]
            elsif pre == '*'
                dp[i] += 2 * dp[i - 2]
            else
                puts "oops"
                return 0
            end
        elsif c == '*'
            if pre == '1'
                dp[i] += 9 * dp[i - 2]
            elsif pre == '2'
                dp[i] += 6 * dp[i - 2]
            elsif pre == '*'
                dp[i] += 15 * dp[i - 2]
            else
            end
        else
            if pre == '1'
                dp[i] += dp[i - 2]
            elsif pre == '2'
                if c >= '0' && c <= '6'
                    dp[i] += dp[i - 2]
                end
            elsif pre == '*'
                dp[i] += dp[i - 2]
                if c >= '0' && c <= '6'
                    dp[i] += dp[i - 2]
                end
            else
            end
        end
        dp[i] = (dp[i] % (1e9 + 7)).to_i
    end
    return dp[n]
end
# @lc code=end

if __FILE__ == $0
    puts "#{num_decodings "*"}"
    puts "#{num_decodings "1*"}"
    puts "#{num_decodings "2*"}"
    puts "#{num_decodings "*1*1*0"}"
end
