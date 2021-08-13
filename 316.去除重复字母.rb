#
# @lc app=leetcode.cn id=316 lang=ruby
#
# [316] 去除重复字母
#

# @lc code=start
# @param {String} s
# @return {String}
def remove_duplicate_letters(s)
    stack, m, has = Array.new, Hash.new{0}, Hash.new
    (0..s.length-1).each{
        |idx|
        m[s[idx]] += 1
    }
    # p m
    (0..s.length-1).each{
        |idx|

        # puts "stack: #{stack}"

        c = s[idx]
        if has[c] != nil
            m[c] -= 1
            next
        end
        while !stack.empty?
            p = stack[-1]
            if m[p] < 1 || p.ord < c.ord
                break
            end
            stack.pop
            has[p] = nil
        end
        stack.push c
        has[c] = true
        m[c] -= 1
    }
    return stack.join("")
end
# @lc code=end

