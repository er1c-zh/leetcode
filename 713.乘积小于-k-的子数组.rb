#
# @lc app=leetcode.cn id=713 lang=ruby
#
# [713] 乘积小于 K 的子数组
#

# @lc code=start
# @param {Integer[]} nums
# @param {Integer} k
# @return {Integer}
def num_subarray_product_less_than_k(nums, k)
    if k <= 1
        return 0
    end
    i, j = 0, 0
    cnt = 0
    cur = 1
    while j < nums.length
        if cur * nums[j] >= k
            if i == j
                i += 1
                j += 1
            else
                cur /= nums[i]
                i += 1
            end
        else
            cur *= nums[j]
            j += 1
            cnt += j - i
        end
    end
    cnt
end
# @lc code=end

if __FILE__ == $0
    puts "#{num_subarray_product_less_than_k [10, 5, 2, 6], 100}"
    puts "#{num_subarray_product_less_than_k [1, 2, 3], 0}"
    puts "#{num_subarray_product_less_than_k [57,44,92,28,66,60,37,33,52,38,29,76,8,75,22], 18}"
end
