#
# @lc app=leetcode.cn id=478 lang=ruby
#
# [478] 在圆内随机生成点
#

# @lc code=start
class Solution
    attr_accessor :r, :x, :y;

=begin
    :type radius: Float
    :type x_center: Float
    :type y_center: Float
=end
    def initialize(radius, x_center, y_center)
        @r, @x, @y = radius, x_center, y_center
    end


=begin
    :rtype: Float[]
=end
    def rand_point()
        while true
            x, y = Random.rand(@x - @r..@x + @r), Random.rand(@y - @r..@y + @r)
            if (x - @x) ** 2 + (y - @y) ** 2 <= @r ** 2
                return [x, y]
            end
        end
    end


end

# Your Solution object will be instantiated and called as such:
# obj = Solution.new(radius, x_center, y_center)
# param_1 = obj.rand_point()
# @lc code=end

if __FILE__ == $0
    s = Solution.new(1.0, 0.0, 0.0)
    puts "#{s.rand_point}"
end
