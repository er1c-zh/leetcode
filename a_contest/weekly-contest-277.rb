# 1
# @param {Integer[]} nums
# @return {Integer}
def count_elements(nums)
    nums.sort!
    cur = nums[0]
    while !nums.empty? && nums[0] == cur
        nums = nums[1..-1]
    end
    if nums.empty?
        return 0
    end
    cur = nums[-1]
    while !nums.empty? && nums[-1] == cur
        nums = nums[0..-2]
    end
    return nums.length
end

# 2
# @param {Integer[]} nums
# @return {Integer[]}
def rearrange_array(nums)
    po, ne = [], []
    nums.each{
        |v|
        if v > 0
            po.append v
        else
            ne.append v
        end
    }
    i = 0
    result = []
    while i < po.length
        result.append po[i]
        result.append ne[i]
        i += 1
    end
    return result
end

# 3
# @param {Integer[]} nums
# @return {Integer[]}
def find_lonely(nums)
    m = Hash.new{0}
    nums.each{
        |v|
        m[v] += 1
    }
    result = []
    nums.each{
        |v|
        if m[v] == 1 && m[v - 1] == 0 && m[v + 1] == 0
            result.append v
        end
    }
    return result
end

# 4
# @param {Integer[][]} statements
# @return {Integer}
def maximum_good(statements)
    n = statements.length
    say_good, say_bad = Array.new(n){0}, Array.new(n){0}
    statements.each_index{
        |i|
        g, b = 0, 0
        statements[i].each_index{
            |j|
            g = (g << 1)
            b = (b << 1)
            if statements[i][j] == 1
                g |= 1
            elsif statements[i][j] == 0
                b |= 1
            end
        }
        say_good[i] = g
        say_bad[i] = b
    }
    if true
        say_good.each_index{
            |i|
            puts "#{i} - #{"%05b" % say_good[i]}"
        }
        puts "==="
        say_bad.each_index{
            |i|
            puts "#{i} - #{"%05b" % say_bad[i]}"
        }
    end
    set = Hash.new
    result = 0
    statements.each_index{
        |i|
        tmp = helper4(0, n, say_good, say_bad, say_good[i], say_bad[i])
        if tmp >= 0 && tmp + 1 > result
            result = tmp + 1
        end
    }
    return result
end

def helper4(ci, n, sg, sb, csg, csb)
    puts "#{ci}, #{"%05b" % csg}, #{"%05b" % csb}"
    if ci == n - 1
        return 0
    end
    i = ci + 1
    maybe = []
    cnt = 0
    while i < n
        if (csb >> i) & 1 == 1
            i += 1
            next
        end
        if (csg >> i) & 1 == 1
            if sg[i] & csb != 0 || sb[i] & csg != 0
                # 有矛盾
                return -1
            end
            cnt += 1
            csg = csg | sg[i]
            csb = csb | sb[i]
            # 把i加进来
        elsif sg[i] & csb == 0 && sb[i] & csg == 0
            # 可选
            tmp = helper4(i, n, sg, sb, csg | sg[i], csb | sb[i])
            if tmp != -1
                maybe.append (cnt + 1 + tmp)
            end
        end
        i += 1
    end
    maybe.append cnt
    return maybe.max
end

if __FILE__ == $0
    # puts "#{maximum_good([[2,1,2],[1,2,2],[2,0,2]])}"
    # puts "#{maximum_good([[2,0],[0,2]])}"
    puts "#{maximum_good([[2,0,2,2,0],[2,2,2,1,2],[2,2,2,1,2],[1,2,0,2,2],[1,0,2,1,2]])}"
    # puts "#{maximum_good([[2,2], [2,2]])}"
end