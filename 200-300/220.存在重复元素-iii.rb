#
# @lc app=leetcode.cn id=220 lang=ruby
#
# [220] 存在重复元素 III
#

# @lc code=start
# @param {Integer[]} nums
# @param {Integer} k
# @param {Integer} t
# @return {Boolean}
def contains_nearby_almost_duplicate(nums, k, t)
  fast, slow = -1, 0

  buckets = Hash.new

  while true
    while fast - slow < k
      fast += 1
      if fast >= nums.length
        return false
      end
      cur = nums[fast]
      targetBucket = getTargetBucket cur, t
      if buckets[targetBucket] != nil && buckets[targetBucket].size > 0
        if t == 0
          if buckets[targetBucket][cur] > 0
            return true
          end
        else
          return true
        end
      end

      if buckets[targetBucket + 1] != nil && buckets[targetBucket + 1].size > 0
        for num in buckets[targetBucket + 1].keys
          if (num - cur).abs <= t
            return true
          end
        end
      end
      if buckets[targetBucket - 1] != nil && buckets[targetBucket - 1].size > 0
        for num in buckets[targetBucket - 1].keys
          if (num - cur).abs <= t
            return true
          end
        end
      end
      if buckets[targetBucket] == nil
        buckets[targetBucket] = Hash.new { 0 }
      end
      buckets[targetBucket][cur] += 1
    end
    toRemove = nums[slow]
    targetBucket = getTargetBucket toRemove, t
    buckets[targetBucket][toRemove] -= 1
    if buckets[targetBucket][toRemove] == 0
      buckets[targetBucket].delete toRemove
    end
    slow += 1
  end

  return false
end

def getTargetBucket(num, t)
  if t == 0
    return 0
  end
  return num / t
end

# @lc code=end
