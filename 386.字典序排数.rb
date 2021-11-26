#
# @lc app=leetcode.cn id=386 lang=ruby
#
# [386] 字典序排数
#

# @lc code=start
# @param {Integer} n
# @return {Integer[]}
def lexical_order(n)
    result = []
    cur = 0
    while result.length < n
        cur = helper(cur, n)
        result.append cur
    end
    return result
end
def helper(pre, n)
    if pre == 0
        return 1
    end
    cur = pre
    if cur * 10 <= n
        return cur * 10
    end
    cur += 1
    while cur % 10 == 0
        cur /= 10
    end
    if cur > n
        cur = cur / 10 + 1
    end
    while cur % 10 == 0
        cur /= 10
    end
    return cur
end
# @lc code=end

if __FILE__ == $0
    puts "#{lexical_order 13}"
    puts "#{lexical_order 10}"
    puts "#{lexical_order 100}"
    puts "#{lexical_order 192}"
    puts "#{lexical_order 14959}"
end
