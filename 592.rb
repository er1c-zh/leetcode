#
# @lc app=leetcode.cn id=592 lang=ruby
#
# [592] 分数加减运算
#

# @lc code=start
# @param {String} expression
# @return {String}
def fraction_addition(expression)
    l = []
    # 0 +/-
    # 1 num1
    # 2 /
    # 3 num2
    state = 0
    i = 0
    cur = []
    while i < expression.size
        c = expression[i]
        if state == 0
            if c != '-' && c != '+'
                c = '+'
            else
                i += 1
            end
            if c == '+'
                c = 1
            else
                c = -1
            end
            cur = cur.append c
        elsif state == 2
            i += 1
        else
            j = i + 1
            while j < expression.size
                if '0' > expression[j] || expression[j] > '9'
                    break
                end
                c += expression[j]
                j += 1
            end
            cur = cur.append c.to_i
            if state == 3
                l = l.append cur
                cur = []
            end
            i = j
        end
        state += 1
        state = state % 4
    end
    v = [1, 0, 1]
    for _v in l
        v = cal(v, _v)
    end
    gcd = v[1].gcd(v[2])
    v[1] = v[1] / gcd
    v[2] = v[2] / gcd
    return (v[0] < 0 ? '-' : '') + v[1].to_s + '/' + v[2].to_s
end

def cal(v1, v2)
    # denominator
    numer1, numer2 = v1[1], v2[1]
    deno1, deno2 = v1[2], v2[2]
    deno = (deno1 * deno2) / (deno1.gcd(deno2))
    numer = v1[0] * numer1 * deno / deno1 + v2[0] * numer2 * deno / deno2
    if numer < 0
        return [-1, -numer, deno]
    else
        return [1, numer, deno]
    end
end

# @lc code=end

if __FILE__ == $0
    puts "#{fraction_addition("-1/2+1/2")}"
    puts "#{fraction_addition("-1/2+1/2+1/3")}"
    puts "#{fraction_addition("1/3-1/2")}"
end
