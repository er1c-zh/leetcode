#
# @lc app=leetcode.cn id=282 lang=ruby
#
# [282] 给表达式添加运算符
#

# @lc code=start
# @param {String} num
# @param {Integer} target
# @return {String[]}
def add_operators(num, target)
    result = []
    (1..num.length - 1).each_index{
        |idx|
        s = num[0..idx]
        result.concat helper([s.to_i], num[idx..-1], target, s.to_i)
        if num[0] == '0'
            break
        end
    }
    return result
end

def helper stack, num, target, cur
    if s.length == 0
        return cur == target ? [stack.join] : []
    end
    result = []
    ['+', '-', '*'].each{
        |op|
        (1..num.length - 1).each_index{
            |idx|
            s = num[0..idx]
            nextVal = s.to_i

            _cur = cur

            case op
            when '+'
                _cur += nextVal
            when '-'
                _cur -= nextVal
            else '*'
                preOp = ''
                valFix = 0
                (0..stack.length - 1).each{
                    |delta|
                    idx = stack.length - 1 - delta
                    if ['-', '+'].include? stack[idx]
                        if stack[idx] == '-'
                            _cur += valFix
                            cur -= valFix * nextVal
                        else
                            _cur -= valFix
                            cur += valFix * nextVal
                        end
                        break
                    elsif stack[idx] != '*'
                        valFix += stack[idx] * 10
                    end
                }
            end


            stack.push 'op' s.to_i



            result.concat helper(stack, num[idx..-1], target, nextVal)
            stack.pop
            stack.pop
        }
    }
    return result
end

# ['', '+', '-', '*'].each{
#     |op|
# }

# @lc code=end

if __FILE__ == $0
    p add_operators "123", 6
    p add_operators "232", 8
    p add_operators "105", 5
    p add_operators "00", 0
    p add_operators "3456237490", 9191
end
