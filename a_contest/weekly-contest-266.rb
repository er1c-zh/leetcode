# 1
# @param {String} word
# @return {Integer}
def count_vowel_substrings(word)
    m = Hash.new()
    m['a'] = true
    m['e'] = true
    m['i'] = true
    m['o'] = true
    m['u'] = true
    cnt = 0
    l = word.length
    set = Hash.new(){0}
    has = 0
    fast, slow = 0, 0
    while fast < l
        ok = true
        while ok && has < 5 && fast < l
            cur = word[fast]
            if m[cur]
                if set[cur] == 0
                    has += 1
                end
                set[cur] += 1
            else
                ok = false
            end
            fast += 1
        end
        if !ok
            slow = fast
            set = Hash.new(){0}
            has = 0
            next
        end
        if has < 5
            break
        end
        cur_cnt = 1
        cnt += 1
        k = fast
        while k < l
            tmp = word[k]
            if m[tmp]
                cnt += 1
                cur_cnt += 1
            else
                break
            end
            k += 1
        end
        while slow < l
            tmp = word[slow]
            set[tmp] -= 1
            if set[tmp] == 0
                has -= 1
                slow += 1
                break
            else
                cnt += cur_cnt
            end
            slow += 1
        end
    end
    return cnt
end

# 2
# @param {String} word
# @return {Integer}
def count_vowels(word)
    l = word.length
    prefix = Array.new(l + 1){0}
    m = Hash.new()
    m['a'] = true
    m['e'] = true
    m['i'] = true
    m['o'] = true
    m['u'] = true
    cnt = 0
    (0..l - 1).each{
        |i|
        if !m[word[i]]
            next
        end
        _l = [i + 1, l - i].min
        cnt += _l * l - (_l - 1) * (_l)
    }
    return cnt
end

# 3
# @param {Integer} n
# @param {Integer[]} quantities
# @return {Integer}
def minimized_maximum(n, quantities)
    m = quantities.length
    cache = Array.new(m){Array.new{n + 1}} # 给 第i个商品j个商店的数量
    i = 0
    while i < m
        j = 1
        while j <= n - m
            cache[i][j] = quantities[i] / j
            if quantities[i] % j != 0
                cache[i][j] += 1
            end
        end
    end
end

# 4

if __FILE__ == $0
    puts "#{count_vowel_substrings "aeiouu"}"
    puts "#{count_vowel_substrings "unicornarihan"}"
    puts "#{count_vowel_substrings "cuaieuouac"}"
    puts "#{count_vowel_substrings "bbaeixoubb"}"
    puts "#{count_vowel_substrings "poazaeuioauoiioaouuouaui"}"
    puts "#{count_vowel_substrings "aaaaaaaaaaaaaioueeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee"}"
end