#
# @lc app=leetcode.cn id=678 lang=ruby
#
# [678] 有效的括号字符串
#

# @lc code=start
# @param {String} s
# @return {Boolean}
def check_valid_string(s)
    debug = false
    stack, lpIdx = [], []
    (0..s.length - 1).each{
        |idx|
        c = s[idx]
        case c
        when '('
            stack.append c
            lpIdx.append(stack.length - 1)
        when '*'
            stack.append c
        when ')'
            if stack.empty?
                return false
            end
            if debug
                puts "#{stack} #{lpIdx}"
            end
            if lpIdx.empty?
                stack.pop
            else
                lpI = lpIdx[-1]
                lpIdx.pop
                pre = []
                suf = []
                if lpI - 1 >= 0
                    pre = stack[0..lpI - 1]
                end
                if lpI + 1 < stack.length
                    suf = stack[lpI + 1..-1]
                end
                stack = pre + suf
            end
            if debug
                puts "#{stack} #{lpIdx}"
            end
        end
    }
    if debug 
        puts "#{stack}"
    end
    lpCnt = 0
    stack.each{
        |v|
        case v
        when '*'
            if lpCnt > 0
                lpCnt -= 1
            end
        when '('
            lpCnt += 1
        else
            puts "unreachable"
        end
    }
    return lpCnt == 0
end
# @lc code=end

if __FILE__ == $0
    p check_valid_string("()")
    p check_valid_string("(*)")
    p check_valid_string("(*))")
    # p check_valid_string()
end
