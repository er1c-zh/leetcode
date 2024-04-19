#
# @lc app=leetcode.cn id=686 lang=ruby
#
# [686] 重复叠加字符串匹配
#

# @lc code=start
# @param {String} a
# @param {String} b
# @return {Integer}
def repeated_string_match(a, b)
    n, m = a.size, b.size
    sa, sb = Hash.new, Hash.new
    for i in 0...n
        sa[a[i]] = 1
    end
    for i in 0...m
        sb[b[i]] = 1
    end
    for k in sb.keys
        if sa[k] == nil
            return -1
        end
    end


    for i in 0...n
        result = 1
        j = 0
        err = false
        while j < m
            if a[(i + j) % n] != b[j]
                err = true
                break
            end
            j += 1
        end
        if !err
            return (i + j) / n + ((i + j) % n == 0 ? 0 : 1)
        end
    end
    return -1
end
# @lc code=end

if __FILE__ == $0
    puts "#{repeated_string_match "abcd", "cdabcdab"}"
    puts "#{repeated_string_match "a", "aa"}"
    puts "#{repeated_string_match "a", "a"}"
    puts "#{repeated_string_match "abc", "wxyz"}"
    puts "#{repeated_string_match "abcabcabcabc", "abac"}"
    puts "#{repeated_string_match "abcd", "bc"}"
end
