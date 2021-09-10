#
# @lc app=leetcode.cn id=209 lang=ruby
#
# [209] 长度最小的子数组
#

# @lc code=start
# @param {Integer} target
# @param {Integer[]} nums
# @return {Integer}
def min_sub_array_len(target, nums)
  fast, slow = 0, 0
  found = false
  l = nums.length + 1
  cur = 0
  while true
    if l == 1
      break
    end
    while cur < target
      if fast >= nums.length
        return !found ? 0 : l
      end
      cur += nums[fast]
      fast += 1
    end
    if cur < target && fast >= nus.length
      break
    end
    while cur >= target
      cur -= nums[slow]
      slow += 1
    end
    curLen = fast - slow + 1
    if !found || curLen < l
      found = true
      l = curLen
    end
  end

  return !found ? 0 : l
end

# @lc code=end
