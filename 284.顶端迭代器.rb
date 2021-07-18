#
# @lc app=leetcode.cn id=284 lang=ruby
#
# [284] 顶端迭代器
#

# @lc code=start
# Below is the interface for Iterator, which is already defined for you.
#
# class Iterator
# 	def initialize(v)
#   
#   end
#
#   def hasNext()
#		Returns true if the iteration has more elements.
#   end
#
#   def next()
#   	Returns the next element in the iteration.
#   end
# end

class PeekingIterator
    # @param {Iterator} iter
    def initialize(iter)
    	@iter = iter
        @lookahead = nil
        self.fillLookahead
    end

    def fillLookahead()
        if @iter.hasNext
            @lookahead = @iter.next
        else
            @lookahead = nil
        end
    end

    # Returns true if the iteration has more elements.
    # @return {boolean}
    def hasNext()
        return @lookahead != nil
    end
    
    # Returns the next element in the iteration.
    # @return {integer}
    def next()
        @val = @lookahead
        self.fillLookahead
        return @val
    end
    
    # Returns the next element in the iteration without advancing the iterator.
    # @return {integer}
    def peek()
        return @lookahead
    end
end
# @lc code=end

