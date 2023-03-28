#
# @lc app=leetcode.cn id=672 lang=ruby
#
# [672] 灯泡开关 Ⅱ
#

# @lc code=start
# @param {Integer} n
# @param {Integer} presses
# @return {Integer}
def flip_lights(n, presses)
    if n > 6
        n = 6
    end

    ml = [0, 0, 0, 0]

    for i in 0...n
        ml[0] = ml[0] << 1 | 1 # 全部反转
        if i % 2 == 0
            ml[1] = ml[1] << 1 | 1
            ml[2] = ml[2] << 1
        else
            ml[1] = ml[1] << 1
            ml[2] = ml[2] << 1 | 1
        end
        if i % 3 == 0
            ml[3] = ml[3] << 1 | 1
        else
            ml[3] = ml[3] << 1
        end
    end

    ml.each{
        |m|
        # puts "mask #{m.to_s 2}"
    }


    q = Hash.new
    q[0] = 1

    for i in 0...presses
        nq = Hash.new
        q.each{
            |k, v|
            ml.each{
                |mask|
                nq[k ^ mask] = 1
            }
        }
        q = nq
    end

    q.keys.each{
        |k|
        # puts "#{k.to_s 2}"
    }

    return q.length
end
# @lc code=end

if __FILE__ == $0
    puts "#{flip_lights 1, 1}"
    puts "#{flip_lights 2, 1}"
    puts "#{flip_lights 3, 1}"
end
