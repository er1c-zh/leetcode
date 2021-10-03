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
    cache = Array.new(s.length + 1){0}
    (0..s.length - 1).each{
        |i|
        i = s.length - 1 - i
        cache[i] = cache[i + 1] + (s[i] == letter ? 1 : 0)
    }
    return helper(s, 0, k, letter, repetition, cache)
end

def helper(s, i, k, letter, repetition, cache)
    if i >= s.length
        return ""
    end
    if repetition > cache[i]
        return ""
    end
    if s.length - i == k
        return s[i..-1]
    end
    ok = s[i] == letter ? 1 : 0
    v1 = helper(s, i + 1, k, letter, repetition, cache)
    v2 = s[i]
    if k > 1
        tmp = helper(s, i + 1, k - 1, letter, repetition - ok, cache)
        if tmp == ""
            v2 = ""
        elsif
            v2 += tmp
        end
    else
        if repetition - ok > 0
            v2 = ""
        end
    end
    if v1 == ""
        return v2
    elsif v2 == ""
        return v1
    else
        return [v1, v2].min
    end
end

if __FILE__ == $0
end