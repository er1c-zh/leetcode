#
# @lc app=leetcode.cn id=241 lang=ruby
#
# [241] 为运算表达式设计优先级
#

# @lc code=start
# @param {String} expression
# @return {Integer[]}
def diff_ways_to_compute(expression)
    h = Helper.new
    return h.helper expression, 0, expression.length
end

class Helper
    attr_accessor :cache
    def initialize()
        @cache = Hash.new{
            |h, k|
            h[k] = Hash.new
        }
    end

    def helper(expression, i, j)
        if j - i < 0
            return Array.new
        end
        if @cache[i][j] != nil
            return @cache[i][j]
        end
        @cache[i][j] = Array.new

        result = Array.new

        _split = Array.new

        from = 0
        _exp = expression[i..j]
        for idx in 0.._exp.length-1
            if ['-', '+', '*'].include? _exp[idx]
                _split = _split.append _exp[from..idx - 1], _exp[idx..idx]
                from = idx + 1
            end
        end
        _split = _split.append _exp[from.. _exp.length - 1]
        if _split.length == 1
            v = _split[0].to_i 10
            result = result.append v
        elsif _split.length >= 3
            Array(i..j).each{
                |idx|
                if ['+', '-', '*'].include? expression[idx]
                    lval = self.helper(expression, i, (idx - 1))
                    rval = self.helper(expression, idx + 1, j)
                    lval.each{
                        |l|
                        rval.each{
                            |r|
                            v = 0
                            case expression[idx]
                            when '+'
                                v = l + r
                            when '-'
                                v = l - r
                            else '*'
                                v = l * r
                            end
                            result = result.append v
                        }
                    }
                end
            }
        else
            puts "====#{_split}"
            p "unreachable"
        end


        # result.each{
        #     |key, value|
        #     @cache[i][j] = @cache[i][j].append key
        # }
        @cache[i][j] = result

        return @cache[i][j]
    end
end
# @lc code=end

