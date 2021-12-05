#
# @lc app=leetcode.cn id=215 lang=ruby
#
# [215] 数组中的第K个最大元素
#

# @lc code=start
# @param {Integer[]} nums
# @param {Integer} k
# @return {Integer}
def find_kth_largest(nums, k)
  heap = Heap.new (nums.slice 0, k)

  while k < nums.length
    if heap.peek < nums[k]
      heap.popAndPush nums[k]
    end
    k += 1
  end

  return heap.peek
end

class Heap
  def initialize(nums)
    @cnt = 0
    @heap = Array.new(nums.length) { 0 }
    for num in nums
      insert num
    end
  end

  def insert(num)
    @heap[@cnt] = num
    i = @cnt
    while i > 0 && @heap[i / 2] > @heap[i]
      tmp = @heap[i]
      @heap[i] = @heap[i / 2]
      @heap[i / 2] = tmp
      i = i / 2
    end
    @cnt += 1
  end

  def peek
    return @heap[0]
  end

  def popAndPush(num)
    i = 0
    @heap[i] = num
    while i < @heap.length
      l = i * 2
      r = i * 2 + 1
      if l >= @heap.length
        return
      end
      t = l
      if r < @heap.length
        t = (@heap[r] < @heap[l]) ? r : l
      end

      if @heap[i] > @heap[t]
        tmp = @heap[i]
        @heap[i] = @heap[t]
        @heap[t] = tmp
      else
        # done
        return
      end

      i = t
    end
  end
end

# @lc code=end
