#
# @lc app=leetcode.cn id=522 lang=ruby
#
# [522] 最长特殊序列 II
#

# @lc code=start
# @param {String[]} strs
# @return {Integer}
def find_lu_slength(strs)
    strs.sort!{
        |x, y|
        if y.size == x.size
            y <=> x
        else
            y.size <=> x.size
        end
    }
    all_m = Hash.new{0}
    strs.each{
        |w|
        all_m[w] += 1
    }
    m = Hash.new{0}


    strs.each{
        |w|
        if all_m[w] > 1
            m[w] += 1
            next
        end
        is_duplicated = false

        m.keys.each{
            |k|
            i, j = 0, 0
            while i < k.size && j < w.size
                if k[i] == w[j]
                    i += 1
                    j += 1
                else
                    i += 1
                end
            end
            if j >= w.size
                is_duplicated = true
                break
            end
        }
        if !is_duplicated
            return w.size
        end
        m[w] += 1
    }
    return -1
end
# @lc code=end

if __FILE__ == $0
    puts "#{find_lu_slength ["aba", "cdc", "eae"]}"
    puts "#{find_lu_slength ["aaa", "aaa", "aa"]}"
end
