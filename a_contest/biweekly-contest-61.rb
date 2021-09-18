# 1
# @param {Integer[]} nums
# @param {Integer} k
# @return {Integer}
def count_k_difference(nums, k)
    m = Hash.new{0}
    result = 0
    nums.each{
        |v|
        result += m[v]
        m[v - k] += 1
        m[v + k] += 1
    }
    return result
end

# 2
# @param {Integer[]} changed
# @return {Integer[]}
def find_original_array(changed)
    changed.sort!
    s, f, cost = 0, 0, 0
    mask = Array.new(changed.length){0}
    result = []
    while s < changed.length
        if mask[s] == 1
            s += 1
            next
        end
        while f < changed.length && (f <= s || changed[f] < changed[s] * 2)
            f += 1
        end
        if f < changed.length && changed[f] == 2 * changed[s]
            mask[f], mask[s] = 1, 1
            result.append changed[s]
            f += 1
            s += 1
            cost += 2
        else
            return []
        end
    end
    if cost != changed.length
        return []
    end
    return result
end

# 3
# @param {Integer} n
# @param {Integer[][]} rides
# @return {Integer}
def max_taxi_earnings(n, rides)
    dp = Array.new(n + 1){0} # dp[i] 开到i获得的最大收入
    m = Array.new(n + 1){Hash.new{0}} # m[to][from] 最大收入
    rides.each{
        |v|
        f, t, c = v[0], v[1], v[2]
        salary = t - f + c
        if m[t][f] < salary
            m[t][f] = salary
        end
    }
    (1..n).each{
        |dest|
        dp[dest] = dp[dest - 1]
        m[dest].keys.each{
            |src|
            cur = dp[src] + m[dest][src]
            if cur > dp[dest]
                dp[dest] = cur
            end
        }
    }
    return dp[n]
end

# 4

# @param {Integer[]} nums
# @return {Integer}
def min_operations(nums)
    _n = nums.length
    result_base = 0
    nums.sort!
    min = nums.min
    tmp = []
    nums.each_index{
        |i|
        nums[i] -= min
        if i > 0 && nums[i] == nums[i - 1]
            result_base += 1
            next
        end
        tmp.append nums[i]
    }
    nums = tmp
    n = nums.length
    s, f, base, cnt = 0, 0, 0, 0
    while f < n
        while f < n && nums[f] < nums[s] + _n
            f += 1
        end
        if f - s > cnt
            cnt = f - s
            base = s
        end
        s += 1
    end
    return result_base + n - cnt
end

if __FILE__ == $0
    # puts "#{min_operations()}"
    puts "#{min_operations([4,2,5,3])}"
    puts "#{min_operations([1,2,3,5,6])}"
    puts "#{min_operations([1,10,100,1000])}"
    puts "#{min_operations([41,33,29,33,35,26,47,24,18,28])}"
end