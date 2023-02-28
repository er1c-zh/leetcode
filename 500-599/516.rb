#
# @lc app=leetcode.cn id=516 lang=ruby
#
# [516] 最长回文子序列
#

# @lc code=start
# @param {String} s
# @return {Integer}
def longest_palindrome_subseq(s)
    if s == s.reverse
        return s.size
    end
    n = s.size
    dp = Array.new(n){Array.new(n){0}} ## dp[i][j] [i,j]的result

    result = 0
    for d in 0...n
        for i in 0..n
            j = i + d
            if j >= n
                break
            end
            if i == j
                dp[i][j] = 1
            else
                candidate = []
                if i + 1 < n
                    candidate.push dp[i + 1][j]
                end
                if j - 1 >= 0
                    candidate.push dp[i][j - 1]
                end
                if s[i] == s[j]
                    tmp = 2
                    if i + 1 < n && j - 1 >= 0
                        tmp += dp[i + 1][j - 1]
                    end
                    candidate.push tmp
                end
                dp[i][j] = candidate.max
            end
        end
    end

    return dp[0][n - 1]
end
# @lc code=end

if __FILE__ == $0
    puts "#{longest_palindrome_subseq "bbbab"}"
    puts "#{longest_palindrome_subseq "cbbd"}"
end
