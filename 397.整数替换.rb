#
# @lc app=leetcode.cn id=397 lang=ruby
#
# [397] 整数替换
#

# @lc code=start
# @param {Integer} n
# @return {Integer}
def integer_replacement(n)
    if n == 1
        return 0
    end
    set = Hash.new
    queue = [n]
    result = 0
    while !queue.empty?
        result += 1
        nq = []
        queue.each{
            |cur|
            if cur & 0b1 == 0
                _n = cur >> 1
                if _n == 1
                    return result
                else
                    if set[_n] == nil
                        nq.append _n
                        set[_n] = true
                    end
                end
            else
                _n1, _n2 = cur + 1, cur - 1
                [_n1, _n2].each{
                    |v|
                    if v == 1
                        return result
                    else
                        if set[v] == nil
                            nq.append v
                            set[v] = true
                        end
                    end
                }
            end
        }
        queue = nq
    end
    return result
end
# @lc code=end

if __FILE__ == $0
    puts "#{integer_replacement 8}"
    puts "#{integer_replacement 7}"
    puts "#{integer_replacement 4}"
end
