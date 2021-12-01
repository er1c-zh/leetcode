require 'set'

#
# @lc app=leetcode.cn id=363 lang=ruby
#
# [363] 矩形区域不超过 K 的最大数值和
#

# @lc code=start
# @param {Integer[][]} matrix
# @param {Integer} k
# @return {Integer}
def max_sum_submatrix(matrix, k)
    m, n = matrix.length, matrix[0].length
    prefix = Array.new(m){Array.new(n){0}}
    # O(m * n)
    matrix.each_index{
        |i|
        matrix[i].each_index{
            |j|
            prefix[i][j] = matrix[i][j]
            if i == 0 && j == 0
                # do nothing
            elsif i == 0
                prefix[i][j] += prefix[i][j - 1]
            elsif j == 0
                prefix[i][j] += prefix[i - 1][j]
            else
                prefix[i][j] += prefix[i][j - 1] + prefix[i - 1][j] - prefix[i - 1][j - 1]
            end
        }
    }
    i = 0
    result = -1e6
    while i < m
        _i = i
        while _i < m
            set = SortedSet.new([0])
            _j = 0
            while _j < n
                # (i, ?) (_i, _j)
                cpre = prefix[_i][_j] - (i > 0 ? prefix[i - 1][_j] : 0)
                tmp = helper(set, cpre - k)
                tmp = cpre - tmp
                if tmp > result
                    result = tmp
                end
                set.add cpre
                _j += 1
            end
            _i += 1
        end
        i += 1
    end
    return result
end
def helper(set, target)
    l = set.to_a
    if l[-1] < target
        return 1e6
    end
    i, j = 0, l.length - 1
    while i < j
        mid = (i + j) / 2
        v = l[mid]
        if v >= target
            j = mid
        else
            i = mid + 1
        end
    end
    return l[i]
end
# @lc code=end

if __FILE__ == $0
    puts "#{max_sum_submatrix([[1,0,1],[0,-2,3]], 2)}"
    puts "#{max_sum_submatrix([[2,2,-1]], 3)}"
    puts "#{max_sum_submatrix([[2,2,-1]], 0)}"
end
