#
# @lc app=leetcode.cn id=189 lang=ruby
#
# [189] 旋转数组
#

# @lc code=start
# @param {Integer[]} nums
# @param {Integer} k
# @return {Void} Do not return anything, modify nums in-place instead.
def rotate(nums, k)
  k = k % nums.length
  set = Hash.new

  check = 0
  while check < nums.length
    if set[check] == nil
      idx = (check + k) % nums.length
      tmp = nums[check]
      while set[idx] == nil
        set[idx] = true
        nextTmp = nums[idx]
        nums[idx] = tmp

        tmp = nextTmp
        idx = (idx + k) % nums.length
      end
    end
    check += 1
  end
end

# @lc code=end
