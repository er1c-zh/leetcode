#
# @lc app=leetcode.cn id=393 lang=ruby
#
# [393] UTF-8 编码验证
#

# @lc code=start
# @param {Integer[]} data
# @return {Boolean}
def valid_utf8(data)
    pre = [
        "",
        "0",
        "00",
        "000",
        "0000",
        "00000",
        "000000",
        "0000000",
        "00000000",
    ]
    data.each_index{
        |i|
        data[i] = data[i].to_s 2
        if data[i].length < 8
            data[i] = pre[8 - data[i].length] + data[i]
        elsif data[i].length > 8
            puts "unexpected"
            return false
        end
    }
    i = 0
    while i < data.length
        v = data[i]
        l = 0
        j = 0
        while j < 5
            if v[j] == "1"
                l += 1
            else
                break
            end
            j += 1
        end
        if l != 0 && l != 2 && l != 3 && l != 4
            # puts "2"
            return false
        end
        i += 1
        j -= 1
        while j > 0
            if i < data.length && data[i][0] == "1" && data[i][1] == "0"
                i += 1
                j -= 1
            else
                # puts "1"
                return false
            end
        end
    end
    return true
end
# @lc code=end

if __FILE__ == $0
    puts "#{valid_utf8 [197,130,1]}"
    puts "#{valid_utf8 [235, 140, 4]}"
    puts "#{valid_utf8 [250,145,145,145,145]}"
end
