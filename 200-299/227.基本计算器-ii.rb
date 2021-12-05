#
# @lc app=leetcode.cn id=227 lang=ruby
#
# [227] 基本计算器 II
#

# @lc code=start
# @param {String} s
# @return {Integer}
def calculate(s)
    stack = Array.new
    symbols = Array.new
    while s.length > 0
        lookahead = s[0]
        case lookahead
        when " "
            s = s[1..-1]
            next
        when "+", "-"
            s = s[1..-1]
            symbols = symbols.push lookahead
            next
        when "*", "/"
            s = s[1..-1]
            val, s = getInt s
            other = stack.pop
            val = lookahead == '*' ? (other * val) : (other / val)
            stack = stack.push val
            next
        else
            val, s = getInt s
            stack = stack.push val
            next
        end
    end

    result = stack[0]
    stack = stack[1..-1]
    while stack.length > 0
        other = stack[0]
        stack = stack[1..-1]
        result = symbols[0] == '+' ? (result + other) : (result - other)
        symbols = symbols[1..-1]
    end
    return result
end
def getInt(s)
    val = 0
    while s.length > 0 && s[0] == ' '
        s = s[1..-1]
    end
    while s.length > 0 && ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"].include?(s[0])
        val = val * 10 + (s[0].ord - '0'.ord)
        s = s[1..-1]
    end
    return val, s
end
# @lc code=end

