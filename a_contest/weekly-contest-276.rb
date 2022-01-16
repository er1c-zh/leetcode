# 1
# @param {String} s
# @param {Integer} k
# @param {Character} fill
# @return {String[]}
def divide_string(s, k, fill)
    i = 0
    while i < (s.length % k)
        s += fill
        i += 1
    end
    result = []
    i = 0
    while i < s.length
        result.append s[i, k]
        i += k
    end
    return result
end

# 2
# @param {Integer} target
# @param {Integer} max_doubles
# @return {Integer}
def min_moves(target, max_doubles)
    result = 0
    while target > 1
        if max_doubles == 0
            result += target - 1
            break
        end
        if target % 2 == 1
            target -= 1
            result += 1
        else
            target /= 2
            result += 1
            max_doubles -= 1
        end
    end
    return result
end

# 3
# @param {Integer[][]} questions
# @return {Integer}
def most_points(questions)
    result = 0
    n = questions.length
    dp = Array.new(n){0} # dp[i] 从[i到结束可拿的最大值

    questions.each_index{
        |i|
        i = questions.length - 1 - i
        score = questions[i][0]
        cost = questions[i][1]

        if i == questions.length - 1
            dp[i] = score
        else
            dp[i] = dp[i + 1]
            tmp = score
            if i + cost + 1 < questions.length
                tmp = score + dp[i + cost + 1]
            end
            if tmp > dp[i]
                dp[i] = tmp
            end
        end
        if dp[i] > result
            result = dp[i]
        end
    }
    return result
end

# 4
# @param {Integer} n
# @param {Integer[]} batteries
# @return {Integer}
def max_run_time(n, batteries)
    batteries.sort!
    delta = batteries[n..-1].sum
end

if __FILE__ == $0
end