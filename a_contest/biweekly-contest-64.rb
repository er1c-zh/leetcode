# 1
# @param {String[]} arr
# @param {Integer} k
# @return {String}
def kth_distinct(arr, k)
    set = Hash.new(){0}
    arr.each{
        |v|
        set[v] += 1
    }
    arr.each{
        |v|
        if set[v] == 1
            if k == 1
                return v
            end
            k -= 1
        end
    }
    return ""
end

# 2
# @param {Integer[][]} events
# @return {Integer}
def max_two_events(events)
    fs = events.sort{
        |x, y|
        x[1] <=> y[1]
    }
    ss = events.sort{
        |x, y|
        x[0] <=> y[0]
    }
    result = 0
    fsi, ssi = 0, 0
    biggest = 0
    while ssi < ss.length
        while fs[fsi][1] < ss[ssi][0]
            if fs[fsi][2] > biggest
                biggest = fs[fsi][2]
            end
            fsi += 1
        end
        cur = biggest + ss[ssi][2]
        if cur > result
            result = cur
        end
        ssi += 1
    end
    return result
end

# 3
# @param {String} s
# @param {Integer[][]} queries
# @return {Integer[]}
def plates_between_candles(s, queries)
    l = s.length
    plateCnt = Array.new(l){0} # [0..i]
    kindlePreIdx = Array.new(l){nil} # [0..i] 最近的蜡烛
    kindleAfterIdx = Array.new(l){nil} # [i..-1] 最近的蜡烛
    plateCnt[0] = s[0] == '*' ? 1 : 0
    if s[0] == '|'
        kindlePreIdx[0] = 0
        kindleAfterIdx[0] = 0
    end
    (1..l-1).each{
        |i|
        plateCnt[i] = plateCnt[i - 1] + (s[i] == '*' ? 1 : 0)
        kindlePreIdx[i] = kindlePreIdx[i - 1]
        if s[i] == '|'
            kindlePreIdx[i] = i
            j = i
            while j >= 0 && kindleAfterIdx[j] == nil
                kindleAfterIdx[j] = i
                j -= 1
            end
        end
    }
    # puts "#{kindlePreIdx}"
    # puts "#{kindleAfterIdx}"
    result = []
    queries.each{
        |q|
        s, e = kindleAfterIdx[q[0]], kindlePreIdx[q[1]]
        if s == nil || e == nil || s >= e
            result.append 0
        else
            result.append plateCnt[e - 1] - plateCnt[s]
        end
    }
    return result
end

# 4
# @param {String[]} pieces
# @param {Integer[][]} positions
# @return {Integer}
def count_combinations(pieces, positions)
    return helper(pieces, positions, [])
end

def helper(pieces, positions, list)
    if pieces.length == 0
        delta = 0
        allDone = false
        while delta < 9 && !allDone
            allDone = true
            nmask = '0000000000000000000000000000000000000000000000000000000000000000'
            list.each{
                |a|
                if a[4] < delta
                    nx, ny = a[0] + a[2] * a[4], a[1] + a[3] * a[4]
                else
                    allDone = false
                    nx, ny = a[0] + a[2] * delta, a[1] + a[3] * delta
                end
                if nmask[(nx - 1) * 8 + (ny - 1)] != '0'
                    return 0
                end
                nmask[(nx - 1) * 8 + (ny - 1)] = '1'
            }
            delta += 1
        end
        return 1
    end

    action = Hash.new()
    action['rook'] = [[1, 0], [0, 1], [-1, 0], [0, -1]]
    action['bishop'] = [[1, 1], [1, -1], [-1, 1], [-1, -1]]
    action['queen'] = action['rook'] + action['bishop']

    result = 0

    pos = positions[0]
    x, y = pos[0], pos[1]

    result += helper(pieces[1..-1], positions[1..-1], list + [[x, y, 0, 0, 0]])

    action[pieces[0]].each{
        |a|
        (1..8).each{
            |delta|
            _x, _y = x + delta * a[0], y + delta * a[1]
            if _x < 1 || _x > 8 || _y < 1 || _y > 8
                break
            end
            result += helper(pieces[1..-1], positions[1..-1], list + [[x, y, a[0], a[1], delta]])
        }
    }
    return result
end

if __FILE__ == $0
    # puts "#{max_two_events([[1,3,2],[4,5,2],[2,4,3]])}"
    # puts "#{max_two_events([[1,3,2],[4,5,2],[1,5,5]])}"
    # puts "#{max_two_events([[1,5,3],[1,5,1],[6,6,5]])}"
    # puts "#{max_two_events()}"
    # puts "#{plates_between_candles("**|**|***|", [[2,5],[5,9]])}"
    # puts "#{plates_between_candles("***|**|*****|**||**|*", [[1,17],[4,5],[14,17],[5,11],[15,16]])}"
    # puts "#{plates_between_candles()}"
    # puts "#{count_combinations(['rook'], [[1, 1]])}"
    # puts "#{count_combinations(['queen'], [[1, 1]])}"
    # puts "#{count_combinations(['bishop'], [[4, 3]])}"
    puts "#{count_combinations(['rook', 'rook'], [[1, 1], [8, 8]])}"
    puts "#{count_combinations(["queen","bishop"], [[5,7], [3,4]])}"
    puts "#{count_combinations(["bishop","rook"], [[8,5],[7,7]])}"
    puts "#{count_combinations(["rook","queen","rook","rook"], [[3,8],[6,8],[5,3],[2,3]])}"
    # puts "#{count_combinations()}"
end