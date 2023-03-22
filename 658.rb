#
# @lc app=leetcode.cn id=658 lang=ruby
#
# [658] 找到 K 个最接近的元素
#

# @lc code=start
# @param {Integer[]} arr
# @param {Integer} k
# @param {Integer} x
# @return {Integer[]}
def find_closest_elements(arr, k, x)
    n = arr.size
    ci = 0
    for i in 0...n
        if (arr[i] - x).abs < (arr[ci] - x).abs
            ci = i
        end
    end
    i, j = ci, ci
    while j - i + 1 < k
        li, ri = i - 1, j + 1
        if li < 0
            j += 1
        elsif ri >= n
            i -= 1
        else
            if (arr[li] - x).abs <= (arr[ri] - x).abs
                i -= 1
            else
                j += 1
            end
        end
    end
    return arr[i..j]
end
# @lc code=end

if __FILE__ == $0
    puts "#{find_closest_elements [1,2,3,4,5], 4, 3}"
    puts "#{find_closest_elements [1,2,3,4,5], 4, -1}"
end
