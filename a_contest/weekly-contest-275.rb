# 1
# @param {Integer[][]} matrix
# @return {Boolean}
def check_valid(matrix)
    n = matrix.length
    matrix.each{
        |v|
        set = Array.new(n){0}
        v.each{
            |_v|
            if _v <= 0 || _v > n || set[_v - 1] != 0
                return false
            end
            set[_v - 1] = true
        }
    }
    j = 0
    while j < n
        set = Array.new(n){0}
        matrix.each{
            |v|
            _v = v[j]
            if _v <= 0 || _v > n || set[_v - 1] != 0
                return false
            end
            set[_v - 1] = true
        }
        j += 1
    end
    return true
end

# 2
# @param {Integer[]} nums
# @return {Integer}
def min_swaps(nums)
    total = 0
    nums.each{
        |v|
        if v == 1
            total += 1
        end
    }
    result = total
    cur_zero = 0
    i = 0
    j = 0
    while j < total
        if nums[j] == 0
            cur_zero += 1
        end
        j += 1
    end
    result = cur_zero
    while i < nums.length
        cur_zero -= (nums[i] == 0 ? 1 : 0)
        cur_zero += (nums[(i + total) % nums.length] == 0 ? 1 : 0)
        if cur_zero < result
            result = cur_zero
        end
        i += 1
    end
    return result
end

# 3
# @param {String[]} start_words
# @param {String[]} target_words
# @return {Integer}
def word_count(start_words, target_words)
    map = Hash.new
    start_words.each{
        |w|
        map[w2i(w)] = true
    }
    result = 0
    target_words.each{
        |w|
        v = w2i(w)
        (0..w.length - 1).each{
            |i|
            to_remove = w[i].ord - 'a'.ord
            mask = (0b11111111111111111111111111 ^ (0b1 << to_remove))
            if map[v & mask] == true
                result += 1
                break
            end
        }
    }
    return result
end
def w2i(s)
    mask = 0x0
    (0..s.length - 1).each{
        |i|
        offset = s[i].ord - 'a'.ord
        mask |= 0b1 << offset
    }
    return mask
end

# 4
# @param {Integer[]} plant_time
# @param {Integer[]} grow_time
# @return {Integer}
def earliest_full_bloom(plant_time, grow_time)
    items = []
    i = 0
    while i < plant_time.length
        items.append [plant_time[i], grow_time[i]]
        i += 1
    end
    day = 0
    result = 0
    items.sort{
        |x, y|
        if y[1] == x[1]
            y[0] <=> x[0]
        else
            y[1] <=> x[1]
        end
    }.each{
        |item|
        if day + item[0] + item[1] > result
            result = day + item[0] + item[1]
        end
        day += item[0]
    }
    return result
end

if __FILE__ == $0
    # puts "#{w2i("abce").to_s(2)}"
    # puts "#{(0b11111111111111111111111111 ^ (0b1 << 0)).to_s(2)}"
    # puts "#{word_count(["abc"], ["abcd"])}"
    # puts "#{earliest_full_bloom([1,4,3], [2,3,1])}"
    # puts "#{earliest_full_bloom([3,11,29,4,4,26,26,12,13,10,30,19,27,2,10], [10,13,22,17,18,15,21,11,24,14,18,23,1,30,6])}"
    # puts "#{earliest_full_bloom([10, 11], [14, 13])}"
    # puts "#{earliest_full_bloom([27,5,24,17,27,4,23,16,6,26,13,17,21,3,9,10,28,26,4,10,28,2], [26,9,14,17,6,14,23,24,11,6,27,14,13,1,15,5,12,15,23,27,28,12])}"
    puts "#{earliest_full_bloom([27,5,24,17,27,4,23,16,6,26,13,17,21,3,9,10,28,26,4,10,28,2], [26,9,14,17,6,14,23,24,11,6,27,14,13,1,15,5,12,15,23,27,28,12])}"
end