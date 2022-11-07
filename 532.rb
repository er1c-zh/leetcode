#
# @lc app=leetcode.cn id=532 lang=ruby
#
# [532] 数组中的 k-diff 数对
#

# @lc code=start
# @param {Integer[]} nums
# @param {Integer} k
# @return {Integer}
def find_pairs(nums, k)
    m = Hash.new{0}
    mask = Hash.new
    nums.each{
        |v|
        m[v] = m[v] + 1
    }
    result = 0
    nums.each{
        |v|
        [v - k].each {
            |t|
            if mask["#{t}_#{v}"] != nil || mask["#{v}_#{t}"] != nil
                next
            end
            if t == v
                if m[t] <= 1
                    next
                end
            else
                if m[t] <= 0
                    next
                end
            end
            result += 1
            mask["#{t}_#{v}"] = true
            # puts "#{mask}"
        }
    }
    return result
end
# @lc code=end

if __FILE__ == $0
    puts "#{find_pairs [3,1,4,1,5], 2}"
    puts "#{find_pairs [1,2,3,4,5], 1}"
    puts "#{find_pairs [1,3,1,5,4], 0}"
end
