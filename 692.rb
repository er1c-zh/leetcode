#
# @lc app=leetcode.cn id=692 lang=ruby
#
# [692] 前K个高频单词
#

# @lc code=start
# @param {String[]} words
# @param {Integer} k
# @return {String[]}
def top_k_frequent(words, k)
    n = words.size
    m = Hash.new{0}
    words.each{
        |w|
        m[w] += 1
    }

    result = Array.new
    m.keys.each{
        |w|
        c = m[w]
        # find index to insert
        i, j = 0, result.size
        while i < j
            mid = (i + j) / 2
            wm = result[mid]
            cm = m[wm]
            if cm > c || (cm == c && ((wm <=> w) == -1))
                i = mid + 1
            else
                j = mid
            end
        end

        # puts "#{w}(#{c}) -> #{result}[#{i},#{j}]"
        if i == 0
            result = [w] + result
        elsif i == result.size
            result += [w]
        else
            result = result[0..i - 1] + [w] + result[i..-1]
        end
    }
    return result[0...k]
end
# @lc code=end

if __FILE__ == $0
    puts "#{top_k_frequent ["i", "love", "leetcode", "i", "love", "coding"], 2}"
    puts "#{top_k_frequent ["the", "day", "is", "sunny", "the", "the", "the", "sunny", "is", "is"], 4}"
    puts "#{top_k_frequent ["the", "day", "is", "sunny", "the", "the", "the", "sunny", "is", "is"], 3}"
    puts "#{top_k_frequent ["aaa", "aa", "a"], 1}"
    # puts "#{top_k_frequent }"
end
