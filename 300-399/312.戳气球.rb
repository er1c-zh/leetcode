#
# @lc app=leetcode.cn id=312 lang=ruby
#
# [312] 戳气球
#

# @lc code=start
# @param {Integer[]} nums
# @return {Integer}
def max_coins(nums)
    n = [1] + nums + [1]
    l = n.length
    dp = Array.new(l){
        Array.new(l){
            -1
        }
    }
    (2..l - 1).each{
        |delta|
        (0..l - 1).each{
            |i|
            j = i + delta
            if j >= l
                break
            end
            ri, rj = i + 1, j - 1
            if ri == rj
                dp[i][j] = n[ri] * n[i] * n[j]
            else
                max = 0
                (ri..rj).each{
                    |rk|
                    tmp = n[rk] * n[i] * n[j]
                    if rk > ri
                        tmp += dp[i][rk]
                    end
                    if rk < rj
                        tmp += dp[rk][j]
                    end
                    if tmp > max
                        max = tmp
                    end
                }
                dp[i][j] = max
            end
        }
    }
    return dp[0][l - 1]
end
# @lc code=end

