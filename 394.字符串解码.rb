#
# @lc app=leetcode.cn id=394 lang=ruby
#
# [394] 字符串解码
#

# @lc code=start
# @param {String} s
# @return {String}
def decode_string(s)
    r, _ = helper(s, 0)
    return r
end
def helper(s, i)
    result = ""
    cur = 0
    while i < s.length
        case s[i]
        when '['
            tmp, i = helper(s, i + 1)
            result += tmp * cur
            cur = 0
        when ']'
            return result, i + 1
        when '0', '1', '2', '3', '4', '5', '6', '7', '8', '9'
            cur = cur * 10 + s[i].to_i
            i += 1
        else
            result += s[i]
            i += 1
        end
    end
    return result, i
end
# @lc code=end

if __FILE__ == $0
    puts "#{decode_string "3[a]2[bc]"}"
    puts "#{decode_string "3[a2[c]]"}"
    puts "#{decode_string "2[abc]3[cd]ef"}"
    puts "#{decode_string "abc3[cd]xyz"}"
    puts "#{decode_string "100[a]"}"
end
