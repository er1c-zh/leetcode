# 1
# @param {String[]} operations
# @return {Integer}
def final_value_after_operations(operations)
    result = 0
    operations.each{
        |op|
        case op
        when "++X", "X++"
            result += 1
        else
            result -= 1
        end
    }
    return result
end

# 2
# @param {Integer[]} nums
# @return {Integer}
def sum_of_beauties(nums)
    n = nums.length
    min, max = Array.new(n){10e5 + 1}, Array.new(n){0}
    min[n - 1], max[0] = nums[n - 1], nums[0]
    (1..n - 1).each{
        |d|
        _minI, _maxI = n - 1 - d, d
        min[_minI] = [min[_minI + 1], nums[_minI]].min
        max[_maxI] = [max[_maxI - 1], nums[_maxI]].max
    }
    r = 0
    (1..n-2).each{
        |i|
        v = nums[i]
        if v < min[i + 1] && v > max[i - 1]
            r += 2
        elsif v < nums[i + 1] && v > nums[i - 1]
            r += 1
        end
    }
    return r
end

# 3
class DetectSquares
    attr_accessor :mx, :my
    def initialize()
        @mx, @my = Hash.new{|h, k| h[k] = Hash.new(0)}, Hash.new{|h, k| h[k] = Hash.new(0)}
    end


=begin
    :type point: Integer[]
    :rtype: Void
=end
    def add(point)
        x, y = point[0], point[1]
        @mx[x][y] += 1
        @my[y][x] += 1
    end


=begin
    :type point: Integer[]
    :rtype: Integer
=end
    def count(point)
        c = 0
        x, y = point[0], point[1]
        @mx[x].keys.each{
            |_y|
            cnt = 1
            x1, y1 = x, _y
            d = (y1 - _y).abs
            cnt *= @mx[x1][y1]
            c += cnt * @mx[x1 + d][y1] * @mx[x + d][y]
            c += cnt * @mx[x1 - d][y1] * @mx[x - d][y]
        }
        return c
    end

end

# Your DetectSquares object will be instantiated and called as such:
# obj = DetectSquares.new()
# obj.add(point)
# param_2 = obj.count(point)

# 4
# @param {String} s
# @param {Integer} k
# @return {String}
def longest_subsequence_repeated_k(s, k)
    n = s.length
    m = Array.new(n)
    tmp = Hash.new(-1)
    (0..n - 1).each{
        |i|
        i = n - 1 - i
        m[i] = tmp.clone
        tmp[s[i]] = i
    }

    queue = []

    result = ""
    tmp = Hash.new(){|h, k| h[k] = []}
    (0..n-1).each{
        |i|
        tmp[s[i]].append [i, i]
    }
    tmp.keys.each{
        |c|
        if tmp[c].length < k
            next
        end
        if c > result
            result = c
        end
        queue.append([c, tmp[c]])
    }

    while !queue.empty?
        item = queue[0]
        queue = queue[1..-1]
        pre = item[0]
        l = item[1]
        ('a'..'z').each{
            |c|

            npre = pre + c

            q = [[0, []]]
            while !q.empty?
                _c = q[0]
                q = q[1..-1]

                i = _c[0]
                nl = _c[1]

                while i < l.length
                    if l.length - i + nl.length < k
                        break
                    end
                    f, t = l[i][0], l[i][1]
                    nt = m[t][c]
                    if nt == -1
                        break
                    end

                    while i + 1 < l.length && nt >= l[i + 1][0]
                        # 有交叉时去掉自己 从l[i+1]重跑这个任务
                        q.append([i + 1, nl.clone])
                        # 或去掉后面的
                        i += 1
                    end
                    nl.append([f, nt])
                    i += 1
                end
                if nl.length < k
                    next
                end
                queue.push([npre, nl])
                if npre.length > result.length || (npre.length == result.length && npre > result)
                    result = npre
                end
            end
        }
    end

    return result
end

if __FILE__ == $0
    puts "#{longest_subsequence_repeated_k("abcdefabcdef", 2)}"
    puts "#{longest_subsequence_repeated_k("ajancknajnknajntknajnknajnbkn", 5)}"
    # puts "#{longest_subsequence_repeated_k()}"
    puts "#{longest_subsequence_repeated_k("exhmepeeeeeekeeetelqyeeeeudtdsjeeyeweeeeekqeizesieqnddzeaefqeyeeezesxfreveeeeyeeeseregoneiftemerujfveysezkeeiofsbeeerheueeehedkluoedeeemeweeekeefeqaleb",65)}"
    puts "#{longest_subsequence_repeated_k("vptwvlvcmptwvlvptwvlvptrwvlvptwvlvptwrvlvptwvlvpktwivlvptwovlcpvptwvlvptwvlvptwvlvputwvlvfptwvlvptwkvlvptwvlvptwvlvhptwavlqvptswvlwvptwvlvptwvlvpotowvl", 22)}"
end