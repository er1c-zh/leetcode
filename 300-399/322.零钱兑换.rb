#
# @lc app=leetcode.cn id=322 lang=ruby
#
# [322] 零钱兑换
#

# @lc code=start
# @param {Integer[]} coins
# @param {Integer} amount
# @return {Integer}
def coin_change(coins, amount)
    # bfs
    round = 0
    mask = Hash.new

    q = [0]
    while !q.empty?
        h = Hash.new
        q.each{
            |v|
            if v == amount
                return round
            end
            coins.each{
                |d|
                _v = d + v
                if mask[_v] != nil
                    next
                end
                if _v <= amount
                    h[_v] = true
                    mask[_v] = true
                end
            }
        }
        q = h.keys
        round += 1
    end

    return -1
end
# @lc code=end

if __FILE__ == $0
    p coin_change([1, 2, 5], 11)
    p coin_change([2], 3)
    p coin_change([1], 0)
    p coin_change([1], 1)
    p coin_change([1], 2)
    p coin_change([370,417,408,156,143,434,168,83,177,280,117], 9953)
    # p coin_change()
end
