# 1
# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer[]}
def target_indices(nums, target)
    nums.sort!
    result = []
    nums.each_index{
        |i|
        if nums[i] == target
            result.append i
        end
    }
    return result
end

# 2
# @param {Integer[]} nums
# @param {Integer} k
# @return {Integer[]}
def get_averages(nums, k)
    pre = Array.new(nums.length){0}
    nums.each_index{
        |i|
        if i == 0
            pre[i] = nums[0]
        else
            pre[i] = nums[i] + pre[i - 1]
        end
    }

    result = []
    nums.each_index{
        |i|
        if i - k < 0 || i + k >= nums.length
            result.append -1
        else
            l, r = 0, pre[i + k]
            if i - k > 0
                l = pre[i - k - 1]
            end
            result.append (r - l) / (2 * k + 1)
        end
    }
    return result
end

# 3
# @param {Integer[]} nums
# @return {Integer}
def minimum_deletions(nums)
    _max, _min = nil, nil
    maxi, mini = -1, -1
    nums.each_index{
        |i|
        v = nums[i]
        if _max == nil || _max < v
            _max, maxi = v, i
        end
        if _min == nil || _min > v
            _min, mini = v, i
        end
    }
    l, r = mini, maxi
    if l > r
        l, r = r, l
    end
    if l == r
        return [l + 1, nums.length - l].min
    end

    # 从 到 的操作次数
    ll, rl, lr, rr = l + 1, nums.length - l, r + 1, nums.length - r
    puts "#{ll}, #{rl}, #{lr}, #{rr}"
    return [lr, rl, ll + rr].min
end

# 4
# @param {Integer} n
# @param {Integer[][]} meetings
# @param {Integer} first_person
# @return {Integer[]}
def find_all_people(n, meetings, first_person)
    set = Array.new(n)
    set[0], set[first_person] = true, true
    result = [0, first_person]

    meetings.sort!{
        |x, y|
        x[2] <=> y[2]
    }

    i = 0
    while i < meetings.length
        t = nil
        queueSet = Hash.new
        map = Hash.new{[]}
        while i < meetings.length && (t == nil || meetings[i][2] == t)
            meet = meetings[i]
            if t == nil
                t = meet[2]
            end
            e1, e2 = meet[0], meet[1]
            if set[e1] == true
                queueSet[e1] = true
            end
            if set[e2] == true
                queueSet[e2] = true
            end
            map[e1] = map[e1].append e2
            map[e2] = map[e2].append e1
            i += 1
        end

        queue = queueSet.keys
        while !queue.empty?
            ce = queue[0]
            queue = queue[1..-1]
            map[ce].each{
                |ne|
                if set[ne] == true
                    next
                end
                set[ne] = true
                result.append ne
                queue.append ne
            }
        end
    end

    return result
end

if __FILE__ == $0
    puts "#{find_all_people 6,[[1,2,5],[2,3,8],[1,5,10]],1}"
end