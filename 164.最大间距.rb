#
# @lc app=leetcode.cn id=164 lang=ruby
#
# [164] 最大间距
#

# @lc code=start
# @param {Integer[]} nums
# @return {Integer}
def maximum_gap(nums)
  if nums.length < 2
    return 0
  end

  queue = [nums.length]
  i = 32
  while i > 0
    n = []
    mask = 1 << i
    from = 0
    for to in queue
      if from + 1 == to
        n.append to
        from = to
        next
      end
      idx = from
      split = from
      while idx < to
        if nums[idx] & mask == 0
          tmp = nums[split]
          nums[split] = nums[idx]
          nums[idx] = tmp
          split += 1
        end
        idx += 1
      end
      if from < split
        n.append split
      end
      n.append to
      from = to
    end
    queue = n
    i -= 1
  end

  max = 0
  pre = nums[0]
  for i in 1..nums.length - 1
    if nums[i] - pre > max
      max = nums[i] - pre
    end
    pre = nums[i]
  end
  return max
end

# @lc code=end
