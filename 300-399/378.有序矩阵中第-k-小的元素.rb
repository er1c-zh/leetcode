#
# @lc app=leetcode.cn id=378 lang=ruby
#
# [378] 有序矩阵中第 K 小的元素
#

# @lc code=start
# @param {Integer[][]} matrix
# @param {Integer} k
# @return {Integer}
def kth_smallest(matrix, k)
    n = matrix.length
    set = Hash.new
    h = MinHeap.new
    result = 0
    sumMap = Hash.new
    h.push(matrix[0][0])
    sumMap[matrix[0][0]] = [[0, 0]]
    while k > 0
        result = h.pop
        cur = sumMap[result].pop
        i, j = cur[0], cur[1]

        if i + 1 < n && set[[i + 1, j]] == nil
            _i, _j = i + 1, j
            set[[_i,_j]] = true
            h.push matrix[_i][_j]
            nr = matrix[_i][_j]
            if sumMap[nr] == nil
                sumMap[nr] = []
            end
            sumMap[nr].push [_i,_j]
        end
        if j + 1 < n && set[[i, j + 1]] == nil
            _i, _j = i, j + 1
            set[[_i,_j]] = true
            h.push matrix[_i][_j]
            nr = matrix[_i][_j]
            if sumMap[nr] == nil
                sumMap[nr] = []
            end
            sumMap[nr].push [_i,_j]
        end
        k -= 1
    end
    return result
end
# @lc code=end

if __FILE__ == $0
    puts "#{kth_smallest([[1,5,9],[10,11,13],[12,13,15]], 8)}"
    # puts "#{kth_smallest()}"
end
