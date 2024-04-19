#
# @lc app=leetcode.cn id=640 lang=ruby
#
# [640] 求解方程
#

# @lc code=start
# @param {String} equation
# @return {String}
def solve_equation(equation)
    k = 0
    b = 0

    t = equation.split '='
    l, r = t[0], t[1]
    for i in 0...r.size
        if r[i] == '+'
            r[i] = '-'
        elsif r[i] == '-'
            r[i] = '+'
        end
    end
    if r[0] != '-' && r[0] != '+'
        r = '-' + r
    end

    equation = l + r
    buf = ""
    for i in 0...equation.size
        c = equation[i]
        if c == '-' || c == '+'
            tk, tb = helper(buf)
            k += tk
            b += tb
            buf = "" + c
        else
            buf += c
        end
    end
    tk, tb = helper(buf)
    k += tk
    b += tb

    if k == 0 && b == 0
        return "Infinite solutions"
    end
    if k == 0 && b != 0
        return "No solution"
    end
    return "x=" + (-b / k).to_i.to_s
end

def helper(s)
    _s = s
    if s == ""
        return 0, 0
    end
    is_minus = 1
    k, b = 0, 0
    if s[0] == "-"
        is_minus = -1
    end
    if s[0] == '-' || s[0] == '+'
        s = s[1..-1]
    end
    n = s.size
    if s[-1] == "x"
        s = s[0..-2]
        if s == ""
            k = 1
        else
            k = s.to_i
        end
    else
        b = s.to_i
    end
    # puts "#{_s},  #{k * is_minus}, #{b * is_minus}"
    return k * is_minus, b * is_minus
end

# @lc code=end

if __FILE__ == $0
    puts "#{solve_equation("x+5-3+x=6+x-2")}"
    puts "#{solve_equation("x=x")}"
    puts "#{solve_equation("2x=x")}"
    puts "#{solve_equation("x=x+1")}"
    # puts "#{solve_equation('x+5-3+x=6+x-2')}"
end
