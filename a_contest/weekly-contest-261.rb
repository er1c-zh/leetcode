# 1
# @param {String} s
# @return {Integer}
def minimum_moves(s)
    i = 0
    result = 0
    while i < s.length
        if s[i] == 'X'
            result += 1
            i += 3
        else
            i += 1
        end
    end
    return result
end

# 2
# @param {Integer[]} rolls
# @param {Integer} mean
# @param {Integer} n
# @return {Integer[]}
def missing_rolls(rolls, mean, n)
    target = mean * (n + rolls.length) - rolls.sum
    result = []
    each = target / n
    delta = target - each * n
    if each <= 0 
        return result
    elsif (each == 6 && delta > 0) || each > 6
        return result
    else
        (0..n - 1).each{
            |i|
            if i < delta
                result.append(each + 1)
            else
                result.append(each)
            end
        }
        return result
    end
end

# 3
# @param {Integer[]} stones
# @return {Boolean}
def stone_game_ix(stones)
    cnt = Array.new(3){0}
    stones.each {
        |v|
        cnt[v % 3] += 1
    }
    p cnt
    if (cnt[1] == 0 && cnt[2] < 3) || (cnt[1] < 3 && cnt[2] == 0)
        return false
    end
    return (cnt[0] % 2 == 0 && (cnt[1] > 0 && cnt[2] > 0)) || (cnt[0] % 2 == 1 && (cnt[1] - cnt[2]).abs >= 3)
end

# 4
# @param {String} s
# @param {Integer} k
# @param {Character} letter
# @param {Integer} repetition
# @return {String}
def smallest_subsequence(s, k, letter, repetition)
    n = s.length
    dp = Array.new(repetition + 1){Array.new(k + 1){nil}} # dp[i][j] 上个下标的重复至少i次letter，长度为j的子序列

    dp[0][0] = ""
    (0..n-1).each{
        |i|
        c = s[i]
        ndp = Array.new(repetition + 1){Array.new(k + 1){nil}}
        ndp[0][0] = ""
        dp.each_index{
            |r|
            round = 0
            dp[r].each_index{
                |l|
                if round > 1
                    break
                end
                l = k - l
                if l == 0
                    next
                end
                ndp[r][l] = dp[r][l]
                if dp[r][l] == nil
                    # 前面没能满足
                    if dp[r][l - 1] != nil
                        ndp[r][l] = dp[r][l - 1] + c
                    end
                    if c == letter && dp[r - 1][l - 1] != nil
                        ndp[r][l] = dp[r - 1][l - 1] + c
                    end
                else
                    if dp[r][l - 1] != nil && dp[r][l - 1] + c < ndp[r][l]
                        ndp[r][l] = dp[r][l - 1] + c
                    end
                    if c == letter && dp[r - 1][l - 1] != nil && dp[r - 1][l - 1] + c < ndp[r][l]
                        ndp[r][l] = dp[r - 1][l - 1] + c
                    end
                end
                if ndp[r][l] != nil
                    round += 1
                end
            }
        }
        dp = ndp
    }

    if false
        dp.each_index{
            |r|
            dp[r].each_index{
                |l|
                puts "#{r}_#{l}_#{dp[r][l]}"
            }
        }
    end

    return dp[repetition][k]
end

if __FILE__ == $0
    # puts "#{smallest_subsequence("leet", 3, "e", 1)}"
    puts "#{smallest_subsequence("aaabbbcccddd", 3, "b", 2)}"
    # puts "#{smallest_subsequence("", , "", )}"
end