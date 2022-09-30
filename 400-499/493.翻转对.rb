#
# @lc app=leetcode.cn id=493 lang=ruby
#
# [493] 翻转对
#

# @lc code=start
# @param {Integer[]} nums
# @return {Integer}
def reverse_pairs(nums)
    return helper(nums, 0, nums.length - 1)
end

def helper(nums, i, j)
    if i >= j
        return 0
    end
    mid = (i + j) / 2
    result = 0
    result += helper(nums, i, mid)
    result += helper(nums, mid + 1, j)

    x, y = i, mid
    while x <= mid && y <= j 
        while y + 1 <= j && nums[x] > 2 * nums[y + 1]
            y += 1
        end
        result += y - (mid + 1) + 1
        x += 1
    end

    x, y = i, mid + 1
    tmp = []
    while x <= mid || y <= j
        if x > mid
            tmp.append nums[y]
            y += 1
            next
        end
        if y > j
            tmp.append nums[x]
            x += 1
            next
        end
        if nums[x] <= nums[y]
            tmp.append nums[x]
            x += 1
        else
            tmp.append nums[y]
            y += 1
        end
    end
    tmp.each_index{
        |k|
        nums[i + k] = tmp[k]
    }

    return result
end

def reverse_pairs_tle(nums)
    n = nums.length
    result = 0
    l = []
    nums.each_index{
        |i|
        i = n - 1 - i
        v = nums[i]
        j = helper_tle(l, v)
        # puts "#{v}, #{l}, #{j}"
        result += j
        # 将 2 * v 插入到上述的前面的位置
        j = helper_tle(l, 2 * v)

        _l = []
        if j > 0
            _l += l[0..j - 1] 
        end
        _l += [2 * v] 
        if j < l.length
            _l += l[j..-1]
        end
        l = _l
    }
    return result
end

def helper_tle(l, v)
    n = l.length
    if n == 0
        return 0
    end
    if l[-1] < v
        return n
    end
    # []
    i, j = 0, n - 1
    while i < j
        mid = (i + j) / 2
        t = l[mid]
        if t < v
            i = mid + 1
        else
            j = mid
        end
    end
    return i
end
# @lc code=end

if __FILE__ == $0
    puts "#{reverse_pairs [1,3,2,3,1]}"
    puts "#{reverse_pairs [2,4,3,5,1]}"
    puts "#{reverse_pairs [5,4,3,2,1]}"
end
