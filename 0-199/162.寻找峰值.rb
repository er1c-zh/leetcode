#
# @lc app=leetcode.cn id=162 lang=ruby
#
# [162] 寻找峰值
#

# @lc code=start
# @param {Integer[]} nums
# @return {Integer}
def find_peak_element(nums)
  if nums.length == 0
    return 0
  end

  if nums.length == 1
    return 0
  end
  if nums.length == 2
    if nums[0] > nums[1]
      return 0
    else
      return 1
    end
  end

  midIdx = nums.length / 2
  preIdx, sufIdx = midIdx - 1, midIdx + 1
  pre, mid, suf = nums[preIdx], nums[midIdx], nums[sufIdx]

  if pre > mid && mid > suf
    return find_peak_element(nums.slice(0, midIdx))
  elsif pre < mid && mid > suf
    return midIdx
  elsif pre < mid && mid < suf
    return midIdx + find_peak_element(nums.slice(midIdx, nums.length))
  else
    return find_peak_element(nums.slice(0, midIdx))
  end
end

# @lc code=end
