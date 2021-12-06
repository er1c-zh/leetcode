#
# @lc app=leetcode.cn id=402 lang=ruby
#
# [402] 移掉 K 位数字
#

# @lc code=start
# @param {String} num
# @param {Integer} k
# @return {String}
def remove_kdigits(num, k)
    l = num.length
    k = num.length - k
    # 现在是保留k个
    if k == 0
        return "0"
    end
    set = Hash.new{0}
    curMin = nil
    slow, fast = 0, 0
    while l - fast >= k
        v = num[fast]
        set[v] += 1
        if curMin == nil || curMin > v
            curMin = v
        end
        fast += 1
    end
    result = ""
    while k > 0
        v = num[slow]
        if slow + 1 == fast
            # 必选剩下所有了
            result += num[slow..-1]
            break
        elsif v == curMin
            result += v
            k -= 1
            set[v] -= 1
            if fast < l
                set[num[fast]] += 1
                if num[fast] < curMin
                    curMin = num[fast]
                end
                fast += 1
            end
            if set[curMin] == 0
                next_min = (curMin.to_i + 1).to_s
                while next_min <= '9'
                    if set[next_min] > 0
                        curMin = next_min
                        break
                    end
                    next_min = (next_min.to_i + 1).to_s
                end
            end
        else
            set[v] -= 1
        end
        slow += 1
    end

    return result.to_i.to_s
end
# @lc code=end

if __FILE__ == $0
    puts "#{remove_kdigits "1432219", 3}"
    puts "#{remove_kdigits "10200", 1}"
    puts "#{remove_kdigits "10", 2}"
    puts "#{remove_kdigits "112", 1}"
    # puts "#{remove_kdigits "", 3}"
end
