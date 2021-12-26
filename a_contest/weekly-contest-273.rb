# 1
# @param {Integer} num
# @return {Boolean}
def is_same_after_reversals(num)
    return num.to_s.reverse.to_i.to_s.reverse.to_i == num
end

# 2
# @param {Integer} n
# @param {Integer[]} start_pos
# @param {String} s
# @return {Integer[]}
def execute_instructions(n, start_pos, s)
    act_map = Hash.new
    act_map["U"] = [-1, 0]
    act_map["D"] = [1, 0]
    act_map["L"] = [0, -1]
    act_map["R"] = [0, 1]
    i = 0
    result = []
    while i < s.length
        j = i
        cnt = 0
        x, y = start_pos[0], start_pos[1]
        while j < s.length
            if j >= s.length
                j = j % s.length
            end
            d = act_map[s[j]]
            nx, ny = x + d[0], y + d[1]
            if nx < 0 || nx >= n || ny < 0 || ny >= n
                break
            end
            x, y = nx, ny
            j += 1
            cnt += 1
        end
        result.append cnt
        i += 1
    end

    return result
end

# 3
# @param {Integer[]} arr
# @return {Integer[]}
def get_distances(arr)
    n = arr.length
    dpl, dpr = Array.new(n){0}, Array.new(n){0}

    preMapL, preMapR = Hash.new, Hash.new
    # 计算左边的
    arr.each_index{
        |i|
        v = arr[i]
        if preMapL[v] == nil
            dpl[i] = 0
            preMapL[v] = [1, i]
        else
            pre = preMapL[v]
            dpl[i] = pre[0] * (i - pre[1]) + dpl[pre[1]]
            preMapL[v] = [pre[0] + 1, i]
        end
    }
    # 计算右边的
    arr.each_index{
        |i|
        i = n - 1 - i
        v = arr[i]
        if preMapR[v] == nil
            dpr[i] = 0
            preMapR[v] = [1, i]
        else
            pre = preMapR[v]
            dpr[i] = pre[0] * (pre[1] - i) + dpr[pre[1]]
            preMapR[v] = [pre[0] + 1, i]
        end
    }
    result = []
    arr.each_index{
        |i|
        result.append dpl[i] + dpr[i]
    }
    return result
end

# 4
# @param {Integer[]} nums
# @return {Integer[]}
def recover_array(nums)
    nums.sort!
    n2 = nums.length
    map = Array.new(n2){Hash.new}
    cut = Hash.new{0}
    i = 0
    while i < n2
        j = i + 1
        while j < n2
            k = nums[j] - nums[i]
            if k % 2 == 1
                j += 1
                next
            end
            k = k / 2
            if map[i][k] == nil
                cut[k] += 1
                map[i][k] = []
            end
            map[i][k].append j
            j += 1
        end
        i += 1
    end
    cut.keys.each{
        |k|
        if k <= 0
            next
        end
        if cut[k] < n2 / 2
            next
        end
        result = helper(nums, Array.new(n2){0}, 0, k, map, 0)
        if result != nil
            return result
        end
    }
    puts "fuck the case"
    return nil
end
def helper(nums, mask, i, k, map, total)
    if total * 2 == nums.length
        return []
    end
    if i >= nums.length
        return nil
    end
    if mask[i] == 1
        return helper(nums, mask, i + 1, k, map, total)
    end
    v = nums[i]
    if map[i][k] == nil
        # 只能当上边界
        return helper(nums, mask, i + 1, k, map, total)
    end
    map[i][k].each{
        |top|
        if mask[top] == 1
            next
        end
        mask[i] = 1
        mask[top] = 1
        tmp = helper(nums, mask, i + 1, k, map, total + 1)
        if tmp != nil
            tmp.append v + k
            return tmp
        end
        mask[i] = 0
        mask[top] = 0
    }
    # 只能当上边节
    return helper(nums, mask, i + 1, k, map, total)
end

if __FILE__ == $0
    puts "#{recover_array [2,10,6,4,8,12]}"
    puts "#{recover_array [1,50,99,101,150,199]}"
    # puts "#{recover_array [97,46,43,84,64,11,41,35,88,44,52,45,66,93,58,64,79,50,21,23,85,56,94,11,60,72,63,91,43,71,33,17,79,73,67,51,73,61,42,62,65,87,29,58,36,78,76,54,46,84,39,37,76,1,5,47,7,37,76,82,17,40,82,78,27,57,55,70]}"
end