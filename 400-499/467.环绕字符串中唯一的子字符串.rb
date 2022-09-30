#
# @lc app=leetcode.cn id=467 lang=ruby
#
# [467] 环绕字符串中唯一的子字符串
#

# @lc code=start
# @param {String} p
# @return {Integer}
def find_substring_in_wrapround_string(p)
    n = p.length
    m = Hash.new{0}
    i = 0
    while i < n
        c = p[i]
        j = i + 1
        while j < n
            _c = p[j]
            if (_c.ord - p[j - 1].ord != 1) && (p[j] != 'a' || p[j - 1] != 'z')
                break
            end
            j += 1
        end
        m[c] = [m[c], j - i].max
        i += 1
        while i < j
            m[p[i]] = [m[p[i]], m[p[i - 1]] - 1].max
            i += 1
        end
        i = j
    end
    return m.values.sum
end
# @lc code=end

if __FILE__ == $0
    puts "#{find_substring_in_wrapround_string "zab"}"
    puts "#{find_substring_in_wrapround_string "cac"}"
    puts "#{find_substring_in_wrapround_string "a"}"
    # puts "#{find_substring_in_wrapround_string }"
end
