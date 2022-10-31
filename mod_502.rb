#
# @lc app=leetcode.cn id=502 lang=ruby
#
# [502] IPO
#

# @lc code=start
# @param {Integer} k
# @param {Integer} w
# @param {Integer[]} profits
# @param {Integer[]} capital
# @return {Integer}
def find_maximized_capital(k, w, profits, capital)
    list = Array.new
    for i in 0...profits.size
        list.push([profits[i], capital[i]])
    end
    list.sort! {
        |a, b|
        a[1] <=> b[1]
    }

    h = MaxHeap.new
    i = 0
    while k > 0
        while i < capital.size && w >= list[i][1]
            h.push list[i][0]
            i += 1
        end
        if h.size == 0
            return w
        end
        k -= 1
        w += h.pop
    end

    return w
end
# @lc code=end

if __FILE__ == $0
    puts "#{find_maximized_capital(2, 0, [1,2,3], [0,1,1])}"
end
