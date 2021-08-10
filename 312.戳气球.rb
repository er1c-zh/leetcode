#
# @lc app=leetcode.cn id=312 lang=ruby
#
# [312] 戳气球
#

# @lc code=start
# @param {Integer[]} nums
# @return {Integer}
def max_coins(nums)
    s = nums.length + 1
    cache = Array.new(s){
        Array.new(s){
            Array.new(101){
                Array.new(101){
                    -1
                }
            }
        }
    }
    return helper(nums, 0, nums.length - 1, 1, 1, cache)
end
def helper(nums, i, j, l, r, cache)
    if cache[i][j][l][r] != -1
        return cache[i][j][l][r]
    end
    if i > j
        return 0
    end
    if i == j
        return nums[i] * l * r
    end
    max = 0
    (i..j).each{
        |k|
        v = nums[k]
        tmp = v * l * r
        tmp += helper(nums, i, k - 1, l, v, cache)
        tmp += helper(nums, k + 1, j, v, r, cache)
        if tmp > max
            max = tmp
        end
    }
    cache[i][j][l][r] = max
    return max
end
# @lc code=end

