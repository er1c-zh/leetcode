#
# @lc app=leetcode.cn id=222 lang=ruby
#
# [222] 完全二叉树的节点个数
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
# @param {TreeNode} root
# @return {Integer}
def count_nodes(root)
  return helper(root, -1, -1)
end

def helper(root, l, r)
  if l == -1
    l = getl root
  end
  if r == -1
    r = getr root
  end

  result = 0
  if l == r
    for i in 0...r
      result += 2 ** i
    end
  else
    result = 1 + (helper root.left, l - 1, -1) + (helper root.right, -1, r - 1)
  end

#   p "#{l}, #{r}, #{result}"

  return result
end

def getl(root)
  l = 0
  while root != nil
    l += 1
    root = root.left
  end
  return l
end

def getr(root)
  r = 0
  while root != nil
    r += 1
    root = root.right
  end
  return r
end

# @lc code=end
