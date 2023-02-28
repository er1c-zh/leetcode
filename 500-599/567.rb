#
# @lc app=leetcode.cn id=567 lang=ruby
#
# [567] 字符串的排列
#

# @lc code=start
# @param {String} s1
# @param {String} s2
# @return {Boolean}
def check_inclusion(s1, s2)
    set = Hash.new{0}
    total = 0
    for i in 0...s1.size
        c = s1[i]
        if set[c] == 0
            total += 1
        end
        set[c] += 1
    end
    # puts "#{set}, #{total}"

    set_cur = Hash.new{0}
    total_cur = 0
    i, j = 0, 0 # s2 [i, j)
    while j < s2.size
        c = s2[j]
        if set_cur[c] == set[c]
            total_cur -= 1
        end
        set_cur[c] += 1
        j += 1
        if set_cur[c] == set[c]
            total_cur += 1
            if total_cur == total
                return true
            end
        end
        while set_cur[c] > set[c]
            c1 = s2[i]
            if set_cur[c1] == set[c1]
                total_cur -= 1
            end
            set_cur[c1] -= 1
            if set_cur[c1] == set[c1]
                total_cur += 1
            end
            i += 1
        end
    end
    return false
end
# @lc code=end

if __FILE__ == $0
    puts "#{check_inclusion "ab", "eidbaooo"}"
end
