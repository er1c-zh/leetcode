#
# @lc app=leetcode.cn id=600 lang=ruby
#
# [600] 不含连续1的非负整数
#

# @lc code=start
# @param {Integer} n
# @return {Integer}
def find_integers(n)
    s = n.to_i.to_s(2)
    l = s.size

    dp = Array.new(l + 1){0} # dp[i] i-bits number
    dp[0] = 1
    dp[1] = 2

    i = 2
    while i <= l
        dp[i] = dp[i - 1] + dp[i - 2]
        i += 1
    end

    result = 0
    i = 0
    flag = 0
    while i < l
        if flag == 2
            result += dp[l - i]
            flag = 3
            break
        elsif s[i] == '1'
            if flag == 1
                flag = 2
                i += 1
            else
                result += dp[l - 1 - i]
                flag = 1
                i += 1
            end
        else
            flag = 0
            i += 1
        end
    end
    if flag != 3
        result += 1
    end
    return result
end

def helper(n)
    for i in 0...n
        puts "#{i}, #{i.to_s 2}"
    end
end
# @lc code=end

if __FILE__ == $0
    puts "#{find_integers 2}"
    helper 10
    for i in 0...10
        puts "#{i} => #{find_integers i}"
    end
end
