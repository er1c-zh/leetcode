#
# @lc app=leetcode.cn id=304 lang=ruby
#
# [304] 二维区域和检索 - 矩阵不可变
#

# @lc code=start
class NumMatrix

=begin
    :type matrix: Integer[][]
=end
    def initialize(matrix)
        lx, ly = matrix.length, matrix[0].length
        @cache = Array.new(lx){Array.new(ly){0}}
        matrix.each_index{
            |x|
            matrix[x].each_index{
                |y|
                @cache[x][y] = matrix[x][y]
                if x == 0 && y == 0
                    next
                elsif x == 0
                    @cache[x][y] += @cache[x][y - 1]
                elsif y == 0
                    @cache[x][y] += @cache[x - 1][y]
                else
                    @cache[x][y] += @cache[x - 1][y] + @cache[x][y - 1] - @cache[x - 1][y - 1]
                end
            }
        }
        # p @cache
    end


=begin
    :type row1: Integer
    :type col1: Integer
    :type row2: Integer
    :type col2: Integer
    :rtype: Integer
=end
    def sum_region(row1, col1, row2, col2)
        x1, y1, x2, y2 = row1 - 1, col1 - 1, row2, col2
        r = @cache[x2][y2]
        if x1 < 0 && y1 < 0
            # do nothing
        elsif x1 < 0
            r -= @cache[x2][y1]
        elsif y1 < 0
            r -= @cache[x1][y2]
        else
            r += @cache[x1][y1] - @cache[x1][y2] - @cache[x2][y1]
        end
        return r
    end


end

# Your NumMatrix object will be instantiated and called as such:
# obj = NumMatrix.new(matrix)
# param_1 = obj.sum_region(row1, col1, row2, col2)
# @lc code=end

if __FILE__ == $0
    NumMatrix.new([[-4,-5]])
end
