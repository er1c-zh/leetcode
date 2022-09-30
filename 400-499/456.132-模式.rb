#
# @lc app=leetcode.cn id=456 lang=ruby
#
# [456] 132 模式
#

# @lc code=start
# @param {Integer[]} nums
# @return {Boolean}
def find132pattern(nums)
    stack = []
    n = nums.length
    dp = Array.new(n)
    nums.each_index{
        |i|
        v = nums[i]
        if i == 0
            dp[i] = v
            stack.append [i, v]
            next
        end
        while !stack.empty? && stack[-1][1] <= v
            stack = stack[0..-2]
        end
        if !stack.empty? && stack[-1][0] > 0 && dp[stack[-1][0] - 1] < v
            return true
        end
        dp[i] = [dp[i - 1], v].min
        stack.append [i, v]
    }
    return false
end
# @lc code=end

if __FILE__ == $0
    puts "#{find132pattern([3,1,4,2])}"
end
