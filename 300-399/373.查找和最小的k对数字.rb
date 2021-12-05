#
# @lc app=leetcode.cn id=373 lang=ruby
#
# [373] 查找和最小的K对数字
#

# @lc code=start
# @param {Integer[]} nums1
# @param {Integer[]} nums2
# @param {Integer} k
# @return {Integer[][]}
def k_smallest_pairs(nums1, nums2, k)
    l1, l2 = nums1.length, nums2.length
    result = []
    set = Hash.new
    task = MinHeap.new
    m = Hash.new
    v = [0, 0]
    sum = nums1[0] + nums2[0]
    task.push sum
    m[sum] = [v]
    while !task.empty? && k > 0
        k -= 1
        idx = task.pop
        cur = m[idx].pop
        i, j = cur[0], cur[1]
        result.append [nums1[i], nums2[j]]

        puts "#{idx}, #{cur}"

        if i + 1 < l1
            _i, _j = i + 1, j
            n = [_i, _j]
            v = [nums1[_i], nums2[_j]]
            sum = v[0] + v[1]
            if set[n] == nil
                set[n] = true
                if m[sum] == nil
                    m[sum] = []
                end
                m[sum] = m[sum].append n
                task.push sum
            end
        end
        if j + 1 < l2
            _i, _j = i, j + 1
            n = [_i, _j]
            v = [nums1[_i], nums2[_j]]
            sum = v[0] + v[1]
            if set[n] == nil
                set[n] = true
                if m[sum] == nil
                    m[sum] = []
                end
                m[sum] = m[sum].append n
                task.push sum
            end
        end
    end

    return result
end
# @lc code=end

if __FILE__ == $0
    puts "#{k_smallest_pairs([1,7,11], [2,4,6], 3)}"
end
