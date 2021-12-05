#
# @lc app=leetcode.cn id=179 lang=ruby
#
# [179] 最大数
#

# @lc code=start
# @param {Integer[]} nums
# @return {String}
def largest_number(nums)
  $allZero = true
  if nums.length == 1 && nums[0] != 0
    $allZero = false
  end

  nums.sort! {
    |a, b|
    if a != 0 || b != 0
      $allZero = false
    end
    "#{b}#{a}" <=> "#{a}#{b}"
  }

  if $allZero
    return "0"
  end

  return nums.join ""
end

# @lc code=end
