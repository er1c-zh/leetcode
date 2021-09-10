#
# @lc app=leetcode.cn id=240 lang=ruby
#
# [240] 搜索二维矩阵 II
#

# @lc code=start
# @param {Integer[][]} matrix
# @param {Integer} target
# @return {Boolean}
def search_matrix(matrix, target)
    result = false
    matrix.each{
        |nums|
        if nums[0] > target
            break
        end
        if nums[nums.length - 1] < target
            next
        end
        # binary search
        i, j = 0, nums.length
        mid = (i + j) / 2
        while true
            if nums[mid] == target
                result = true
                break
            elsif nums[mid] > target
                j = mid
            else
                i = mid + 1
            end
            if i == j
                break
            end
            mid = (i + j) / 2
        end
    }
    return result
end
# @lc code=end

