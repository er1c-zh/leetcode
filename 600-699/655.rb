#
# @lc app=leetcode.cn id=655 lang=ruby
#
# [655] 输出二叉树
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
# @return {String[][]}
def print_tree(root)
    q = [root]
    node_map = []
    all_nil = false
    while q.size > 0 && !all_nil
        all_nil = true
        nq = []
        cur = []
        for n in q
            if n == nil
                cur = cur.append nil
                nq = nq.append nil
                nq = nq.append nil
            else
                cur = cur.append n.val
                nq = nq.append n.left
                nq = nq.append n.right
                if n.left != nil || n.right != nil
                    all_nil = false
                end
            end
        end
        q = nq
        node_map = node_map.append cur
    end

    # puts "#{node_map}"

    m = node_map.size
    n = 2**m - 1
    result = Array.new(m){Array.new(n){""}}
    idx_m = [[(n - 1)/2]]
    for i in 1..m
        f = idx_m[i - 1]
        cur_idx = []
        for j in 0...f.size
            c = f[j]
            cur_idx = cur_idx.append (c - 2**(m - i - 1))
            cur_idx = cur_idx.append (c + 2**(m - i - 1))
        end
        idx_m = idx_m.append cur_idx
    end

    for i in 0...node_map.size
        row = node_map[i]
        for j in 0...row.size
            if j == nil
                next
            end
            result[i][idx_m[i][j]] = row[j].to_s
        end
    end
    return result
end
# @lc code=end

