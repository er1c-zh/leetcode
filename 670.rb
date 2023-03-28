#
# @lc app=leetcode.cn id=670 lang=ruby
#
# [670] 最大交换
#

# @lc code=start
# @param {Integer} num
# @return {Integer}
def maximum_swap(num)
    num = num.to_s
    num = num.chars
    for i in 0...num.size
        num[i] = num[i].to_i
    end
    for i in 0...num.size
        j = num.size - 1
        tv, ti = -1, -1
        while j > i
            if tv < num[j]
                tv = num[j]
                ti = j
            end
            j -= 1
        end
        if num[i] < tv
            num[i], num[ti] = num[ti], num[i]
            break
        end
    end
    for i in 0...num.size
        num[i] = num[i].to_s
    end
    return num.join.to_i
end
# @lc code=end

if __FILE__ == $0
    puts "#{maximum_swap 2736}"
    puts "#{maximum_swap 9973}"
end
