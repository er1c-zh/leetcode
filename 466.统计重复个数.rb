#
# @lc app=leetcode.cn id=466 lang=ruby
#
# [466] 统计重复个数
#

# @lc code=start
# @param {String} s1
# @param {Integer} n1
# @param {String} s2
# @param {Integer} n2
# @return {Integer}
def get_max_repetitions(s1, n1, s2, n2)
    l1, l2 = s1.length, s2.length
    # cache[i][j]
    cache = Array.new(l1){Array.new(l2)}
    c1, c2 = 0, 0
    i, j = 0, 0
    seg = nil
    # s1 s2从头开始匹配
    # 寻找一个循环
    # i j 分别代表s1 s2的一个中的offset
    while c1 <= n1
        if s1[i] == s2[j]
            if cache[i][j] != nil
                # 如果之前在s1[i] s2[j]已经匹配过了
                # 表示从s1[i] s2[j]开始
                # 每 c1 - c1' 个s1 能匹配c2 - c2'个s2
                seg = [i, j, cache[i][j], [c1, c2]]
                break
            end
            cache[i][j] = [c1, c2] # s1[i] -> s2[j]第一次的匹配过的个数
            j += 1
            if j == l2
                j = 0
                c2 += 1
            end
        end
        i += 1
        if i == l1
            i = 0
            c1 += 1
        end
    end
    if seg == nil
        # 没有循环节
        # 匹配了多少就返回多少
        return c2 / n2
    end

    puts "#{seg}"
    # 先消耗seg[2][0]个s1 从 seg[0]
    #      seg[2][1]个s2 从 seg[1]
    # 开始匹配
    # 寻找n1 - seg[2][0] 个s1能匹配多少个s2
    seg_c1 = seg[3][0] - seg[2][0]
    seg_c2 = seg[3][1] - seg[2][1]
    cnt_mid = (n1 - seg[2][0] - (seg[0] == 0 ? 0 : 1)) / seg_c1

    c2_pre = seg[2][1]
    c2_mid = cnt_mid * seg_c2
    c2_suf = 0

    c1 = seg[2][0] + seg_c1 * cnt_mid
    c2 = seg[2][1] + seg_c2 * cnt_mid
    i, j = seg[0], seg[1]
    while c1 < n1
        while i < l1
            if s1[i] == s2[j]
                i += 1
                j += 1
                if j == l2
                    j = 0
                    c2_suf += 1
                end
            else
                i += 1
            end
        end
        i = 0
        c1 += 1
    end

    c2_total = c2_pre + c2_mid + c2_suf

    puts "#{c2_pre}, #{c2_mid}, #{c2_suf}"

    return c2_total / n2
end
# @lc code=end

if __FILE__ == $0
    puts "#{get_max_repetitions "acb", 4, "ab", 2}"
    puts "#{get_max_repetitions "acb", 1, "acb", 1}"
    puts "#{get_max_repetitions "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa" ,1000000 ,"a" ,1000000}"
    puts "#{get_max_repetitions "ecbafedcba", 3, "abcdef", 1}"
    puts "#{get_max_repetitions "nlhqgllunmelayl", 2, "lnl", 1}"
end

def get_max_repetitions_tle(s1, n1, s2, n2)
    ls1 = s1.length
    # 计算s1[i][char] 的最近下标
    next_char = Array.new(ls1 + 1){Hash.new}
    (0..ls1 - 1).each{
        |i|
        i = ls1 - 1 - i
        next_char[i] = next_char[i + 1].clone
        next_char[i][s1[i]] = i
    }
    # 计算从s1[i] 开始 匹配 s2 的结束的个数和offset
    match = Array.new(ls1)
    (0..ls1 - 1).each{
        |i|
        cost = 0
        offset = i
        s2.each_char{
            |c|
            ni = next_char[offset][c]
            if ni == nil
                cost += 1
                offset = 0
                ni = next_char[offset][c]
                if ni == nil
                    # 不可能匹配成功
                    return 0
                end
            end
            offset = ni + 1
            if offset > ls1 - 1
                offset -= ls1
                cost += 1
            end
        }
        match[i]= [cost, offset]
    }
    i, offset = 0, 0
    s2_cnt = 0
    while i < n1
        cost, ni = match[offset]
        if i + cost >= n1 && ni > 0
            break
        end
        i += cost
        offset = ni
        s2_cnt += 1
    end
    return s2_cnt / n2
end
