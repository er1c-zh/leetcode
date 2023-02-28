#
# @lc app=leetcode.cn id=583 lang=ruby
#
# [583] 两个字符串的删除操作
#

# @lc code=start
# @param {String} word1
# @param {String} word2
# @return {Integer}
def min_distance(word1, word2)
    m, n = word1.size, word2.size
    dp = Array.new(m + 1){Array.new(n + 1){1001}}
    dp[0][0] = 0
    for i in 0...m
        dp[i + 1][0] = i + 1
    end
    for j in 0...n
        dp[0][j + 1] = j + 1
    end
    for i in 0...m
        for j in 0...n
            _i, _j = i + 1, j + 1
            tmp = []
            if word1[i] == word2[j]
                tmp.append dp[_i - 1][_j - 1]
            end
            tmp.append 1 + dp[_i - 1][_j]
            tmp.append 1 + dp[_i][_j - 1]
            dp[_i][_j] = tmp.min
        end
    end
    return dp[m][n]
end
# @lc code=end

if __FILE__ == $0
    puts "#{min_distance "sea", "eat"}"
    puts "#{min_distance "leetcode", "etco"}"
    puts "#{min_distance "a", "a"}"
end
