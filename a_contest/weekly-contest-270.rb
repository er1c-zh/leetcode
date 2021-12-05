# 1
# @param {Integer[]} digits
# @return {Integer[]}
def find_even_numbers(digits)
    set = Array.new(10){0}
    digits.each{
        |v|
        set[v] += 1
    }
    return helper(set, false, 3)
end
def helper(pool, canZero, len)
    if len == 0
        return [0]
    end
    result = []
    base = 10 ** (len - 1)
    pool.each_index{
        |v|
        if pool[v] == 0
            next
        end
        if !canZero && v == 0
            next
        end
        if len == 1 && v % 2 != 0
            next
        end
        pool[v] -= 1
        helper(pool, true, len - 1).each{
            |suffix|
            result.append suffix + base * v
        }
        pool[v] += 1
    }
    return result
end

# 2
# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val = 0, _next = nil)
#         @val = val
#         @next = _next
#     end
# end
# @param {ListNode} head
# @return {ListNode}
def delete_middle(head)
    if head == nil
        return head
    end
    slow, fast, pre = head, head, nil

    while fast != nil && fast.next != nil
        pre = slow
        slow = slow.next
        fast = fast.next
        if fast.next != nil
            fast = fast.next
        end
    end

    if pre == nil
        return nil
    elsif pre.next != nil
        pre.next = pre.next.next
    end

    return head
end

# 3
# Definition for a binary tree node.
class TreeNode
    attr_accessor :val, :left, :right
    def initialize(val = 0, left = nil, right = nil)
        @val = val
        @left = left
        @right = right
    end
end
# @param {TreeNode} root
# @param {Integer} start_value
# @param {Integer} dest_value
# @return {String}
def get_directions(root, start_value, dest_value)
    r, sp, dp = helper3(root, start_value, dest_value, false, false)
    if r != nil
        return r
    end
    return "U" * sp.length + dp
end
def helper3(root, sv, dv, fs, fd)
    if root == nil || (fs && fd)
        return nil, nil, nil
    end

    sp, dp = nil, nil
    if root.val == sv
        sp = ""
        fs = true
    end
    if root.val == dv
        dp = ""
        fd = true
    end

    _r, _sp, _dp = helper3(root.left, sv, dv, fs, fd)
    if _r != nil
        return _r, nil, nil
    end
    if _sp != nil
        sp = "L" + _sp
    end
    if _dp != nil
        dp = "L" + _dp
    end
    _r, _sp, _dp = helper3(root.right, sv, dv, fs, fd)
    if _r != nil
        return _r
    end
    if _sp != nil
        sp = "R" + _sp
    end
    if _dp != nil
        dp = "R" + _dp
    end
    if sp != nil && dp != nil
        return "U" * sp.length + dp, nil, nil
    else
        return nil, sp, dp
    end
end
# 4

if __FILE__ == $0
    # root = TreeNode.new(1, TreeNode.new(2, nil, nil), TreeNode.new(3, nil, nil))
    # puts "#{get_directions(root, 2, 3)}"
end