#
# @lc app=leetcode.cn id=301 lang=ruby
#
# [301] 删除无效的括号
#

# @lc code=start
# @param {String} s
# @return {String[]}
def remove_invalid_parentheses(s)
    result = Hash.new
    max = 0
    helper(s, 0, 0).each{
        |v|
        if v.length > max
            max = v.length
            result[v] = true
        elsif v.length == max
            result[v] = true
        else
            next
        end
    }
    return result.keys
end

def helper(s, idx, cnt)
    if s.length == idx
        if cnt == 0
            return [s]
        else
            return []
        end
    end
    if cnt < 0
        return []
    end
    if cnt > s.length - idx
        return []
    end
    if ['(', ')'].include? s[idx]
        s1, s2 = String.new(s), String.new(s)
        if idx == 0
            s2 = s2[1..-1]
        else
            s2 = s2[0..idx - 1] + s2[idx + 1..-1]
        end
        # puts "#{s} #{s1} #{s2}, #{s.length} #{s1.length} #{s2.length}"
        return helper(s1, idx + 1, cnt + (s[idx] == '(' ? 1 : -1)).concat(helper(s2, idx, cnt))
    else
        return helper s, idx + 1, cnt
    end
end
# @lc code=end

if __FILE__ == $0
    # s = "12345"
    # p(s[0..2] + s[4..-1])
    p remove_invalid_parentheses("((((((((((((((((((((aaaaa")
end
