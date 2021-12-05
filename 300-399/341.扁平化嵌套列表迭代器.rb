#
# @lc app=leetcode.cn id=341 lang=ruby
#
# [341] 扁平化嵌套列表迭代器
#

# @lc code=start
# This is the interface that allows for creating nested lists.
# You should not implement it, or speculate about its implementation
#
#class NestedInteger
#    def is_integer()
#        """
#        Return true if this NestedInteger holds a single integer, rather than a nested list.
#        @return {Boolean}
#        """
#
#    def get_integer()
#        """
#        Return the single integer that this NestedInteger holds, if it holds a single integer
#        Return nil if this NestedInteger holds a nested list
#        @return {Integer}
#        """
#
#    def get_list()
#        """
#        Return the nested list that this NestedInteger holds, if it holds a nested list
#        Return nil if this NestedInteger holds a single integer
#        @return {NestedInteger[]}
#        """

class NestedIterator
    # @param {NestedInteger[]} nested_list
    attr_accessor :stackIdx, :stack, :cur, :idx
    def initialize(nested_list)
        @stack, @stackIdx, @cur, @idx = [], [], nested_list, 0
        self.format
    end

    def format
        # 保证@cur[@idx]指向下一个可以读的数字
        while true
            if @cur[@idx] == nil
                if @stack.empty?
                    # end
                    return
                end
                @cur, @idx = @stack.pop, @stackIdx.pop
            elsif @cur[@idx].is_integer
                return
            else
                @stack.push @cur
                @stackIdx.push(@idx + 1)
                @cur = @cur[@idx].get_list
                @idx = 0
            end
        end
    end

    # @return {Boolean}
    def has_next
        return @idx < @cur.length
    end

    # @return {Integer}
    def next
        tmp = @cur[@idx].get_integer
        @idx += 1
        self.format
        return tmp
    end
end

# Your NestedIterator will be called like this:
# i, v = NestedIterator.new(nested_list), []
# while i.has_next()
#    v << i.next
# end
# @lc code=end

