#
# @lc app=leetcode.cn id=438 lang=ruby
#
# [438] 找到字符串中所有字母异位词
#

# @lc code=start
# @param {String} s
# @param {String} p
# @return {Integer[]}
def find_anagrams(s, p)
    if p.length > s.length
        return []
    end
    temp = Hash.new{0}
    cur = Hash.new{0}
    equal_sum = 26
    (0..p.length - 1).each{
        |i|
        if temp[p[i]] == 0
            equal_sum -= 1
        end
        temp[p[i]] += 1
    }
    (0..p.length - 1).each{
        |i|
        if cur[s[i]] == temp[s[i]]
            equal_sum -= 1
        end
        cur[s[i]] += 1
        if cur[s[i]] == temp[s[i]]
            equal_sum += 1
        end
    }
    i = 0
    result = []
    while i + p.length - 1 < s.length
        if equal_sum == 26
            result.append i
        end
        _i = i + 1
        _j = _i + p.length - 1
        if _j < s.length
            c1, c2 = s[i], s[_j]
            if cur[c1] == temp[c1]
                equal_sum -= 1
            end
            cur[c1] -= 1
            if cur[c1] == temp[c1]
                equal_sum += 1
            end

            if cur[c2] == temp[c2]
                equal_sum -= 1
            end
            cur[c2] += 1
            if cur[c2] == temp[c2]
                equal_sum += 1
            end
        end

        i += 1
    end
    return result
end
# @lc code=end

