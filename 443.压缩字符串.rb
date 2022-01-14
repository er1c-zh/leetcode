#
# @lc app=leetcode.cn id=443 lang=ruby
#
# [443] 压缩字符串
#

# @lc code=start
# @param {Character[]} chars
# @return {Integer}
def compress(chars)
    s, f = 0, 0
    pre = nil
    cnt = 0
    while f <= chars.length
        c = chars[f]
        if c != pre || f == chars.length
            if pre != nil
                chars[s] = pre
                s += 1
                if cnt > 1
                    cnt.to_s.chars.each{
                        |_c|
                        chars[s] = _c
                        s += 1
                    }
                end
            end
            if f == chars.length
                break
            end
            pre = c
            cnt = 1
        else
            cnt += 1
        end
        f += 1
    end
    # puts "#{chars[0..s-1]}"
    return s
end
# @lc code=end

if __FILE__ == $0
    puts "#{compress(["a","a","b","b","c","c","c"])}"
    puts "#{compress(["a"])}"
    puts "#{compress(["a","b","b","b","b","b","b","b","b","b","b","b","b"])}"
    puts "#{compress(["a","b","b","b","b","b","b","b","b","b","b","b","b"])}"
end
