#
# @lc app=leetcode.cn id=497 lang=ruby
#
# [497] 非重叠矩形中的随机点
#

# @lc code=start
class Solution
    attr_accessor :pre_sum, :sum, :rand

=begin
    :type rects: Integer[][]
=end
    def initialize(rects)
        n = rects.length
        @pre_sum = Array.new(n)
        @sum = 0
        rects.each_index{
            |i|
            rect = rects[i]
            x1, y1, x2, y2 = rect[0], rect[1], rect[2], rect[3]
            size = (x2 - x1 + 1) * (y2 - y1 + 1)
            @pre_sum[i] = [size, rect]
            @sum += size
        }
        @rand = Random.new
    end


=begin
    :rtype: Integer[]
=end
    def pick()
        cur = @rand.rand(@sum)
        @pre_sum.each{
            |v|
            if cur < v[0]
                rect = v[1]
                x1, y1, x2, y2 = rect[0], rect[1], rect[2], rect[3]
                l, h = x2 - x1 + 1, y2 - y1 + 1
                dx = cur % l
                dy = cur / l
                x, y = x1 + dx, y1 + dy
                if x < x1 || x > x2 || y < y1 || y > y2
                    puts "#{v}, #{cur}, (#{dx},#{dy})"
                    puts "===err: (#{x}, #{y})"
                end
                return [x, y]
            else
                cur -= v[0]
            end
        }
        puts "unexpected"
        return [-1, -1]
    end


end

# Your Solution object will be instantiated and called as such:
# obj = Solution.new(rects)
# param_1 = obj.pick()
# @lc code=end

