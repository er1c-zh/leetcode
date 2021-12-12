# 1
# @param {String} rings
# @return {Integer}
def count_points(rings)
    set = Hash.new
    i = 0
    while i < rings.length
        color = rings[i]
        item = rings[i + 1]
        if set[item] == nil
            set[item] = Hash.new{0}
        end
        set[item][color] += 1
        i += 2
    end
    result = 0
    set.keys.each{
        |i|
        if set[i] != nil && set[i].keys.length == 3
            result += 1
        end
    }
    return result
end

# 2
# @param {Integer[]} nums
# @return {Integer}
def sub_array_ranges(nums)
    n = nums.length
    i = 0
    result = 0
    pMax, pMin = nil, nil
    while i < n
        j = i
        while j < n
            cur = nums[j]
            _min, _max = cur, cur
            if j != i && pMax > cur
                _max = pMax
            else
                pMax = _max
            end
            if j != i && pMin < cur
                _min = pMin
            else
                pMin = _min
            end
            result += _max - _min
            j += 1
        end
        i += 1
    end
    return result
end

# 3
# @param {Integer[]} plants
# @param {Integer} capacity_a
# @param {Integer} capacity_b
# @return {Integer}
def minimum_refill(plants, capacity_a, capacity_b)
    i, j = 0, plants.length - 1
    result = 0
    ca, cb = capacity_a, capacity_b
    while i < j
        if plants[i] <= ca
            ca -= plants[i]
        else
            ca = capacity_a - plants[i]
            result += 1
        end
        i += 1
        if plants[j] <= cb
            cb -= plants[j]
        else
            cb = capacity_b - plants[j]
            result += 1
        end
        j -= 1
    end
    if i == j
        c = ca
        if ca < cb
            c = cb
        end
        if c < plants[i]
            result += 1
        end
    end
    return result
end

# 4
# @param {Integer[][]} fruits
# @param {Integer} start_pos
# @param {Integer} k
# @return {Integer}
def max_total_fruits(fruits, start_pos, k)
    ps = Array.new(fruits[-1][0] + 1){0}
    i, j = 0, 0
    while i < ps.length
        if i != 0
            ps[i] = ps[i - 1]
        end
        if i == fruits[j][0]
            ps[i] += fruits[j][1]
            j += 1
        end
        i += 1
    end
    result = 0
    delta = 0
    while delta <= k / 3
        ll, lr = start_pos - delta, start_pos + (k - 2 * delta)
        rl, rr = start_pos - (k - 2 * delta), start_pos + delta
        [[ll, lr], [rl,rr]].each{
            |_case|
            l, r = _case[0] - 1, _case[1]
            vl , vr = 0, 0
            if l >= ps.length
                vl = ps[-1]
            elsif l <= 0
                vl = 0
            else
                vl = ps[l]
            end
            if r >= ps.length
                vr = ps[-1]
            elsif r <= 0
                vr = 0
            else
                vr = ps[r]
            end
            if vr - vl > result
                result = vr - vl
            end
        }
        delta += 1
    end

    return result
end

if __FILE__ == $0
    puts "#{max_total_fruits [[2,8],[6,3],[8,6]], 5, 4}"
    puts "#{max_total_fruits [[200000,10000]] ,200000 ,200000}"
end