#
# @lc app=leetcode.cn id=668 lang=ruby
#
# [668] 乘法表中第k小的数
#

# @lc code=start
# @param {Integer} m
# @param {Integer} n
# @param {Integer} k
# @return {Integer}
def find_kth_number(m, n, k)
    vi, vj = 1, m*n + 1
    while true
        cv = (vi + vj) / 2
        cmax = -1
        cnt = 0
        for i in 1..m
            cnt += [cv / i, n].min
            if [cv / i * i, i * n].min > cmax
                cmax = [cv / i * i, i * n].min
            end
        end
        if cnt == k || vi == vj
            return cmax
        elsif cnt < k
            vi = cv + 1
        else
            vj = cv
        end
    end
    puts "oops!"
end

# @lc code=end

if __FILE__ == $0
    puts "#{find_kth_number 3,3,5}"
    puts "#{find_kth_number 2,3,6}"
    # puts "#{find_kth_number}"
    # puts "#{find_kth_number}"
end
