# 1
# @param {Integer[]} nums
# @param {Integer} k
# @return {Integer[]}
def max_subsequence(nums, k)
    set = Hash.new{0}
    nums.sort{
        |x, y|
        y <=> x
    }.each{
        |v|
        if k == 0
            break
        end
        set[v] += 1
        k -= 1
    }
    result = []
    nums.each{
        |v|
        if set[v] > 0
            result.append v
            set[v] -= 1
        end
    }
    return result
end

# 2
# @param {Integer[]} security
# @param {Integer} time
# @return {Integer[]}
def good_days_to_rob_bank(security, time)
    l = security.length
    preSub = Array.new(l){0}
    sufAdd = Array.new(l){0}
    security.each_index{
        |i|
        if i == 0
            preSub[i] = 0
        else
            if security[i] <= security[i - 1] 
                preSub[i] = 1 + preSub[i - 1]
            else
                preSub[i] = 0
            end
        end
    }
    security.each_index{
        |i|
        i = l - 1 - i
        if i == l -1
            sufAdd[i] = 0
        else
            if security[i] <= security[i + 1]
                sufAdd[i] = 1 + sufAdd[i + 1]
            else
                sufAdd[i] = 0
            end
        end
    }
    result = []
    security.each_index{
        |i|
        if i - time >= 0 && i + time < l && preSub[i] >= time && sufAdd[i] >= time
            result.append i
        end
    }
    return result
end

# 3
# @param {Integer[][]} bombs
# @return {Integer}
def maximum_detonation(bombs)
    cache = Hash.new
    bombs.each_index{
        |i|
        from = bombs[i]
        x1, y1, r = from[0], from[1], from[2]
        cache[i] = Hash.new
        bombs.each_index{
            |j|
            to = bombs[j]
            x2, y2 = to[0], to[1]
            if (x1 - x2) ** 2 + (y1 - y2) ** 2 <= r ** 2
                cache[i][j] = true
            end
        }
    }
    result = 0
    bombs.each_index{
        |i|
        tmp = helper3(cache, i)
        if tmp > result
            result = tmp
        end
    }
    return result
end
def helper3(cache, from)
    set = Hash.new
    set[from] = true
    queue = [from]
    result = 1
    while !queue.empty?
        cur = queue[0]
        queue = queue[1..-1]
        cache[cur].keys.each{
            |to|
            if set[to] == nil
                queue.append to
                set[to] = true
                result += 1
            end
        }
    end
    return result
end

# 4
class SORTracker
    attr_accessor :idx
    def initialize()
        @idx = -1
        @list = []
    end


=begin
    :type name: String
    :type score: Integer
    :rtype: Void
=end
    def add(name, score)
        if @list.length == 0
            @list.append [score, name]
            return
        end
        i, j = 0, @list.length
        while i < j
            mid = (i + j) / 2
            v = @list[mid]
            if v[0] > score || (v[0] == score && v[1] < name)
                i = mid + 1
            else
                j = mid
            end
        end
        if i == @list.length
            @list.append [score, name]
        elsif i == 0
            @list = [[score, name]] + @list
        else
            @list = @list[0..i - 1] + [[score, name]] + @list[i..-1]
        end
    end


=begin
    :rtype: String
=end
    def get()
        @idx += 1
        return @list[@idx][1]
    end


end

# Your SORTracker object will be instantiated and called as such:
# obj = SORTracker.new()
# obj.add(name, score)
# param_2 = obj.get()

if __FILE__ == $0
    # puts "#{maximum_detonation([[2,1,3],[6,1,4]])}"
    puts "#{maximum_detonation([[1,1,100000],[100000,100000,1]])}"
    # puts "#{maximum_detonation()}"
    puts "#{2 * ((100000 - 1) * (100000 - 1)) - (100000 * 100000)}"
end