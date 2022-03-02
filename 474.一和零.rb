#
# @lc app=leetcode.cn id=474 lang=ruby
#
# [474] 一和零
#

# @lc code=start
# @param {String[]} strs
# @param {Integer} m
# @param {Integer} n
# @return {Integer}
def find_max_form(strs, m, n)
    l = strs.length
    dp = Array.new(l){
        Array.new(m + 1){
            Array.new(n + 1){
                0
            }
        }
    }
    # dp[i][j][k] 在【0,i]中至少保留j个0k个1的最大数量
    strs.each_index{
        |i|
        c0, c1 = 0, 0
        strs[i].chars{
            |c|
            if c == '0'
                c0 += 1
            else
                c1 += 1
            end
        }
        j = 0
        while j <= m
            k = 0
            while k <= n
                if i == 0
                    if c0 + j <= m && c1 + k <= n
                        dp[i][j][k] = 1
                    end
                else
                    dp[i][j][k] = dp[i - 1][j][k]
                    _j, _k = j + c0, k + c1
                    if _j <= m && _k <= n
                        tmp = dp[i - 1][_j][_k] + 1
                        if tmp > dp[i][j][k]
                            dp[i][j][k] = tmp
                        end
                    end
                end
                k += 1
            end
            j += 1
        end
        if false
            puts "=#{i}="
            dp[i].each{
                |v|
                puts "#{v}"
            }
        end
    }


    return dp[l - 1][0][0]
end
# @lc code=end

if __FILE__ == $0
    puts "#{find_max_form ["10", "0001", "111001", "1", "0"], 5, 3}"
end
