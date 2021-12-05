#
# @lc app=leetcode.cn id=318 lang=ruby
#
# [318] 最大单词长度乘积
#

# @lc code=start
# @param {String[]} words
# @return {Integer}
def max_product(words)
    m = Hash.new
    words.each{
        |w|
        cur = 0
        (0..w.length-1).each{
            |idx|
            cur |= (1 << (w[idx].ord - 'a'.ord))
        }
        m[w] = cur
    }
    if false
        m.each_key{
            |k|
            puts "#{k} => #{m[k].to_s(2)}"
        }
    end
    result = 0
    words.each{
        |w1|
        words.each{
            |w2|
            if m[w1] & m[w2] != 0
                next
            end
            if w1.length * w2.length > result
                result = w1.length * w2.length
            end
        }
    }
    return result
end
# @lc code=end

