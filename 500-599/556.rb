#
# @lc app=leetcode.cn id=556 lang=ruby
#
# [556] 下一个更大元素 III
#

# @lc code=start
# @param {Integer} n
# @return {Integer}
def next_greater_element(n)
    _n = n
    a = []
    while n > 0
        a.append n % 10
        n = n / 10
    end
    n = _n

    max = 0
    i = 0
    while i < a.size && a[i] >= max
        max = a[i]
        i += 1
    end

    if i < a.size
        j = 0
        while j < i
            if a[j] > a[i]
                a[i], a[j] = a[j], a[i]
                break
            end
            j += 1
        end
        a[0...i] = a[0...i].sort!{|x, y| y <=> x}
    end

    m = 0
    a.reverse.each {
        |v|
        m = m * 10 + v
    }
    if m == n || m < n || m > 0x7fffffff
        return -1
    end
    return m
end
# @lc code=end

if __FILE__ == $0
    puts "#{next_greater_element 12}"
    puts "#{next_greater_element 21}"
    puts "#{next_greater_element 123456}"
    puts "#{next_greater_element 654321}"
    puts "#{next_greater_element 230241}"
    puts "#{next_greater_element 2147483486}"
end
