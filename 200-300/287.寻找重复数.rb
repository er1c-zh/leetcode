#
# @lc app=leetcode.cn id=287 lang=ruby
#
# [287] 寻找重复数
#

# @lc code=start
# @param {Integer[]} nums
# @return {Integer}
def find_duplicate(nums)
    i, j = 1, nums.length
    while true
        mid = (i + j) / 2
        l, r, e = 0, 0, 0
        nums.each{
            |v|
            if v < mid
                l += 1
            elsif v == mid
                e += 1
            else
                r += 1
            end
        }
        if e > 1
            return mid
        end
        if l < mid
            i = mid
        else
            j = mid
        end
    end
end
def find_duplicate_floyd(nums)
    slow, fast = 0, 0

    step = 0

    while true
        step += 1
        slow = nums[slow]
        fast = nums[nums[fast]]
        if slow == fast
            break
        end
    end

    slow, fast = 0, 0
    (0..step-1).each{
        |_|
        fast = nums[fast]
    }
    while true
        slow = nums[slow]
        fast = nums[fast]
        if slow == fast
            return slow
        end
    end

    p "unreachable"
end
# @lc code=end

if __FILE__ == $0
    p [2,5,9,6,9,3,8,9,7,1] 
    p [0,1,2,3,4,5,6,7,8,9]
    p find_duplicate [2,5,9,6,9,3,8,9,7,1]
end
