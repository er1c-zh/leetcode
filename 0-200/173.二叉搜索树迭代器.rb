#
# @lc app=leetcode.cn id=173 lang=ruby
#
# [173] 二叉搜索树迭代器
#

# @lc code=start
# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val = 0, left = nil, right = nil)
#         @val = val
#         @left = left
#         @right = right
#     end
# end
class BSTIterator

=begin
    :type root: TreeNode
=end
  def initialize(root)
    @stack = []
    tmp = root
    while tmp != nil
      @stack.append tmp
      tmp = tmp.left
    end
  end

=begin
    :rtype: Integer
=end
  def next()
    # ignore
    tmp = @stack.pop
    n = tmp.right
    while n != nil
      @stack.append n
      n = n.left
    end
    return tmp.val
  end

=begin
    :rtype: Boolean
=end
  def has_next()
    return @stack.length != 0
  end
end

# Your BSTIterator object will be instantiated and called as such:
# obj = BSTIterator.new(root)
# param_1 = obj.next()
# param_2 = obj.has_next()
# @lc code=end
