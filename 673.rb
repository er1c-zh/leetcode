#
# @lc app=leetcode.cn id=673 lang=ruby
#
# [673] 最长递增子序列的个数
#

# @lc code=start
# @param {Integer[]} nums
# @return {Integer}
def find_number_of_lis(nums)
    n = nums.size
    dp = Array.new(n){[0, 0]}
    for i in 0...n
        dp[i] = [1, 1]
        v, c = 1, 1
        for j in 0...i
            if nums[j] >= nums[i]
                next
            end
            if dp[j][0] + 1 > v
                v = dp[j][0] + 1
                c = dp[j][1]
            elsif dp[j][0] + 1 == v
                c += dp[j][1]
            end
        end
        dp[i] = [v, c]
    end
    result = 0
    v = 0
    for i in 0...n
        if dp[i][0] > v
            result = dp[i][1]
            v = dp[i][0]
        elsif dp[i][0] == v
            result += dp[i][1]
        end
    end

    # puts "#{dp}"

    return result
end
# @lc code=end

if __FILE__ == $0
    # puts "#{find_number_of_lis [1,3,5,4,7]}"
    # puts "#{find_number_of_lis [2,2,2,2,2]}"
    puts "#{find_number_of_lis [1,2,4,3,5,4,7,2]}"
end
