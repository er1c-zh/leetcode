#
# @lc app=leetcode.cn id=336 lang=ruby
#
# [336] 回文对
#

# @lc code=start
# @param {String[]} words
# @return {Integer[][]}
def palindrome_pairs(words)
    debug = false
    m = Hash.new
    words.each_index{
        |i|
        m[words[i]] = i
    }
    result = Hash.new
    words.each_index{
        |i|
        w = words[i]
        wr = w.reverse
        
        if m[""] != nil && m[""] != i
            if w == wr
                result[[i, m[""]]] = true
                result[[m[""], i]] = true
            end
        end

        (0..w.length - 1).each{
            |j|
            k = w.length - 1 - j

            idxI, idxJ = i, m[wr[k..-1]]
            if debug
                puts "1 #{wr[k..-1]}"
            end
            if idxJ != nil && idxI != idxJ
                good = true
                _i, _j = j + 1, w.length - 1
                while _i <= _j
                    if w[_i] != w[_j]
                        good = false
                        break
                    end
                    _i += 1
                    _j -= 1
                end
                if good
                    result[[idxI, idxJ]] = true
                end
            end
            idxI, idxJ = i, m[wr[0..k]]
            if debug
                puts "2 #{wr[0..k]}, #{idxI} #{idxJ}"
            end
            if idxJ != nil && idxI != idxJ
                good = true
                _i, _j = 0, j - 1
                while _i <= _j
                    if w[_i] != w[_j]
                        good = false
                        break
                    end
                    _i += 1
                    _j -= 1
                end
                if good
                    result[[idxJ, idxI]] = true
                end
            end
        }
    }
    return result.keys
end
# @lc code=end

if __FILE__ == $0
    # p palindrome_pairs(["lls", "s"])
    p palindrome_pairs(["abcd","dcba","lls","s","sssll"])
    p palindrome_pairs(["bat","tab","cat"])
    p palindrome_pairs(["a",""])
    # p palindrome_pairs()
end
