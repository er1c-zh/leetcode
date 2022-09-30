#
# @lc app=leetcode.cn id=410 lang=ruby
#
# [410] 分割数组的最大值
#

# @lc code=start
# @param {Integer[]} nums
# @param {Integer} m
# @return {Integer}
def split_array(nums, m)
    n = nums.length
    pre = Array.new(n){0}
    nums.each_index{
        |i|
        if i == 0
            pre[i] = nums[i]
        else
            pre[i] = nums[i] + pre[i - 1]
        end
    }

    # dp[i][j] [0..j] 分为 i 份的答案
    dp = Array.new(m + 1){Array.new(n){nil}}
    i = 1
    # O (50 * (n ^ 2))
    while i <= m
        j = i - 1
        while j < n
            if i == 1
                # 分为一份 直接求和
                dp[i][j] = pre[j]
            elsif j == i - 1
                # 第一个 前面的最大值
                dp[i][j] = nums[0..j].max
            else
                # dp
                tmp = nil
                sum = 0
                l = 1
                while j - l + 1 >= i - 1 && (tmp == nil || sum <= tmp)
                    sum += nums[j - l + 1]
                    tr = [sum, dp[i - 1][j - l]].max
                    if tmp == nil || tr < tmp
                        tmp = tr
                    end
                    l += 1
                end
                dp[i][j] = tmp
            end
            j += 1
        end
        i += 1
    end
    if false
        dp.each{
            |v|
            puts "#{v}"
        }
    end
    return dp[m][-1]
end
# @lc code=end

if __FILE__ == $0
    puts "#{split_array [7,2,5,10,8], 2}"
    puts "#{split_array [1,2,3,4,5], 2}"
    puts "#{split_array [1,4,4], 3}"
    puts "#{split_array [2,3,1,2,4,3], 5}"
    # puts "#{split_array }"
end
