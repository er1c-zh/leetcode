#
# @lc app=leetcode.cn id=481 lang=ruby
#
# [481] 神奇字符串
#

# @lc code=start
# @param {Integer} n
# @return {Integer}
def magical_string(n)
    result = 1
    s = Array.new(n + 1)
    s[0] = 1
    s[1] = 2
    s[2] = 2
    i, j = 3, 2 # i 要插入的位置， j 这次要满足的位置
    while i < n
        v = (s[i - 1] == 1 ? 2 : 1)
        # puts "#{i}, _#{v}, #{j}=#{s[j]}, #{s}"
        if s[j] == 1
            s[i] = v
            i += 1
            j += 1
            if v == 1
                result += 1
            end
        else
            s[i] = v
            s[i + 1] = v
            i += 2
            j += 1
            if v == 1
                result += 2
            end
        end
    end
    if s[n] == 1
        result -= 1
    end

    # puts "#{s}"

    return result
end
# @lc code=end

if __FILE__ == $0
    puts "#{magical_string 7}"
    # puts "#{magical_string 6}"
    # puts "#{magical_string 1}"
end
