#
# @lc app=leetcode.cn id=524 lang=ruby
#
# [524] 通过删除字母匹配到字典里最长单词
#

# @lc code=start
# @param {String} s
# @param {String[]} dictionary
# @return {String}
def find_longest_word(s, dictionary)
    dictionary.sort!{
        |x, y|
        if x.size == y.size
            x <=> y
        else
            y.size <=> x.size
        end
    }
    dictionary.each{
        |w|
        if s.size < w.size
            next
        end
        i, j = 0, 0
        while i < s.size && j < w.size
            if s[i] == w[j]
                i += 1
                j += 1
            else
                i += 1
            end
        end
        if j == w.size
            return w
        end
    }
    return ""
end
# @lc code=end

if __FILE__ == $0
    puts "#{find_longest_word "abpcplea", ["ale","apple","monkey","plea"]}"
    puts "#{find_longest_word "abpcplea", ["a","b","c"]}"
end
