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
    return helper Array.new, num, target
end

def helper stack, s, target
    if s == ''
        if target == eval(stack)
            return [stack.join]
        else
            return []
        end
    end
    result = Array.new
    ['', '+', '-', '*'].each{
        |op|
        if op == ''
            stack.push s[0]
            result = result.concat(helper(stack, s[1..-1], target))
            stack.pop
        elsif s.length > 1
            stack.push(s[0], op)
            result = result.concat helper(stack, s[1..-1], target)
            stack.pop
            stack.pop
        end
    }
    return result
end

def eval opList
    # p opList
    val = 0
    stack = Array.new

    cur = nil
    opList.each{
        |op|
        if ['-', '+', '*'].include? op
            stack.push cur, op
            cur = nil
        else
            if cur == 0
                # illegal expr
                return nil
            end
            cur = cur == nil ? op.to_i : cur * 10 + op.to_i
        end
    }
    if cur != nil
        stack.push cur
    end

    # p stack

    stackNumber, stackAction = Array.new, Array.new

    stack.each{
        |v|
        if ['-', '+', '*'].include? v
            while !stackAction.empty?
                if v == '*' && stackAction[-1] != '*'
                    break
                end
                stackNumber.push stackAction.pop
            end
            stackAction.push v
        else
            stackNumber.push v
        end
    }

    while stackAction.length > 0
        stackNumber.push stackAction.pop
    end

    # p stackNumber

    stack = Array.new

    stackNumber.each{
        |v|
        if ['-', '+', '*'].include? v
            case v
            when '-'
                stack.push(- stack.pop + stack.pop)
            when '+'
                stack.push(stack.pop + stack.pop)
            else
                stack.push(stack.pop * stack.pop)
            end
        else
            stack.push v
        end
    }

    if stack.length != 1
        p "unreachable eval"
    end
    return stack[0]
end
# @lc code=end

if __FILE__ == $0
    p add_operators "123", 6
    p add_operators "232", 8
    p add_operators "105", 5
    p add_operators "00", 0
    p add_operators "3456237490", 9191
end
