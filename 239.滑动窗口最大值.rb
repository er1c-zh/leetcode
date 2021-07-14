#
# @lc app=leetcode.cn id=239 lang=ruby
#
# [239] 滑动窗口最大值
#

# @lc code=start
# @param {Integer[]} nums
# @param {Integer} k
# @return {Integer[]}
def max_sliding_window(nums, k)
    queue = Array.new

    result = Array.new

    (0..nums.length - 1).each{
        |i|
        node = ENode.new nums[i], i
        while queue.length > 0
            if queue[queue.length - 1].val > node.val
                break
            end
            queue = queue[0, queue.length - 1]
        end
        queue = queue.push node
        while queue[0].idx + k <= i
            queue = queue[1..-1]
        end
        if i + 1 >= k
            result = result.append queue[0].val
        end
    }

    return result
end
class ENode
    attr_accessor :val, :idx

    def initialize(val, idx)
        @val, @idx = val, idx
    end
end
# @lc code=end

