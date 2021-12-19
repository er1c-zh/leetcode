# 1
# @param {String[]} words
# @return {String}
def first_palindrome(words)
    words.each{
        |v|
        if v == v.reverse
            return v
        end
    }
    return ""
end

# 2
# @param {String} s
# @param {Integer[]} spaces
# @return {String}
def add_spaces(s, spaces)
    result = Array.new(s.length + spaces.length){""}
    i, j, k = 0, 0, 0
    while i < s.length
        if i == spaces[j]
            result[k] = " "
            j += 1
            k += 1
            result[k] = s[i]
        else
            result[k] = s[i]
        end
        i += 1
        k += 1
    end
    return result.join ""
end

# 3
# @param {Integer[]} prices
# @return {Integer}
def get_descent_periods(prices)
    n = prices.length
    dp = Array.new(n){0}
    prices.each_index{
        |i|
        if i == 0
            dp[i] = 1
        else
            if prices[i] - prices[i - 1] == -1
                dp[i] = 1 + dp[i - 1]
            else
                dp[i] = 1
            end
        end
    }
    return dp.sum
end

# 4
# @param {Integer[]} arr
# @param {Integer} k
# @return {Integer}
def k_increasing(arr, k)
    total = 0
    n = arr.length
    per_max = n / k
    mindp = Array.new(n){n + 1}
    arr.each_index{
        |i|
        i = n - 1 - i
        if i + k < n && mindp[i + k] < arr[i]
            mindp[i] = [arr[i + k], mindp[i + k]].min
        end
    }

    result = 0
    dp = Array.new(n){Array.new(n){per_max}}
    arr.each_index{
        |i|
        tr = 0
        if i - k < 0
            ni = i + k
            if ni < n
                (mindp[i]..n).each{
                    |v|
                    dp[i][v] = arr[i] >= v ? 0 : 1
                }
            else
                # do nothing
            end
        else
            pi = i - k
            ni = i + k
            if ni < n
                (mindp[i]..n).each{
                    |v|
                    dp[i][v] = dp[pi][v]
                    dp[i][v] += arr[i] >= v ? 0 : 1
                }
            else
                tr = [dp[pi][arr[i]], dp[pi][-1] + 1].min
            end
        end
    }

end

if __FILE__ == $0
    # puts "#{k_increasing [5,4,3,2,1], 1}"
    # puts "#{k_increasing [4,1,5,2,6,2], 2}"
    puts "#{k_increasing [12,6,12,6,14,2,13,17,3,8,11,7,4,11,18,8,8,3], 1}"
end