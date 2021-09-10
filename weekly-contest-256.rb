# 1
# @param {Integer[]} nums
# @param {Integer} k
# @return {Integer}
def minimum_difference(nums, k)
    debug = false
    nums.sort!
    if debug
        puts "#{nums}"
    end
    i, pre = 0, nums[0]
    i, j = 0, k - 1
    min = nums[j] - nums[i]
    while j < nums.length
        if min > nums[j] - nums[i]
            min = nums[j] - nums[i]
        end
        i += 1
        j += 1
    end
    return min
end

# 2
def kth_largest_number(nums, k)
    nums.each_index{
        |i|
        nums[i] = nums[i].to_i
    }
    nums.sort!
    return nums[nums.length - k].to_s
end

# 3
# @param {Integer[]} tasks
# @param {Integer} session_time
# @return {Integer}
def min_sessions(tasks, session_time)
    n = tasks.length
    mask = 1

    dp = Array.new(2 ** n){Array.new(session_time + 1){n + 1}}



    return dp[(2 ** n) - 1].min
end

if __FILE__ == $0
    # p minimum_difference([9,4,1,7], 2)
    # p kth_largest_number(["3","6","7","10"], 4)
    # p min_sessions([1,2,3], 3)
    # p min_sessions([3,1,3,1,1], 8)
    # p min_sessions([1,2,3,4,5], 15)
    # p min_sessions([1,1,2,2,2,2,3,3,6,6,6,6], 10)
    # p min_sessions([1,2,3,3,1,1,3,2,2,1], 11)
    p min_sessions([2,3,3,4,4,4,5,6,7,10], 12)
end
