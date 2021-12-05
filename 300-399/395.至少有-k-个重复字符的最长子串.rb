#
# @lc app=leetcode.cn id=395 lang=ruby
#
# [395] 至少有 K 个重复字符的最长子串
#

# @lc code=start
# @param {String} s
# @param {Integer} k
# @return {Integer}
def longest_substring(s, k)
    m = Hash.new{0}
    toDel = Hash.new
    (0..s.length - 1).each{
        |i|
        m[s[i]] += 1
        if m[s[i]] < k
            toDel[s[i]] = true
        else
            toDel.delete s[i]
        end
    }

    if toDel.keys.empty?
        return s.length
    end

    result = 0
    pre = 0
    (0..s.length - 1).each{
        |i|
        if toDel[s[i]] != nil || i == s.length - 1
            from, to = pre, i - (i == s.length - 1 && toDel[s[i]] == nil ? 0 : 1)
            if to - from + 1 > result
                tmp = longest_substring(s[from..to], k)
                if tmp > result
                    result = tmp
                end
            end
            pre = i + 1
        end
    }

    return result
end
# @lc code=end

if __FILE__ == $0
    puts "#{longest_substring("aaabb", 3)}"
    puts "#{longest_substring("ababbc", 2)}"
    puts "#{longest_substring("bbaaacbd", 3)}"
end
