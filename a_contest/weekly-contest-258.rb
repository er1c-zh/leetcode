# 1
# @param {String} word
# @param {Character} ch
# @return {String}
def reverse_prefix(word, ch)
    i, j = 0, 0
    while j < word.length
        if word[j] == ch
            break
        end
        j += 1
    end
    if j < word.length
        while i < j
            word[i], word[j] = word[j], word[i]
            i += 1
            j -= 1
        end
    end
    return word
end

# 2
def interchangeable_rectangles(rectangles)
    result = 0
    _m = Hash.new{0}

    rectangles.each{
        |v|
        v1, v2 = v[0], v[1]
        m, n = v1, v2
        while n > 0
            m, n = n, m % n
        end
        k = (v1 / m).to_i.to_s + '-' + (v2 / m).to_i.to_s
        result += _m[k]
        _m[k] += 1
    }

    return result
end

# 3
# @param {String} s
# @return {Integer}
def max_product(s)
    result = helper("", 0, 0, s)

    # puts "#{result}"

    cache = Hash.new

    result.each{
        |v|
        c = 0
        (0..11).each{
            |i|
            _p = 0b1 << i
            c += (v & _p) > 0 ? 1 : 0
        }
        cache[v] = c
    }

    r = 0
    result.each{
        |v1|
        result.each{
            |v2|
            if v1 & v2 != 0
                next
            end
            c1, c2 = cache[v1], cache[v2]
            if c1 * c2 > r
                r = c1 * c2
            end
        }
    }
    return r
end

def helper(prefix, bin, i, s)
    result = []

    if i >= s.length
        return result
    end
    c = s[i]
    now = prefix + c
    if now == now.reverse
        result.append(bin | (0b1 << i))
    end

    result += helper(prefix, bin, i + 1, s)
    result += helper(prefix + c, (bin | (0b1 << i)), i + 1, s)
    return result
end

# 4
def smallest_missing_value_subtree(parents, nums)
    debug = true
    cnt = Array.new(parents.length){0} # cnt[i] i的子节点数量
    children = Array.new(parents.length){[]}
    parents.each_index{
        |child|
        parent = parents[child]
        if parent < 0
            next
        end
        cnt[parent] += 1
        children[parent].append(child)
    }

    if debug && false
        puts "cnt #{cnt}"
        puts "children #{children}"
    end

    queue = []
    (0..parents.length-1).each{
        |node|
        if cnt[node] == 0
            queue.append(node)
        end
    }
    result = []
    map = Hash.new{[]}
    while !queue.empty?
        cur = queue[0]
        queue = queue[1..-1]
        parent = parents[cur]
        cnt[parent] -= 1
        if cnt[parent] == 0
            queue.append(parent)
        end
        ## merge children
        tasks = [[[nums[cur], nums[cur]]]]
        children[cur].each{
            |child|
            tasks.append(map[child])
        }

        while tasks.length > 2
            nt = []
            (0..tasks.length/2).each{
                |idx|
                i, j = 2 * idx, 2 * idx + 1
                if j >= tasks.length
                    if i < tasks.length
                        nt.append tasks[i]
                    end
                    break
                end
                range, _ = helper4(tasks[i], tasks[j])
                nt.append(range)
            }
            tasks = nt
        end
        if tasks.length == 1
            tasks.append(tasks[0])
        end

        range, min = helper4(tasks[0], tasks[1])

        map[cur] = range
        result[cur] = min
    end

    return result
end

def helper4(v1, v2)
    min, result = 1, []
    i, j = 0, 0
    while true
        if i >= v1.length && j >= v2.length
            break
        end
        c1, c2, c = nil, nil, nil
        if i < v1.length
            c1 = v1[i]
        end
        if j < v2.length
            c2 = v2[j]
        end
        if c2 == nil || (c1 != nil && c1[0] < c2[0])
            c = c1
            i += 1
        elsif c1 == nil || c1[0] >= c2[0]
            c = c2
            j += 1
        end

        if result.length == 0
            result.append c
        else
            before = result[-1]
            if before[1] + 1 < c[0]
                result.append c
            else
                result[-1][1] = c[1]
            end
        end
        if min >= result[-1][0]
            min = result[-1][1] + 1
        end
    end
    return result, min
end

if __FILE__ == $0
    # puts "#{interchangeable_rectangles([[4,8],[3,6],[10,20],[15,30]])}"
    # puts "#{max_product("aaaaaaaaaaaa")}"
    # puts "#{smallest_missing_value_subtree([-1,0,0,2], [1,2,3,4])}"
end