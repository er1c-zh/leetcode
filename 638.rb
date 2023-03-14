#
# @lc app=leetcode.cn id=638 lang=ruby
#
# [638] 大礼包
#

# @lc code=start
# @param {Integer[]} price
# @param {Integer[][]} special
# @param {Integer[]} needs
# @return {Integer}
def shopping_offers(price, special, needs)
    return helper(price, special, 0, needs, Hash.new{Hash.new{nil}})
end
def ck(n)
    k = 0
    for i in 0...n.size
        k *= 11
        k += n[i]
    end
    return k
end
def helper(price, special, idx, needs, cache)
    cache_key = ck(needs)
    if cache[cache_key][idx] != nil
        return cache[cache_key][idx]
    end
    n = price.size
    if idx >= special.size
        sum = 0
        for i in 0...n
            sum += needs[i] * price[i]
        end
        return sum
    end
    max_key = 1e9
    for i in 0...n
        if special[idx][i] == 0
            next
        end
        k = needs[i] / special[idx][i]
        if max_key > k
            max_key = k
        end
    end
    result = 1e9
    k = 0
    overflow = false
    for k in 0...max_key + 1
        tmp = special[idx][n] * k
        nn = needs.dup
        for i in 0...n
            nn[i] -= special[idx][i] * k
        end
        tmp += helper(price, special, idx + 1, nn, cache)
        if tmp < result
            result = tmp
        end
        k += 1
    end

    cache[cache_key] = cache[cache_key]
    cache[cache_key][idx] = result

    return result
end
# @lc code=end

if __FILE__ == $0
    # price = [2,5], special = [[3,0,5],[1,2,10]], needs = [3,2]
    # 输出：14
    puts "#{shopping_offers([2, 5], [[3,0,5],[1,2,10]], [3, 2])}"
    puts "#{shopping_offers([2, 3, 4], [[1,1,0,4],[2,2,1,9]], [1,2,1])}"
    puts "#{shopping_offers([9,9], [[1,1,1]], [2,2])}"
    puts "#{shopping_offers([2,2], [[1,1,1],[1,1,2],[1,1,3],[1,1,4],[1,1,5],[1,1,6],[1,1,7],[1,1,8],[1,1,9],[1,1,10],[1,1,11],[1,1,12],[1,1,13],[1,1,14],[1,1,15]], [10,10])}"
    
end
