#
# @lc app=leetcode.cn id=546 lang=ruby
#
# [546] 移除盒子
#

# @lc code=start
# @param {Integer[]} boxes
# @return {Integer}
def remove_boxes(boxes)
    return remove_boxes_optimize boxes
    n = boxes.size
    dp = Array.new(n){Array.new(n){Array.new(n)}} # dp[i][j][k] -> [i, j] and k

    for l in 0...n
        for i in 0...n
            j = i + l
            if j >= n
                break
            end
            for k in 0...n
                if j + k >= n
                    break
                end
                # 1. 贪掉结尾的a_j
                cur = 0
                cur += (k + 1) ** 2
                if j - 1 >= i
                    cur += dp[i][j - 1][0]
                end

                # 2. 找到 每个a_j，尝试提前扣掉
                m = j - 1
                while m >= i
                    if boxes[m] == boxes[j]
                        tmp = dp[i][m][k + 1]
                        if j - m > 1
                            tmp += dp[m + 1][j - 1][0]
                        end
                        if tmp > cur
                            cur = tmp
                        end
                    end
                    m -= 1
                end
                dp[i][j][k] = cur
            end
        end
    end

    return dp[0][n - 1][0]
end

def remove_boxes_optimize(boxes)
    n = boxes.size
    pre_sum = Array.new(n) # pre_sum[idx] = count
    pre_sum_map = Hash.new{0} # pre_sum_map[v] = total

    for i in 0...n
        pre_sum[i] = 1 + pre_sum_map[boxes[i]]
        pre_sum_map[boxes[i]] = pre_sum_map[boxes[i]] + 1
    end

    dp = Array.new(n){Array.new(n){Array.new(n)}} # dp[i][j][k] -> [i, j] and k

    for l in 0...n
        for i in 0...n
            j = i + l
            if j >= n
                break
            end
            for k in 0...n
                if k > pre_sum_map[boxes[j]] - pre_sum[j]
                    break
                end
                # 1. 贪掉结尾的a_j
                cur = 0
                cur += (k + 1) ** 2
                if j - 1 >= i
                    cur += dp[i][j - 1][0]
                end

                # 2. 找到 每个a_j，尝试提前扣掉
                m = j - 1
                while m >= i
                    if boxes[m] == boxes[j]
                        tmp = dp[i][m][k + 1]
                        if j - m > 1
                            tmp += dp[m + 1][j - 1][0]
                        end
                        if tmp > cur
                            cur = tmp
                        end
                    end
                    m -= 1
                end
                dp[i][j][k] = cur
            end
        end
    end

    return dp[0][n - 1][0]
end

# @lc code=end

if __FILE__ == $0
    puts "#{remove_boxes [1,3,2,2,2,3,4,3,1]}"
    puts "#{remove_boxes [1,1,1]}"
    puts "#{remove_boxes [1]}"
    puts "#{remove_boxes [1,2,3,4,5,6,7,8,9,10]}"
    puts "#{remove_boxes [1,2,2,1,1,1,2,1,1,2,1,2,1,1,2,2,1,1,2,2,1,1,1,2,2,2,2,1,2,1,1,2,2,1,2,1,2,2,2,2,2,1,2,1,2,2,1,1,1,2,2,1,2,1,2,2,1,2,1,1,1,2,2,2,2,2,1,2,2,2,2,2,1,1,1,1,1,2,2,2,2,2,1,1,1,1,2,2,1,1,1,1,1,1,1,2,1,2,2,1]}"
    puts "#{remove_boxes [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82,83,84,85,86,87,88,89,90,91,92,93,94,95,96,97,98,99,100]}"
end
