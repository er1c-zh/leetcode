#
# @lc app=leetcode.cn id=331 lang=ruby
#
# [331] 验证二叉树的前序序列化
#

# @lc code=start
# @param {String} preorder
# @return {Boolean}
def is_valid_serialization(preorder)
    l = preorder.split(",")
    ok, i = helper(l, 0)
    if i < l.length
        return false
    end
    return ok
end
def helper(l, i)
    if i >= l.length 
        return false, i
    end
    if l[i] == "#"
        return true, i + 1
    end
    i += 1
    ok, i = helper(l, i)
    if !ok
        return false, i
    end
    return helper(l, i)
end
# @lc code=end

if __FILE__ == $0
    p is_valid_serialization("9,3,4,#,#,1,#,#,2,#,6,#,#")
    p is_valid_serialization("1,#")
    p is_valid_serialization("9,#,#,1")
    # p is_valid_serialization()
end
