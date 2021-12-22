#
# @lc app=leetcode.cn id=423 lang=ruby
#
# [423] 从英文中重建数字
#

# @lc code=start
# @param {String} s
# @return {String}
def original_digits(s)
    mapper = []
    mapper.append ["zero", "z", 0]
    mapper.append ["two", "w", 2]
    mapper.append ["eight", "g", 8]
    mapper.append ["three", "h", 3]
    mapper.append ["four", "r", 4]
    mapper.append ["six", "x", 6]
    mapper.append ["five", "f", 5]
    mapper.append ["one", "o", 1]
    mapper.append ["seven", "v", 7]
    mapper.append ["nine", "i", 9]

    cnt = Hash.new{0}
    (0..s.length-1).each{
        |i|
        c = s[i]
        cnt[c] += 1
    }
    result = Array.new(10){0}
    mapper.each{
        |item|
        c = cnt[item[1]]
        (0..item[0].length - 1).each{
            |i|
            cnt[item[0][i]] -= c
        }
        result[item[2]] = c
    }
    r = ""
    result.each_index{
        |i|
        r += (i.to_s) * result[i]
    }
    return r
end
# @lc code=end

if __FILE__ == $0
    puts "#{original_digits "owoztneoer"}"
    puts "#{original_digits "nnei"}"
    # puts "#{original_digits ""}"
end
