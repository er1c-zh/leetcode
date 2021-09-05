#
# @lc app=leetcode.cn id=221 lang=ruby
#
# [221] 最大正方形
#

# @lc code=start
# @param {Character[][]} matrix
# @return {Integer}
def maximal_square(matrix)
    x, y = matrix.length, matrix[0].length
    result = 0

    for i in 0...x
        for j in 0...y
            if matrix[i][j] == "1"
                delta = 1
                while delta + i < x and delta + j < y
                    ok = true
                    for _i in i...i + delta + 1
                        if matrix[_i][j + delta] == "0"
                            ok = false
                            break
                        end
                    end
                    if !ok
                        break
                    end
                    for _j in j...j + delta + 1
                        if matrix[i + delta][_j] == "0"
                            ok = false
                            break
                        end
                    end
                    if !ok 
                        break
                    end
                    delta += 1
                end
                result = [result, delta ** 2].max
            end
        end
    end
    return result
end
# @lc code=end

