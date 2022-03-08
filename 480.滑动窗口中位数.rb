#
# @lc app=leetcode.cn id=480 lang=ruby
#
# [480] 滑动窗口中位数
#

# @lc code=start
# @param {Integer[]} nums
# @param {Integer} k
# @return {Float[]}
def median_sliding_window(nums, k)
    hl = Heap.new{
        |y, x| 
        if x[0] != y[0]
            (x[0] <=> y[0]) == -1
        else
            (x[1] <=> y[1]) == -1
        end
    }
    hr = Heap.new{
        |x, y|
        if x[0] != y[0]
            (x[0] <=> y[0]) == -1
        else
            (x[1] <=> y[1]) == -1
        end
    }
    result = []
    nums.each_index{
        |i|
        v = nums[i]
        hl.push([v, i])
        if i - k >= 0
            hr.delete([nums[i - k], i - k])
            hl.delete([nums[i - k], i - k])
        end
        while hl.size > hr.size + 1
            hr.push hl.pop
        end
        while !hl.empty? && !hr.empty? && hr.next[0] < hl.next[0]
            tl = hr.pop
            tr = hl.pop
            hr.push tr
            hl.push tl
        end
        if hl.size + hr.size == k
            if hl.size > hr.size
                result.append hl.next[0]
            else
                # puts "#{hl.next}, #{hr.next}"
                result.append (hl.next[0] + hr.next[0]) / 2.0
            end
        end
    }
    return result
end
# @lc code=end

