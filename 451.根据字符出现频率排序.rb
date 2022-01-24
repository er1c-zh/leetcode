#
# @lc app=leetcode.cn id=451 lang=ruby
#
# [451] 根据字符出现频率排序
#

# @lc code=start
# @param {String} s
# @return {String}
def frequency_sort(s)
    m = Hash.new{0}
    s.chars.each{
        |c|
        m[c] += 1
    }
    tmp = []
    m.keys.each{
        |c|
        cnt = m[c]
        tmp.append [cnt, c]
    }
    result = ""
    tmp.sort{
        |x, y|
        y[0] <=> x[0]
    }.each{
        |v|
        (0..v[0] - 1).each{
            result += v[1]
        }
    }
    return result
end
# @lc code=end

if __FILE__ == $0
    puts "#{frequency_sort("tree")}"
end
