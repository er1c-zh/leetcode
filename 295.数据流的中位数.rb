#
# @lc app=leetcode.cn id=295 lang=ruby
#
# [295] 数据流的中位数
#

# @lc code=start
class MedianFinder

=begin
    initialize your data structure here.
=end
    def initialize()
        @l, @r = MaxHeap.new, MinHeap.new
        @ll, @lr = 0, 0
    end


=begin
    :type num: Integer
    :rtype: Void
=end
    def add_num(num)
        @r.push num
        @l.push @r.pop
        if @l.size > @r.size
            @r.push @l.pop
        end
    end


=begin
    :rtype: Float
=end
    def find_median()
        if @r.size > @l.size
            return @r.min
        else
            return (@r.min + @l.max) / 2.0
        end
    end


end


# Your MedianFinder object will be instantiated and called as such:
# obj = MedianFinder.new()
# obj.add_num(num)
# param_2 = obj.find_median()
# @lc code=end

