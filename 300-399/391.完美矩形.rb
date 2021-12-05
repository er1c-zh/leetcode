#
# @lc app=leetcode.cn id=391 lang=ruby
#
# [391] 完美矩形
#

# @lc code=start
# @param {Integer[][]} rectangles
# @return {Boolean}
def is_rectangle_cover(rectangles)
    lines = []
    rectangles.each{
        |r|
        x1, y1, x2, y2 = r[0], r[1], r[2], r[3]
        l1, l2 = [x1, y1, y2, 1], [x2, y1, y2, 0]
        lines.append l1
        lines.append l2
    }
    lines.sort!{
        |l1, l2|
        x1, x2 = l1[0], l2[0]
        y11, y12, y21, y22 = l1[1], l1[2], l2[1], l2[2]
        f1, f2 = l1[3], l2[3]
        if x1 != x2
            x1 <=> x2
        elsif f1 != f2
            f1 <=> f2
        elsif y12 >= y21 || y22 >= y11
            y11 <=> y21
        else
            return false
        end
    }
    px = nil
    # group_list[x][flag] = [y0, y1]
    group_list = []
    lines.each{
        |l|
        x, f = l[0], l[3]
        if px == nil || px != x
            px = x
            group_list.append [[], []]
        end
        group_list[-1][f].append [l[1], l[2]]
    }
    # 左 0 右 1
    group_list.each_index{
        |i|
        group = group_list[i]
        # puts "#{group}"
        if i == 0
            yp = nil
            group[1].each{
                |l|
                if yp != nil && l[0] != yp
                    puts "f1"
                    return false
                end
                yp = l[1]
            }
        elsif i == group_list.length - 1
            yp = nil
            group[0].each{
                |l|
                if yp != nil && l[0] != yp
                    puts "f2"
                    return false
                end
                yp = l[1]
            }
        else
            u, v = 0, 0
            ll, rl = nil, nil
            while u < group[0].length && v < group[1].length
                if ll == nil && rl == nil
                    ll, rl = group[0][u], group[1][v]
                    if ll[0] != rl[0]
                        puts "f3"
                        return false
                    end
                elsif ll == nil
                    ll = group[0][u]
                elsif rl == nil
                    rl = group[1][v]
                end
                if ll[1] == rl[1]
                    ll, rl = nil, nil
                    u += 1
                    v += 1
                elsif ll[1] > rl[1]
                    rl = nil
                    v += 1
                elsif rl[1] > ll[1]
                    ll = nil
                    u += 1
                end
            end
            if u != group[0].length || v != group[1].length
                puts "f4 #{i}_#{u}_#{v}"
                return false
            end
        end
    }
    return true
end
# @lc code=end

if __FILE__ == $0
    puts "#{is_rectangle_cover [[1,1,3,3],[3,1,4,2],[3,2,4,4],[1,3,2,4],[2,3,3,4]]}"
    puts "#{is_rectangle_cover [[1,1,2,3],[1,3,2,4],[3,1,4,2],[3,2,4,4]]}"
    puts "#{is_rectangle_cover [[1,1,3,3],[3,1,4,2],[1,3,2,4],[3,2,4,4]]}"
    puts "#{is_rectangle_cover [[1,1,3,3],[3,1,4,2],[1,3,2,4],[2,2,4,4]]}"
end
