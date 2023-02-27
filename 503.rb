#
# @lc app=leetcode.cn id=503 lang=ruby
#
# [503] 下一个更大元素 II
#

# @lc code=start
# @param {Integer[]} nums
# @return {Integer[]}
def next_greater_elements(nums)
    h = Array.new
    n = nums.size
    nums = nums + nums
    result = Array.new(n){nil}
    for i in 0...2 * n
        i = i % n
        v = nums[i]
        while h.size > 0 && h[h.size - 1][0] < v
            preItem = h.pop
            result[preItem[1]] = v
        end
        if result[i] == nil
            result[i] = -1
            h.push [v, i]
        end
    end
    return result
end
# @lc code=end

if __FILE__ == $0
    puts "#{next_greater_elements [1,2,1]}"
end
