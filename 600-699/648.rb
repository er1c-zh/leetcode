#
# @lc app=leetcode.cn id=648 lang=ruby
#
# [648] 单词替换
#

# @lc code=start
# @param {String[]} dictionary
# @param {String} sentence
# @return {String}
def replace_words(dictionary, sentence)
    t = Hash.new{nil}
    for r in dictionary
        cur = t
        for i in 0..r.size
            c = r[i]
            if cur[c] == nil
                cur[c] = [nil, Hash.new{nil}]
            end
            if i + 1 == r.size
                cur[c][0] = r
            end
            cur = cur[c][1]
        end
    end

    l = sentence.split(" ")
    result = ""
    for w in l
        cur = t
        root = w
        for i in 0..w.size
            c = w[i]
            if cur[c] == nil
                break
            end
            if cur[c][0] != nil
                root = cur[c][0]
                break
            end
            cur = cur[c][1]
        end
        if result != ""
            result += " "
        end
        result += root
    end
    return result
end
# @lc code=end

if __FILE__ == $0
    puts "#{replace_words ["cat","bat","rat"], "the cattle was rattled by the battery"}"
    puts "#{replace_words ["a","b","c"], "aadsfasf absbs bbab cadsfafs"}"
    puts "#{replace_words ["catt","cat","bat","rat"], "the cattle was rattled by the battery"}"
end
